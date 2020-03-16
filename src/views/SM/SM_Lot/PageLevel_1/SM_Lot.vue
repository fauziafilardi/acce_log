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
                                <b-col md="12" id="col-left"> <!-- table open -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_lotno" v-model="M_SM_Lot.lotno"  ref="ref_lotno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSCompute :prop="PI_status" v-model="M_SM_Lot.status"  ref="ref_status" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnlottypeChange" :prop="PI_lottype" :value="M_SM_Lot.lottype" :label="M_SM_Lot.lottypeLabel" ref="ref_lottype"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OndirectioncdChange" :prop="PI_directioncd" :value="M_SM_Lot.directioncd" :label="M_SM_Lot.directioncdLabel" ref="ref_directioncd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnpropertytypecdChange" :prop="PI_propertytypecd" :value="M_SM_Lot.propertytypecd" :label="M_SM_Lot.propertytypecdLabel" ref="ref_propertytypecd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnsectorcdChange" :prop="PI_sectorcd" :value="M_SM_Lot.sectorcd" :label="M_SM_Lot.sectorcdLabel" ref="ref_sectorcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @change="OnpropertycategoryChange" :prop="PI_propertycategory" v-model="M_SM_Lot.propertycategory"  ref="ref_propertycategory" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnviewcdChange" :prop="PI_viewcd" :value="M_SM_Lot.viewcd" :label="M_SM_Lot.viewcdLabel" ref="ref_viewcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnblockcdChange" :prop="PI_blockcd" :value="M_SM_Lot.blockcd" :label="M_SM_Lot.blockcdLabel" ref="ref_blockcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnmeasurementcdChange" :prop="PI_measurementcd" :value="M_SM_Lot.measurementcd" :label="M_SM_Lot.measurementcdLabel" ref="ref_measurementcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnfloorcdChange" :prop="PI_floorcd" :value="M_SM_Lot.floorcd" :label="M_SM_Lot.floorcdLabel" ref="ref_floorcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_SM_Lot.descs"  ref="ref_descs"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputRadioButtonVuex @input="OnprogressbillingChange" :prop="PI_progressbilling" v-model="M_SM_Lot.progressbilling"  ref="ref_progressbilling" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_address1" v-model="M_SM_Lot.address1"  ref="ref_address1"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex @input="OngrossareaChange" :prop="PI_grossarea" v-model="M_SM_Lot.grossarea"  ref="ref_grossarea"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="6"></b-col>
                                        <b-col md="6" v-show="err1">
                                            <b-row v-show="err1">
                                                <b-col offset="4"><label class="lbl-value-view-form" style="color:red"> * Gross Area must be less than or equal total floor area</label></b-col>
                                            </b-row>                                            
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_address2" v-model="M_SM_Lot.address2"  ref="ref_address2"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex @input="OnsemigrossChange" :prop="PI_semigrossarea" v-model="M_SM_Lot.semigrossarea"  ref="ref_semigrossarea"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="6"></b-col>
                                        <b-col md="6" v-show="err2 || err3">
                                            <b-row v-show="err2">
                                                <b-col offset="4"><label class="lbl-value-view-form" style="color:red"> * Semi Gross Area must be Less Than or Equal Gross Area</label></b-col>
                                            </b-row>
                                            <b-row v-show="err3">
                                                <b-col offset="4"><label class="lbl-value-view-form" style="color:red"> * Semi Gross Area must be less than or equal total floor area</label></b-col>
                                            </b-row>                                            
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_address3" v-model="M_SM_Lot.address3"  ref="ref_address3"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex @input="OnnetareaChange" :prop="PI_netarea" v-model="M_SM_Lot.netarea"  ref="ref_netarea"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="6"></b-col>
                                        <b-col md="6" v-show="err4 || err5">
                                            <b-row v-show="err4">
                                                <b-col offset="4"><label class="lbl-value-view-form" style="color:red"> * Net Area must be Less Than or Equal Gross Area</label></b-col>
                                            </b-row>
                                            <b-row v-show="err5">
                                                <b-col offset="4"><label class="lbl-value-view-form" style="color:red"> * Net Area must be less than or equal total floor area</label></b-col>
                                            </b-row>                                            
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_address4" v-model="M_SM_Lot.address4"  ref="ref_address4"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_zipcode" v-model="M_SM_Lot.zipcode"  ref="ref_zipcode"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_landarea" v-model="M_SM_Lot.landarea"  ref="ref_landarea"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncitycdChange" :prop="PI_citycd" :value="M_SM_Lot.citycd" :label="M_SM_Lot.citycdLabel" ref="ref_citycd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputRadioButtonVuex @input="OnfurnishedChange" :prop="PI_furnished" v-model="M_SM_Lot.furnished"  ref="ref_furnished" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_totalroom" v-model="M_SM_Lot.totalroom"  ref="ref_totalroom"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_parkinglot" v-model="M_SM_Lot.parkinglot"  ref="ref_parkinglot"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_yeardevelopment" v-model="M_SM_Lot.yeardevelopment"  ref="ref_yeardevelopment"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_electricity" v-model="M_SM_Lot.electricity"  ref="ref_electricity"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSFileUpload :prop="PI_referencefilename" @fileName="getFileName" 
                                                                        v-model="M_SM_Lot.referencefilename" 
                                                                        :file="M_SM_Lot.picturefilename" 
                                                                        :image="M_SM_Lot.referencefilename"
                                                                         ref="ref_referencefilename" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OndocumentchecklistcddescsChange" :prop="PI_documentchecklistcddescs" :value="M_SM_Lot.documentchecklistcddescs" :label="M_SM_Lot.documentchecklistcddescsLabel" ref="ref_documentchecklistcddescs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_commissionbasepriceamt" v-model="M_SM_Lot.commissionbasepriceamt"  ref="ref_commissionbasepriceamt"/>
                                      </b-col>
                                    </b-row>
                                    <div class="div-collapse">
                                        <span class="master-span-form">
                                            Unit Analysis
                                        </span>
                                    </div>
                                </b-col> <!-- table close -->
                  
							</b-row>
							<!-- <ABSTAnalysisLookUp ref="analysisLookUp" :prop="PTAnalysis" v-model="dataT"/> -->
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
    Module:"SM",
    error: false,
    err1: false,
    err2: false,
    err3: false,
    err4: false,
    err5: false,

            propList: {
                initialWhere: "SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_Lot :{
                  address1: '',
                  address2: '',
                  address3: '',
                  address4: '',
                  blockcd: '',
                  blockdescs: '',
                  chargearea: '',
                  citycd: '',
                  citydescs: '',
                  commissionbasepriceamt: '0',
                  descs: '',
                  directioncd: '',
                  directiondescs: '',
                  documentchecklistcd: '',
                  documentchecklistcddescs: '',
                  electricity: '0',
                  floorcd: '',
                  floordescs: '',
                  furnished: 'U',
                  grossarea: '0',
                  insuranceno: '',
                  l0: '',
                  l1: '',
                  l2: '',
                  l3: '',
                  l4: '',
                  l5: '',
                  l6: '',
                  l7: '',
                  l8: '',
                  l9: '',
                  landarea: '0',
                  lastupdatestamp: 0,
                  lotcategorycd: '',
                  lotcategorydescs: '',
                  lotcategorysequenceno: '',
                  lotclasscd: '',
                  lotclassdescs: '',
                  lotclasssequenceno: '',
                  lotno: '',
                  lotthemecd: '',
                  lotthemedescs: '',
                  lottype: '',
                  lottypedescs: '',
                  measurementcd: '',
                  measurementdescs: '',
                  netarea: '0',
                  occupantid: '',
                  ownerid: '',
                  ownername: '',
                  parkinglot: '0',
                  picturefilename: '',
                  progressbilling: 'Y',
                  propertycategory: 'B',
                  propertytypecd: '',
                  referencefilename: '',
                  rentalamt: '',
                  rentalcurrencycd: '',
                  rentalrate: '',
                  salesstatus: '',
                  salesstatusdescs: '',
                  sectorcd: '',
                  sectordescs: '',
                  semigrossarea: '0',
                  servicechargeamt: '',
                  servicechargecurrencycd: '',
                  servicechargerate: '',
                  sinkingfundamt: '',
                  sinkingfundcurrencycd: '',
                  sinkingfundrate: '',
                  status: 'Active',
                  subportfoliocd: '',
                  timeedit: '',
                  timeinput: '',
                  totalroom: '0',
                  useredit: '',
                  userinput: '',
                  viewcd: '',
                  viewdescs: '',
                  yeardevelopment: '0',
                  zipcode: '',
                  rowid: 0,
                    }
            ,
            PI_lotno: { 
                cValidate :'required|max:10', 
                cName: 'lotno', 
                cLabel: 'Unit No', 
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
            PI_status: { 
                cLabel: 'Status', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_lottype: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupTNLotType'    , 
                    ColumnDB: 'LotType'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'LotType,Description' 
                        }, 
                cValidate :'required', 
                cName: 'lottype', 
                cLabel: 'Unit Type', 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'LotType,Description' ,
            }, 
            PI_directioncd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupTNDirection'    , 
                    ColumnDB: 'DirectionCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'DirectionCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'directioncd', 
                cLabel: 'Direction', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 18, 
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
                cDisplayColumn: 'DirectionCd,Descs' ,
            }, 
            PI_propertytypecd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSMPropertyType'    , 
                    ColumnDB: 'PropertyTypeCd'   , 
                    InitialWhere: "SubportfolioCd='"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: '' 
                        }, 
                cValidate :'required', 
                cName: 'propertytypecd', 
                cLabel: 'Property Type', 
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
                cMasterUrl: 'SM/SM_PropertyType' ,
                cDisplayColumn: 'PropertyTypeCd,Descs' ,
            }, 
            PI_sectorcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupTNSector'    , 
                    ColumnDB: 'SectorCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'SectorCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'sectorcd', 
                cLabel: 'Sector', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 19, 
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
                cDisplayColumn: 'SectorCd,Descs' ,
            }, 
            PI_propertycategory: { 
                cValidate :'', 
                cName: 'propertycategory', 
                cId: 'rdbpropertycategory', 
                cRadioOptions: [{ text: 'Building', value: 'B' },{ text: 'Land', value: 'L' },{ text: 'Building & Land', value: 'N' },], 
                cRadioDefaultOption: 'B', 
                cLabel:'Property Category', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 4, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_viewcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupTNView'    , 
                    ColumnDB: 'ViewCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'ViewCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'viewcd', 
                cLabel: 'View', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 20, 
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
                cDisplayColumn: 'ViewCd,Descs' ,
            }, 
            PI_blockcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupTNBlock'    , 
                    ColumnDB: 'BlockCd'   , 
                    InitialWhere: "SubportfolioCd='"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'BlockCode,Description' 
                        }, 
                cValidate :'required', 
                cName: 'blockcd', 
                cLabel: 'Block', 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'BlockCode,Description' ,
            }, 
            PI_measurementcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMMeasurement'    , 
                    ColumnDB: 'MeasurementCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'MeasurementCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'measurementcd', 
                cLabel: 'Measurement', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 21, 
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
                cMasterUrl: 'CM/CM_Measurement' ,
                cDisplayColumn: 'MeasurementCd,Descs' ,
            }, 
            PI_floorcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupTNFloor'    , 
                    ColumnDB: 'FloorCd'   , 
                    InitialWhere: "BlockCd='' AND SubportfolioCd='"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'FloorCd,Descs' 
                        }, 
                cValidate :'required', 
                cName: 'floorcd', 
                cLabel: 'Floor', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 6, 
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
                cDisplayColumn: 'FloorCd,Descs' ,
            }, 
            PI_descs: { 
                cValidate :'', 
                cName: 'descs', 
                cLabel: 'Description', 
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
            PI_progressbilling: { 
                cValidate :'', 
                cName: 'progressbilling', 
                cId: 'rdbprogressbilling', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' },{ text: 'No', value: 'N' },], 
                cRadioDefaultOption: 'Y', 
                cLabel:'Progress Billing', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 22, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_address1: { 
                cValidate :'max:50', 
                cName: 'address1', 
                cLabel: 'Address', 
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
            PI_grossarea: { 
                cValidate :'required|max:12', 
                cName: 'grossarea', 
                cLabel: 'Gross Area', 
                cLabelSize: 4, 
                cOrder: 23, 
                cKey: false, 
                cType: 'decimal',
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
                cOrder: 9, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_semigrossarea: { 
                cValidate :'required|max:12', 
                cName: 'semigrossarea', 
                cLabel: 'Semi Gross Area', 
                cLabelSize: 4, 
                cOrder: 24, 
                cKey: false, 
                cType: 'decimal',
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
                cOrder: 10, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_netarea: { 
                cValidate :'required|max:12', 
                cName: 'netarea', 
                cLabel: 'Net Area', 
                cLabelSize: 4, 
                cOrder: 25, 
                cKey: false, 
                cType: 'decimal',
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
                cOrder: 11, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_zipcode: { 
                cValidate :'', 
                cName: 'zipcode', 
                cLabel: 'Zip Code', 
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
            PI_landarea: { 
                cValidate :'required|max:20', 
                cName: 'landarea', 
                cLabel: 'Land Area', 
                cLabelSize: 4, 
                cOrder: 26, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_citycd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMCity'    , 
                    ColumnDB: 'CityCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'CityCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'citycd', 
                cLabel: 'City', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 13, 
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
            PI_furnished: { 
                cValidate :'', 
                cName: 'furnished', 
                cId: 'rdbfurnished', 
                cRadioOptions: [{ text: 'Un-Furnished', value: 'U' },{ text: 'Semi-Furnished', value: 'S' },{ text: 'Fully-Furnished', value: 'F' },], 
                cRadioDefaultOption: 'U', 
                cLabel:'Furnished', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 27, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_totalroom: { 
                cValidate :'', 
                cName: 'totalroom', 
                cLabel: 'Total Room', 
                cLabelSize: 4, 
                cOrder: 14, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_parkinglot: { 
                cValidate :'', 
                cName: 'parkinglot', 
                cLabel: 'Parking Lot', 
                cLabelSize: 4, 
                cOrder: 28, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_yeardevelopment: { 
                cValidate :'', 
                cName: 'yeardevelopment', 
                cLabel: 'Year Of Development', 
                cLabelSize: 4, 
                cOrder: 15, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_electricity: { 
                cValidate :'', 
                cName: 'electricity', 
                cLabel: 'Electricity', 
                cLabelSize: 4, 
                cOrder: 29, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_referencefilename: { 
              cValidate :'', 
                cName:'referencefilename', 
                cLabel: 'Picture File', 
                cSubPortfolio:this.getDataUser().subportfolio_cd,
                cPath:"SaveLocation/SubPortfolio",
                cLabelSize: 4, 
                cOrder:16, 
                cVisible: true, 
                cModule: 'SM', 
                cPlaceholder: 'Choose a file...', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
            }, 
            PI_documentchecklistcddescs: { 
                dataLookUp: { 
                    LookUpCd: 'GetluDocumentCheckList'    , 
                    ColumnDB: 'DocumentCheckListCd'   , 
                    InitialWhere: "SubPortfolioCd = '"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'DocumentCheckListCd,Descs' 
                        }, 
                cValidate :'required', 
                cName: 'documentchecklistcddescs', 
                cLabel: 'Hand Over Document Check List Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 30, 
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
                cDisplayColumn: 'DocumentCheckListCd,Descs' ,
            }, 
            PI_commissionbasepriceamt: { 
                cValidate :'', 
                cName: 'commissionbasepriceamt', 
                cLabel: 'Commission base price', 
                cLabelSize: 4, 
                cOrder: 17, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

			PTAnalysis: {
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                // cAnalysisType:'Lot Analysis'
            },
            dataT: {}
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
        // CheckFloorAreaLotUpdate (FloorCd,BlockCd,GrossArea,SemiGrossArea,NetArea,LotNo){
        //   var param = {
        //         OptionFunctionCd: "GetCheckFloorAreaLotUpdate",
        //         ModuleCd: this.Module,
        //         SubPortfolioCd: this.getDataUser().subportfolio_cd,
        //         FloorCd: FloorCd,
        //         BlockCd: BlockCd,
        //         GrossArea: GrossArea,
        //         SemiGrossArea: SemiGrossArea,
        //         NetArea: NetArea,
        //         LotNo: LotNo
        //     }

        //     this.FnDynamicFunction(param)
        //     .then(ress => {
        //         if (ress == null) return
        //         var datas = ress[0]
        //         console.log(datas)
        //     })
        // },
        OngrossareaChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                var gross = parseFloat(this.replaceAllString(data, ',', '', 'number'))
                var semigross = parseFloat(this.replaceAllString(this.M_SM_Lot.semigrossarea, ',', '', 'number'))
                var netarea = parseFloat(this.replaceAllString(this.M_SM_Lot.netarea, ',', '', 'number'))

                this.err2 = semigross > gross ? true : false
                this.err4 = netarea > gross ? true : false
            }
            
        })
        this.$forceUpdate()
        },
        OnsemigrossChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                var gross = parseFloat(this.replaceAllString(this.M_SM_Lot.grossarea, ',', '', 'number'))
                var semigross = parseFloat(this.replaceAllString(data, ',', '', 'number'))
                var netarea = parseFloat(this.replaceAllString(this.M_SM_Lot.netarea, ',', '', 'number'))

                this.err2 = semigross > gross ? true : false
            }
        })
        this.$forceUpdate()
        },
        OnnetareaChange (data) {
        this.$nextTick(() => { 
            if (this.inputStatus != "VIEW") {
                var gross = parseFloat(this.replaceAllString(this.M_SM_Lot.grossarea, ',', '', 'number'))
                var semigross = parseFloat(this.replaceAllString(this.M_SM_Lot.semigrossarea, ',', '', 'number'))
                var netarea = parseFloat(this.replaceAllString(data, ',', '', 'number'))

                this.err4 = netarea > gross ? true : false
            }
        })
        this.$forceUpdate()
        },
        OnlottypeChange (data) {
        this.$nextTick(() => {
            this.M_SM_Lot.lottype = data.id
            this.M_SM_Lot.lottypeLabel = data.label
            if (this.inputStatus != "VIEW") {
//{lottype}
            }
        })
        this.$forceUpdate()
        },
        OndirectioncdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Lot.directioncd = data.id
            this.M_SM_Lot.directioncdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{directioncd}
            }
        })
        this.$forceUpdate()
        },
        OnpropertytypecdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Lot.propertytypecd = data.id
            this.M_SM_Lot.propertytypecdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{propertytypecd}
            }
        })
        this.$forceUpdate()
        },
        OnsectorcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Lot.sectorcd = data.id
            this.M_SM_Lot.sectorcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{sectorcd}
            }
        })
        this.$forceUpdate()
        },
        OnpropertycategoryChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{propertycategory}
                if(data == "B"){
                  this.PI_landarea.cProtect = true
                }
                else{
                  this.PI_landarea.cProtect = false
                }
            }
        })
        this.$forceUpdate()
        },
        OnviewcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Lot.viewcd = data.id
            this.M_SM_Lot.viewcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{viewcd}
            }
        })
        this.$forceUpdate()
        },
        OnblockcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Lot.blockcd = data.id
            this.M_SM_Lot.blockcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{blockcd}     
                this.PI_floorcd.dataLookUp.InitialWhere = "BlockCd='"+data.id+"' AND SubportfolioCd='"+this.getDataUser().subportfolio_cd+"'"
            }
        })
        this.$forceUpdate()
        },
        OnmeasurementcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Lot.measurementcd = data.id
            this.M_SM_Lot.measurementcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{measurementcd}
            }
        })
        this.$forceUpdate()
        },
        OnfloorcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Lot.floorcd = data.id
            this.M_SM_Lot.floorcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{floorcd}
            }
        })
        this.$forceUpdate()
        },
        OnprogressbillingChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{progressbilling}
            }
        })
        this.$forceUpdate()
        },
        OncitycdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Lot.citycd = data.id
            this.M_SM_Lot.citycdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{citycd}
            }
        })
        this.$forceUpdate()
        },
        OnfurnishedChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{furnished}
            }
        })
        this.$forceUpdate()
        },
        OndocumentchecklistcddescsChange (data) {
        this.$nextTick(() => {
            this.M_SM_Lot.documentchecklistcddescs = data.id
            this.M_SM_Lot.documentchecklistcddescsLabel = data.label
            if (this.inputStatus != "VIEW") {
//{documentchecklistcddescs}
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
		M_CheckboxChecked(data, status, index){

        },		
        M_Post(dt){
        },
        M_Insert() {
          var param = {
                OptionFunctionCd: "GetCheckFloorAreaLotUpdate",
                ModuleCd: this.Module,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                FloorCd: this.M_SM_Lot.floorcd,
                BlockCd: this.M_SM_Lot.blockcd,
                GrossArea: this.M_SM_Lot.grossarea,
                SemiGrossArea: this.M_SM_Lot.semigrossarea,
                NetArea: this.M_SM_Lot.netarea,
                LotNo: this.M_SM_Lot.lotno,
            }

            this.FnDynamicFunction(param)
            .then(ress => {
                if (ress == null) return
                var datas = ress[0]
                // console.log(datas)
                if(datas.GrossStatus == "1" || datas.SemiGrossStatus == "1" || datas.NetStatus == "1"){
                  this.error = true
                  this.err1 = true
                  this.err3 = true
                  this.err5 = true
                  return
                }else{
                  this.err1 = false
                  this.err3 = false
                  this.err5 = false
                  this.error = false
                  this.M_InsertOR()
                }

                

            })
        },
        M_InsertOR() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                PropertyCategory: this.M_SM_Lot.propertycategory,
                PropertyTypeCd: this.M_SM_Lot.propertytypecd == '' || this.M_SM_Lot.propertytypecd == null ? 'NULL' : this.M_SM_Lot.propertytypecd ,
                LotNo: this.M_SM_Lot.lotno,
                LotType: this.M_SM_Lot.lottype == '' || this.M_SM_Lot.lottype == null ? 'NULL' : this.M_SM_Lot.lottype ,
                BlockCd: this.M_SM_Lot.blockcd == '' || this.M_SM_Lot.blockcd == null ? 'NULL' : this.M_SM_Lot.blockcd ,
                FloorCd: this.M_SM_Lot.floorcd == '' || this.M_SM_Lot.floorcd == null ? 'NULL' : this.M_SM_Lot.floorcd ,
                Descs: this.M_SM_Lot.descs,
                Address1: this.M_SM_Lot.address1,
                Address2: this.M_SM_Lot.address2,
                Address3: this.M_SM_Lot.address3,
                Address4: this.M_SM_Lot.address4,
                CityCd: this.M_SM_Lot.citycd,
                ZipCode: this.M_SM_Lot.zipcode,
                LotThemeCd: this.M_SM_Lot.lotthemecd == '' || this.M_SM_Lot.lotthemecd == null ? 'NULL' : this.M_SM_Lot.lotthemecd,
                LotClassCd: this.M_SM_Lot.lotclasscd == '' || this.M_SM_Lot.lotclasscd == null ? 'NULL' : this.M_SM_Lot.lotclasscd,
                OwnerId: this.M_SM_Lot.ownerid,
                DirectionCd: this.M_SM_Lot.directioncd == '' || this.M_SM_Lot.directioncd == null ? 'NULL' : this.M_SM_Lot.directioncd ,
                SectorCd: this.M_SM_Lot.sectorcd == '' || this.M_SM_Lot.sectorcd == null ? 'NULL' : this.M_SM_Lot.sectorcd ,
                ViewCd: this.M_SM_Lot.viewcd == '' || this.M_SM_Lot.viewcd == null ? 'NULL' : this.M_SM_Lot.viewcd ,
                MeasurementCd: this.M_SM_Lot.measurementcd == '' || this.M_SM_Lot.measurementcd == null ? 'NULL' : this.M_SM_Lot.measurementcd ,
                GrossArea: this.M_SM_Lot.grossarea,
                SemiGrossArea: this.M_SM_Lot.semigrossarea,
                NetArea: this.M_SM_Lot.netarea,
                LandArea: this.M_SM_Lot.landarea,
                Furnished: this.M_SM_Lot.furnished,
                ProgressBilling: this.M_SM_Lot.progressbilling,
                TotalRoom: this.M_SM_Lot.totalroom,
                YearDevelopment: this.M_SM_Lot.yeardevelopment,
                ParkingLot: this.M_SM_Lot.parkinglot,
                Electricity: this.M_SM_Lot.electricity,
                PictureFileName: this.M_SM_Lot.picturefilename,
                ReferenceFileName: this.M_SM_Lot.referencefilename,
                DocumentCheckListCd: this.M_SM_Lot.documentchecklistcd,
                L0: this.M_SM_Lot.l0 == '' || this.M_SM_Lot.l0 == null ? 'NULL' : this.M_SM_Lot.l0,
                L1: this.M_SM_Lot.l1 == '' || this.M_SM_Lot.l1 == null ? 'NULL' : this.M_SM_Lot.l1,
                L2: this.M_SM_Lot.l2 == '' || this.M_SM_Lot.l2 == null ? 'NULL' : this.M_SM_Lot.l2,
                L3: this.M_SM_Lot.l3 == '' || this.M_SM_Lot.l3 == null ? 'NULL' : this.M_SM_Lot.l3,
                L4: this.M_SM_Lot.l4 == '' || this.M_SM_Lot.l4 == null ? 'NULL' : this.M_SM_Lot.l4,
                L5: this.M_SM_Lot.l5 == '' || this.M_SM_Lot.l5 == null ? 'NULL' : this.M_SM_Lot.l5,
                L6: this.M_SM_Lot.l6 == '' || this.M_SM_Lot.l6 == null ? 'NULL' : this.M_SM_Lot.l6,
                L7: this.M_SM_Lot.l7 == '' || this.M_SM_Lot.l7 == null ? 'NULL' : this.M_SM_Lot.l7,
                L8: this.M_SM_Lot.l8 == '' || this.M_SM_Lot.l8 == null ? 'NULL' : this.M_SM_Lot.l8,
                L9: this.M_SM_Lot.l9 == '' || this.M_SM_Lot.l9 == null ? 'NULL' : this.M_SM_Lot.l9,
                UserInput: this.getDataUser().user_id ,
                CommissionBasePriceAmt: this.M_SM_Lot.commissionbasepriceamt                
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
                OptionFunctionCd: "GetCheckFloorAreaLotUpdate",
                ModuleCd: this.Module,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                FloorCd: this.M_SM_Lot.floorcd,
                BlockCd: this.M_SM_Lot.blockcd,
                GrossArea: this.M_SM_Lot.grossarea,
                SemiGrossArea: this.M_SM_Lot.semigrossarea,
                NetArea: this.M_SM_Lot.netarea,
                LotNo: this.M_SM_Lot.lotno,
            }

            this.FnDynamicFunction(param)
            .then(ress => {
                if (ress == null) return
                var datas = ress[0]
                // console.log(datas)
                if(datas.GrossStatus == "1" || datas.SemiGrossStatus == "1" || datas.NetStatus == "1"){
                  this.error = true
                  this.err1 = true
                  this.err3 = true
                  this.err5 = true
                  return
                }else{
                  this.err1 = false
                  this.err3 = false
                  this.err5 = false
                  this.error = false
                  this.M_UpdateOR()
                }

                

            })
        },
        M_UpdateOR() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                PropertyCategory: this.M_SM_Lot.propertycategory,
                PropertyTypeCd: this.M_SM_Lot.propertytypecd == '' || this.M_SM_Lot.propertytypecd == null ? 'NULL' : this.M_SM_Lot.propertytypecd ,
                LotNo: this.M_SM_Lot.lotno,
                LotType: this.M_SM_Lot.lottype == '' || this.M_SM_Lot.lottype == null ? 'NULL' : this.M_SM_Lot.lottype ,
                BlockCd: this.M_SM_Lot.blockcd == '' || this.M_SM_Lot.blockcd == null ? 'NULL' : this.M_SM_Lot.blockcd ,
                FloorCd: this.M_SM_Lot.floorcd == '' || this.M_SM_Lot.floorcd == null ? 'NULL' : this.M_SM_Lot.floorcd ,
                Descs: this.M_SM_Lot.descs,
                Address1: this.M_SM_Lot.address1,
                Address2: this.M_SM_Lot.address2,
                Address3: this.M_SM_Lot.address3,
                Address4: this.M_SM_Lot.address4,
                CityCd: this.M_SM_Lot.citycd,
                ZipCode: this.M_SM_Lot.zipcode,
                LotThemeCd: this.M_SM_Lot.lotthemecd == '' || this.M_SM_Lot.lotthemecd == null ? 'NULL' : this.M_SM_Lot.lotthemecd,
                LotClassCd: this.M_SM_Lot.lotclasscd == '' || this.M_SM_Lot.lotclasscd == null ? 'NULL' : this.M_SM_Lot.lotclasscd,
                OwnerId: this.M_SM_Lot.ownerid,
                DirectionCd: this.M_SM_Lot.directioncd == '' || this.M_SM_Lot.directioncd == null ? 'NULL' : this.M_SM_Lot.directioncd ,
                SectorCd: this.M_SM_Lot.sectorcd == '' || this.M_SM_Lot.sectorcd == null ? 'NULL' : this.M_SM_Lot.sectorcd ,
                ViewCd: this.M_SM_Lot.viewcd == '' || this.M_SM_Lot.viewcd == null ? 'NULL' : this.M_SM_Lot.viewcd ,
                ProgressBilling: this.M_SM_Lot.progressbilling,
                MeasurementCd: this.M_SM_Lot.measurementcd == '' || this.M_SM_Lot.measurementcd == null ? 'NULL' : this.M_SM_Lot.measurementcd ,
                GrossArea: this.M_SM_Lot.grossarea,
                SemiGrossArea: this.M_SM_Lot.semigrossarea,
                NetArea: this.M_SM_Lot.netarea,
                LandArea: this.M_SM_Lot.landarea,
                Furnished: this.M_SM_Lot.furnished,
                TotalRoom: this.M_SM_Lot.totalroom,
                YearDevelopment: this.M_SM_Lot.yeardevelopment,
                ParkingLot: this.M_SM_Lot.parkinglot,
                Electricity: this.M_SM_Lot.electricity,
                PictureFileName: this.M_SM_Lot.picturefilename,
                ReferenceFileName: this.M_SM_Lot.referencefilename,
                DocumentCheckListCd: this.M_SM_Lot.documentchecklistcd,
                L0: this.M_SM_Lot.l0 == '' || this.M_SM_Lot.l0 == null ? 'NULL' : this.M_SM_Lot.l0,
                L1: this.M_SM_Lot.l1 == '' || this.M_SM_Lot.l1 == null ? 'NULL' : this.M_SM_Lot.l1,
                L2: this.M_SM_Lot.l2 == '' || this.M_SM_Lot.l2 == null ? 'NULL' : this.M_SM_Lot.l2,
                L3: this.M_SM_Lot.l3 == '' || this.M_SM_Lot.l3 == null ? 'NULL' : this.M_SM_Lot.l3,
                L4: this.M_SM_Lot.l4 == '' || this.M_SM_Lot.l4 == null ? 'NULL' : this.M_SM_Lot.l4,
                L5: this.M_SM_Lot.l5 == '' || this.M_SM_Lot.l5 == null ? 'NULL' : this.M_SM_Lot.l5,
                L6: this.M_SM_Lot.l6 == '' || this.M_SM_Lot.l6 == null ? 'NULL' : this.M_SM_Lot.l6,
                L7: this.M_SM_Lot.l7 == '' || this.M_SM_Lot.l7 == null ? 'NULL' : this.M_SM_Lot.l7,
                L8: this.M_SM_Lot.l8 == '' || this.M_SM_Lot.l8 == null ? 'NULL' : this.M_SM_Lot.l8,
                L9: this.M_SM_Lot.l9 == '' || this.M_SM_Lot.l9 == null ? 'NULL' : this.M_SM_Lot.l9,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_Lot.lastupdatestamp,
                CommissionBasePriceAmt: this.M_SM_Lot.commissionbasepriceamt                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_Lot = {
                  address1: '',
                  address2: '',
                  address3: '',
                  address4: '',
                  blockcd: '',
                  blockdescs: '',
                  chargearea: '',
                  citycd: '',
                  citydescs: '',
                  commissionbasepriceamt: '',
                  descs: '',
                  directioncd: '',
                  directiondescs: '',
                  documentchecklistcd: '',
                  documentchecklistcddescs: '',
                  electricity: '',
                  floorcd: '',
                  floordescs: '',
                  furnished: 'U',
                  grossarea: '0',
                  insuranceno: '',
                  l0: '',
                  l1: '',
                  l2: '',
                  l3: '',
                  l4: '',
                  l5: '',
                  l6: '',
                  l7: '',
                  l8: '',
                  l9: '',
                  landarea: '0',
                  lastupdatestamp: 0,
                  lotcategorycd: '',
                  lotcategorydescs: '',
                  lotcategorysequenceno: '',
                  lotclasscd: '',
                  lotclassdescs: '',
                  lotclasssequenceno: '',
                  lotno: '',
                  lotthemecd: '',
                  lotthemedescs: '',
                  lottype: '',
                  lottypedescs: '',
                  measurementcd: '',
                  measurementdescs: '',
                  netarea: '0',
                  occupantid: '',
                  ownerid: '',
                  ownername: '',
                  parkinglot: '',
                  picturefilename: '',
                  progressbilling: 'Y',
                  propertycategory: 'B',
                  propertytypecd: '',
                  referencefilename: '',
                  rentalamt: '',
                  rentalcurrencycd: '',
                  rentalrate: '',
                  salesstatus: '',
                  salesstatusdescs: '',
                  sectorcd: '',
                  sectordescs: '',
                  semigrossarea: '0',
                  servicechargeamt: '',
                  servicechargecurrencycd: '',
                  servicechargerate: '',
                  sinkingfundamt: '',
                  sinkingfundcurrencycd: '',
                  sinkingfundrate: '',
                  status: 'Active',
                  subportfoliocd: '',
                  timeedit: '',
                  timeinput: '',
                  totalroom: '',
                  useredit: '',
                  userinput: '',
                  viewcd: '',
                  viewdescs: '',
                  yeardevelopment: '',
                  zipcode: '',
                  rowid: 0,
                    }
            	
	
		},
        M_New(){
          this.$refs.ref_lotno.focus()
        },
        M_Edit(){
          this.$refs.ref_lottype.focus()
        },
        M_Delete(dt){       
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {
        // console.log(value)
				
				dataDelete.push({
					_Message_:'',
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
                    LotNo: value.LotNo,
                    LastUpdateStamp: value.LastUpdateStamp,


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
          // console.log(record)
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                lotno: record.LotNo
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                // console.log(data)
this.M_SM_Lot = {
            address1: data.address1,
            address2: data.address2,
            address3: data.address3,
            address4: data.address4,
            blockcd: data.blockcd,
            blockdescs: data.blockdescs,
            chargearea: data.chargearea,
            citycd: data.citycd,
            citydescs: data.citydescs,
            commissionbasepriceamt: this.isCurrency(data.commissionbasepriceamt, data.decimal),
            descs: data.descs,
            directioncd: data.directioncd,
            directiondescs: data.directiondescs,
            documentchecklistcd: data.documentchecklistcd,
            documentchecklistcddescs: data.documentchecklistcddescs,
            electricity: data.electricity,
            floorcd: data.floorcd,
            floordescs: data.floordescs,
            furnished: data.furnished,
            grossarea: this.isCurrency(data.grossarea, data.decimal),
            insuranceno: data.insuranceno,
            l0: data.l0,
            l1: data.l1,
            l2: data.l2,
            l3: data.l3,
            l4: data.l4,
            l5: data.l5,
            l6: data.l6,
            l7: data.l7,
            l8: data.l8,
            l9: data.l9,
            landarea: this.isCurrency(data.landarea, data.decimal),
            lastupdatestamp: record.LastUpdateStamp,
            lotcategorycd: data.lotcategorycd,
            lotcategorydescs: data.lotcategorydescs,
            lotcategorysequenceno: data.lotcategorysequenceno,
            lotclasscd: data.lotclasscd,
            lotclassdescs: data.lotclassdescs,
            lotclasssequenceno: data.lotclasssequenceno,
            lotno: data.lotno,
            lotthemecd: data.lotthemecd,
            lotthemedescs: data.lotthemedescs,
            lottype: data.lottype,
            lottypedescs: data.lottypedescs,
            measurementcd: data.measurementcd,
            measurementdescs: data.measurementdescs,
            netarea: this.isCurrency(data.netarea, data.decimal),
            occupantid: data.occupantid,
            ownerid: data.ownerid,
            ownername: data.ownername,
            parkinglot: data.parkinglot,
            picturefilename: data.picturefilename,
            progressbilling: data.progressbilling,
            propertycategory: data.propertycategory,
            propertytypecd: data.propertytypecd,
            referencefilename: data.referencefilename,
            rentalamt: data.rentalamt,
            rentalcurrencycd: data.rentalcurrencycd,
            rentalrate: data.rentalrate,
            salesstatus: data.salesstatus,
            salesstatusdescs: data.salesstatusdescs,
            sectorcd: data.sectorcd,
            sectordescs: data.sectordescs,
            semigrossarea: this.isCurrency(data.semigrossarea, data.decimal),
            servicechargeamt: data.servicechargeamt,
            servicechargecurrencycd: data.servicechargecurrencycd,
            servicechargerate: data.servicechargerate,
            sinkingfundamt: data.sinkingfundamt,
            sinkingfundcurrencycd: data.sinkingfundcurrencycd,
            sinkingfundrate: data.sinkingfundrate,
            status: data.status,
            subportfoliocd: data.subportfoliocd,
            timeedit: data.timeedit,
            timeinput: data.timeinput,
            totalroom: data.totalroom,
            useredit: data.useredit,
            userinput: data.userinput,
            viewcd: data.viewcd,
            viewdescs: data.viewdescs,
            yeardevelopment: data.yeardevelopment,
            zipcode: data.zipcode,
                    }
                 
                //  for (let a = 2; a <= 30; a++) {
                //     this.dataT['L'+a] = data['l'+a]
                //     this.dataT['L'+a+'label'] = data['l'+a]
                // }

                this.M_SM_Lot.lottypeLabel = this.M_SM_Lot.lottype != null && this.M_SM_Lot.lottype != '' ? data.lottype + this.separator + data.lottypedescs :'' 
                this.M_SM_Lot.directioncdLabel = this.M_SM_Lot.directioncd != null && this.M_SM_Lot.directioncd != '' ? data.directioncd + this.separator + data.directiondescs :'' 
                this.M_SM_Lot.propertytypecdLabel = this.M_SM_Lot.propertytypecd != null && this.M_SM_Lot.propertytypecd != '' ? data.propertytypecd :'' 
                this.M_SM_Lot.sectorcdLabel = this.M_SM_Lot.sectorcd != null && this.M_SM_Lot.sectorcd != '' ? data.sectorcd + this.separator + data.sectordescs :'' 
                this.M_SM_Lot.viewcdLabel = this.M_SM_Lot.viewcd != null && this.M_SM_Lot.viewcd != '' ? data.viewcd + this.separator + data.viewdescs :'' 
                this.M_SM_Lot.blockcdLabel = this.M_SM_Lot.blockcd != null && this.M_SM_Lot.blockcd != '' ? data.blockcd + this.separator + data.blockdescs :'' 
                this.M_SM_Lot.measurementcdLabel = this.M_SM_Lot.measurementcd != null && this.M_SM_Lot.measurementcd != '' ? data.measurementcd + this.separator + data.measurementdescs :'' 
                this.M_SM_Lot.floorcdLabel = this.M_SM_Lot.floorcd != null && this.M_SM_Lot.floorcd != '' ? data.floorcd + this.separator + data.floordescs :'' 
                this.M_SM_Lot.citycdLabel = this.M_SM_Lot.citycd != null && this.M_SM_Lot.citycd != '' ? data.citycd + this.separator + data.citydescs :'' 
                this.M_SM_Lot.documentchecklistcddescsLabel = this.M_SM_Lot.documentchecklistcddescs != null && this.M_SM_Lot.documentchecklistcddescs != '' ? data.documentchecklistcd + this.separator + data.documentchecklistcddescs :'' 

                // this.$refs.analysisLookUp.OnInput()

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

            })
        }
        ,getFileName(fileName) {
         this.M_SM_Lot.picturefilename = fileName 
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

