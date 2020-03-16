<template>
    <div>
        <b-row style="padding-top:10px; padding-right: 10px; padding-left: 20px; padding-bottom: 10px; !important; height: 1300px !important;">
            <b-col sm="4">
                <ABSButton @click="openFormRptParameter1" icon="plus" text="Add" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton @click="M_Delete" icon="trash" text="Delete" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <ABSButton @click="moveUpDown('U','1')" icon="arrow-up" text="Up" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton @click="moveUpDown('D','1')" icon="arrow-down" text="Down" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <div>Position 1(Left Side)</div>
                <ABSMultiSelect
                    id="MySelect"
                    v-model="formRptParameter1Selected"
                    :options="formRptParameter1"
                    :multi="false"
                    @change="beforeGetDataBy"
                    size=10
                    class="selectCustom"
                    :disabled="listDisabled"
                    style="margin-top:5px !important;"
                />
            </b-col>
             <b-col sm="4">
                <ABSButton @click="openFormRptParameter2" icon="plus" text="Add" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton @click="M_Delete" icon="trash" text="Delete" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <ABSButton @click="moveUpDown('U','2')" icon="arrow-up" text="Up" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton @click="moveUpDown('D','2')" icon="arrow-down" text="Down" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <div>Position 2(Right Side)</div>
                <ABSMultiSelect
                    v-model="formRptParameter2Selected"
                    :options="formRptParameter2"
                    :multi="false"
                    @change="beforeGetDataBy"
                    size=10
                    class="selectCustom"
                    :disabled="listDisabled"
                    style="margin-top:5px !important;"
                />
            </b-col>
            <b-col sm="4" id="col-left" class="bColMasterForm">
                <ABSButton @click="M_Save" icon="save" text="Save" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton @click="M_Cancel" icon="ban" text="Cancel" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                    <b-row style="padding-left:20px; padding-top:10px;">					
                        <b-col md="12" id="col-left"> <!-- table open -->
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSInputSelect2 @change="OncopyfromcolumnChange" :prop="PI_copyfromcolumn" :value="M_SS_ReportParameterD.copyfromcolumn" :label="M_SS_ReportParameterD.copyfromcolumnLabel"  ref="ref_copyfromcolumn"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="5" class="lbl-col-align" style="right: -4px;">
                                    <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">Row</label>
                                </b-col>
                                <b-col  md="1" style="margin-left: 17px;">
                                    <ABSTextBoxOnly  :prop="PI_rowno" v-model="M_SS_ReportParameterD.rowno" ref="ref_rowno"/>
                                </b-col>
                                <b-col md="1" class="lbl-col-align">
                                    <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">Tab</label>
                                </b-col>
                                <b-col md="1" style="margin-left: 13px;">
                                    <ABSTextBoxOnly  :prop="PI_taborder" v-model="M_SS_ReportParameterD.taborder" ref="ref_taborder"/>
                                </b-col>
                                 <b-col md="1" class="lbl-col-align">
                                    <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">Pst</label>
                                </b-col>
                                <b-col md="1" style="margin-left: 13px;">
                                    <ABSTextBoxOnly  :prop="PI_position" v-model="M_SS_ReportParameterD.position" ref="ref_position"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSinputTextVuex :prop="PI_columnname" v-model="M_SS_ReportParameterD.paramname" ref="ref_columnname"/>
                                </b-col>
                            </b-row>
                            
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSInputSelect2 @change="OncolumntypeChange" :prop="PI_columntype" :value="M_SS_ReportParameterD.columntype" :label="M_SS_ReportParameterD.columntypeLabel"  ref="ref_columntype"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSinputTextVuex :prop="PI_label" v-model="M_SS_ReportParameterD.label"  ref="ref_label"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSInputSelect2 @change="OndefaultvalueChange" :prop="PI_defaultvalue" :value="M_SS_ReportParameterD.defaultvalue" :label="M_SS_ReportParameterD.defaultvalueLabel"  ref="ref_defaultvalue"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSinputTextVuex :prop="PI_defaultvalue2" v-model="M_SS_ReportParameterD.defaultvalue2" ref="ref_defaultvalue2"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSTextAreaVuex :prop="PI_setvalue" v-model="M_SS_ReportParameterD.setvalue"  ref="ref_setvalue"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSinputTextVuex :prop="PI_includeparameter" v-model="M_SS_ReportParameterD.includeparameter"  ref="ref_includeparameter"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSinputRadioButtonVuex :prop="PI_required" v-model="M_SS_ReportParameterD.isrequired"  ref="ref_isrequired"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSinputRadioButtonVuex :prop="PI_visible" v-model="M_SS_ReportParameterD.isvisible"  ref="ref_isvisible"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSinputRadioButtonVuex :prop="PI_column" v-model="M_SS_ReportParameterD.iscolumn"  ref="ref_iscolumn"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSinputRadioButtonVuex :prop="PI_disabled" v-model="M_SS_ReportParameterD.isdisabled"  ref="ref_isdisabled"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSinputTextVuex :prop="PI_maxlength" v-model="M_SS_ReportParameterD.maxlength"  ref="ref_maxlength"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSinputRadioButtonVuex :prop="PI_isparam" v-model="M_SS_ReportParameterD.isparam"  ref="ref_isparam"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSinputTextVuex :prop="PI_cntreportpath" v-model="M_SS_ReportParameterD.cntreportpath"  ref="ref_cntreportpath"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSinputRadioButtonVuex :prop="PI_comptfail" v-model="M_SS_ReportParameterD.iscomptfail"  ref="ref_comptfail"/>
                                </b-col>
                            </b-row>
                            <div class="div-collapse">
                                <span class="master-span-form">
                                    Lookup Code
                                </span>
                            </div>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSInputSelectList @change="OnlookupcdChange" :prop="PI_lookupcd" :value="M_SS_ReportParameterD.lookupcd" :label="M_SS_ReportParameterD.lookupcdLabel"  ref="ref_lookupcd"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="8">
                                    <ABSinputTextVuex :prop="PI_viewname" v-model="M_SS_ReportParameterD.viewname"  ref="ref_viewname"/>
                                </b-col>
                                <b-col md="1">
                                    <b-button style="font-size: 10px;padding-top: 2px;padding-bottom: 4px;" :disabled="inputStatus=='VIEW'" @click="goModal"><font-awesome-icon icon="list" class="icon-style-1"/></b-button>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSinputTextVuex :prop="PI_lookupdb" v-model="M_SS_ReportParameterD.lookupdb"  ref="ref_lookupdb"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSinputTextVuex :prop="PI_displaycolumn" v-model="M_SS_ReportParameterD.displaycolumn"  ref="ref_displaycolumn"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSinputTextVuex :prop="PI_sourcefield" v-model="M_SS_ReportParameterD.sourcefield"  ref="ref_sourcefield"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSinputTextVuex :prop="PI_displaylookup" v-model="M_SS_ReportParameterD.displaylookup"  ref="ref_displaylookup"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSTextAreaVuex :prop="PI_lookupinitialwhere" v-model="M_SS_ReportParameterD.lookupinitialwhere"  ref="ref_lookupinitialwhere"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSinputTextVuex :prop="PI_sortfield" v-model="M_SS_ReportParameterD.lookupsortfield"  ref="ref_lookupsortfield"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSinputTextVuex :prop="PI_setcolumnvalue" v-model="M_SS_ReportParameterD.setcolumnvalue"  ref="ref_setcolumnvalue"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSinputTextVuex :prop="PI_setcolumnwhere" v-model="M_SS_ReportParameterD.setcolumnwhere"  ref="ref_setcolumnwhere"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSInputSelect2 @change="OntriggerfieldChange" :prop="PI_onchangetriggerfield" :value="M_SS_ReportParameterD.onchangetriggerfield" :label="M_SS_ReportParameterD.onchangetriggerfieldLabel"  ref="ref_onchangetriggerfield"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSinputTextVuex :prop="PI_onchangetriggerinitialwhere" v-model="M_SS_ReportParameterD.onchangetriggerinitialwhere"  ref="ref_onchangetriggerinitialwhere"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSinputTextVuex :prop="PI_paramview" v-model="M_SS_ReportParameterD.paramviewlookup"  ref="ref_paramview"/>
                                </b-col>
                            </b-row>
                             <b-row>
                                <b-col md="2" ></b-col> 
                                <b-col md="10">
                                    <ABSInputSelect2 @change="OnanalysistypeChange" :prop="PI_analysistype" :value="M_SS_ReportParameterD.analysistype" :label="M_SS_ReportParameterD.analysistypeLabel" ref="ref_analysistype"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col>
                                    <b-button size="sm" :disabled="inputStatus=='VIEW'" class="float-right btnModal__btnCancel" @click="M_Cancel">
                                        Cancel
                                    </b-button>
                                    <b-button size="sm" :disabled="inputStatus=='VIEW'" class="float-right btnModal__btnOK" variant="primary" @click="M_Save">
                                        OK
                                    </b-button>
                                </b-col>
                            </b-row>
                        </b-col> <!-- table close -->
                        
                    </b-row>
                    <ABSTAnalysis :prop="PTAnalysis" />
                </b-form>
            </b-col>
             <b-col sm="4" style="position: relative !important; top: -460px !important;">
                <ABSButton @click="openFormRptParameter0" icon="plus" text="Add" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton @click="M_Delete" icon="trash" text="Delete" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <ABSButton :disabled="true" @click="moveUpDown('U','0')" icon="arrow-up" text="Up" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton :disabled="true" @click="moveUpDown('D','0')" icon="arrow-down" text="Down" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <div>Position 0</div>
                <ABSMultiSelect
                  v-model="formRptParameter0Selected"
                  :options="formRptParameter0"
                  :multi="false"
                  size=5
                  @change="beforeGetDataBy"
                  class="selectCustom"
                  :disabled="listDisabled"
                  style="margin-top:5px !important;"
                />
            </b-col>
        </b-row>
        <!-- <b-row style="padding-top:10px; padding-right: 10px; padding-left: 20px; padding-bottom: 10px; !important;">
            <b-col sm="4">
                <ABSButton @click="openFormRptParameter0" icon="plus" text="Add" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton @click="M_Delete" icon="trash" text="Delete" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <ABSButton @click="moveUpDown('U','E')" icon="arrow-up" text="Up" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton @click="moveUpDown('D','E')" icon="arrow-down" text="Down" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <div>Position 0</div>
                <ABSMultiSelect
                  v-model="formRptParameter0Selected"
                  :options="formRptParameter0"
                  :multi="false"
                  size=5
                  @change="getDataBy"
                  class="selectCustom"
                  :disabled="listDisabled"
                  style="margin-top:5px !important;"
                />
            </b-col>
        </b-row> -->
    </div>
</template>

<script>
import MyModal from'./SS_ViewModal.vue'
export default {
    props: {PageLevel: '', TabIndex: '', data: ''}, 
    data() {
        return {
            listDisabled: false,
            tempParam: {},
            Module: "SS",
            FormType: "View",
            counter: 0,
            formRptParameter1Selected: null,
            formRptParameter1: [],
            formRptParameter2Selected: null,
            formRptParameter2:[],
            formRptParameter0Selected: null,
            formRptParameter0:[],  
            formRptParameter0Temp: [],
            widthModal :'80%',
            paragraphs: [true],
            timer: null,
            dataModal:[],
            IEBy: {Input: '', Edit: ''},
            M_SS_ReportParameterD :{
                optionseq: '',
                reportname: '',
                pathname: '',
                paramname: '',
                label: '',
                columntype: '',
                defaultvalue: '',
                defaultvalue2: '',
                setvalue: '',
                isrequired: 'False',
                isvisible: 'True',
                iscolumn: 'False',
                taborder: '',
                maxlength: '',
                rowno: '',
                position: '',
                lookupcd: '',
                lookupdb: '',
                lookupinitialwhere: '',
                setcolumnvalue: '',
                setcolumnwhere: '',
                onchangetriggerfield: '',
                onchangetriggerinitialwhere: '',
                userinput: '',
                useredit: '',
                timeinput: '',
                timeedit: '',
                displaycolumn: '',
                iscomptfail: '',
                cntreportpath: '',
                isparam: '',
                lookupsortfield: '',
                sourcefield: '',
                displaylookup: '',
                isdisabled: '',
                paramviewlookup: '',
                analysistype: '',
                id: 0,
                viewname: '',
                includeparameter: ''
            },
            PI_copyfromcolumn: { 
                 dataLookUp: { 
                    LookUpCd: 'GetLookupSSParamName'    , 
                    ColumnDB: 'ParamName'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '',
                    ParamView: "" 
                        }, 
                cName: 'copyfromcolumn', 
                cLabel: 'Copy Column From', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey:false, 
                cStatic: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'' ,
                cDisplayColumn:'ParamName' ,
                cValidate :'', 
            }, 
            PI_rowno: { 
                cValidate :'', 
                cName: 'rowno', 
                cLabel: 'Row', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_taborder: { 
                cValidate :'', 
                cName: 'taborder', 
                cLabel: 'Tab', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_position: { 
                cValidate :'', 
                cName: 'position', 
                cLabel: 'Pst', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_columnname: { 
                cValidate :'required', 
                cName: 'paramname', 
                cLabel: 'Column Name', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_columntype: { 
                dataLookUp: null, 
                cValidate :'', 
                cName: 'columntype', 
                cLabel: 'Column Type', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cTriggered: false, 
                cDefault: 'String', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: true, 
                cOption: [
                    { label: 'String', id: 'String' },
                    { label: 'Numeric', id: 'Numeric' },
                    { label: 'Decimal', id: 'Decimal' },
                    { label: 'Label', id: 'Label' },
                    { label: 'Compute', id: 'Compute' },
                    { label: 'Date Time', id: 'DateTime' },
                    { label: 'Date Range', id: 'DateRange' },
                    { label: 'Dropdown', id: 'Dropdown' },
                    { label: 'LookUp', id: 'LookUp' },
                    { label: 'Check Box', id: 'CheckBox' },
                    { label: 'Radio Button List', id: 'RadioButtonList' }],  
                cMasterUrl: '' ,
                cDisplayColumn: '' ,
            }, 
            PI_label: { 
                cValidate :'', 
                cName: 'label', 
                cLabel: 'Label', 
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
            PI_defaultvalue: { 
                dataLookUp: null, 
                cValidate :'required', 
                cName: 'defaultvalue', 
                cLabel: 'Default Value', 
                cLabelSize: 4, 
                cOrder: 8, 
                cKey: false, 
                cTriggered: false, 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: true, 
                cOption: [
                    { label: '^PortFolioCd^', id: '^PortfolioCd^' },
                    { label: '^PortfolioName^', id: '^PortfolioName^' },
                    { label: '^SubPortfolioCd^', id: '^SubPortfolioCd^' },
                    { label: '^Name^', id: '^Name^' },
                    { label: '^UserId^', id: '^UserId^' },
                    { label: '^UserName^', id: '^UserName^' },
                    { label: '^Address1^', id: '^Address1^' },
                    { label: '^Address2^', id: '^Address2^' },
                    { label: '^Address3^', id: '^Address3^' },
                    { label: '^Address4^', id: '^Address4^' },
                    { label: '^ZipCode^', id: '^ZipCode^' },
                    { label: '^PhoneNo^', id: '^PhoneNo^' },
                    { label: '^FaxNo^', id: '^FaxNo^' },
                    { label: 'etc', id: 'etc' },],  
                cMasterUrl: '' ,
                cDisplayColumn: '' ,
                cValidate :'', 
            }, 
            PI_defaultvalue2: { 
                cValidate :'', 
                cName: 'defaultvalue2', 
                // cLabel: 'Label', 
                cLabelSize: 4, 
                cOrder: 9, 
                cKey: false, 
                cType: 'text',
                cVisible: false, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_setvalue: { 
                cValidate :'', 
                cName: 'setvalue', 
                cLabel: 'Set Value', 
                cLabelSize: 4, 
                cOrder: 10, 
                cKey: false, 
                cType: 'text',
                cRows: 4,
                cMaxRows: 4,
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_includeparameter:{
                cValidate :'', 
                cName: 'includeparameter', 
                cLabel: 'Include Parameter', 
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
            PI_required: { 
                cValidate :'', 
                cName: 'isrequired', 
                cId: 'rdbisrequired', 
                cRadioOptions: [{ text: 'Yes', value: 'True' }, { text: 'No', value: 'False' }], 
                cLabel:'Required', 
                cLabelSize: 4, 
                cOrder: 12, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_visible: { 
                cValidate :'', 
                cName: 'isvisible', 
                cId: 'rdbisvisible', 
                cRadioOptions: [{ text: 'Yes', value: 'True' }, { text: 'No', value: 'False' }], 
                cLabel: 'Visible', 
                cLabelSize: 4, 
                cOrder: 13, 
                cKey: false, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_column: { 
                cValidate :'', 
                cName: 'iscolumn', 
                cId: 'rdbiscolumn', 
                cRadioOptions: [{ text: 'Yes', value: 'True' }, { text: 'No', value: 'False' }], 
                cLabel: 'Column', 
                cLabelSize: 4, 
                cOrder: 14, 
                cKey: false, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_disabled: { 
                cValidate :'', 
                cName: 'isdisable', 
                cId: 'rdbisdisable', 
                cRadioOptions: [{ text: 'Yes', value: 'True' }, { text: 'No', value: 'False' }], 
                cLabel: 'Disable', 
                cLabelSize: 4, 
                cOrder: 15, 
                cKey: false, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_maxlength: { 
                cValidate :'', 
                cName: 'maxlength', 
                cLabel: 'Max Length', 
                cLabelSize: 4, 
                cOrder: 16, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_isparam: { 
                cValidate :'', 
                cName: 'isparam', 
                cId: 'rdbisparam', 
                cRadioOptions: [{ text: 'Yes', value: 'True' }, { text: 'No', value: 'False' }], 
                cLabel: 'Param', 
                cLabelSize: 4, 
                cOrder: 17, 
                cKey: false, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_cntreportpath: { 
                cValidate :'', 
                cName: 'cntreportpath', 
                cLabel: 'Cnt Report Path', 
                cLabelSize: 4, 
                cOrder: 18, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_comptfail: { 
                cValidate :'', 
                cName: 'iscomptfail', 
                cId: 'rdbcomptfail', 
                cRadioOptions: [{ text: 'Yes', value: 'True' }, { text: 'No', value: 'False' }], 
                cLabel: 'Component Fail', 
                cLabelSize: 4, 
                cOrder: 19, 
                cKey: false,
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_lookupcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSSAll'    , 
                    ColumnDB: 'OptionLookUpCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'lookupcd', 
                cLabel: 'Lookup Code', 
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
                cMasterUrl: 'SS/SS_LookupEntry' ,
                cDisplayColumn: 'OptionLookUpCd' ,
            },
            PI_viewname: { 
                cValidate :'', 
                cName: 'viewname', 
                cLabel: 'View Name', 
                cLabelSize: 5, 
                cOrder: 21, 
                cKey: false,
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },  
            PI_lookupdb: { 
                cValidate :'', 
                cName: 'lookupdb', 
                cLabel: 'Column Database', 
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
            PI_displaycolumn: { 
                cValidate :'', 
                cName: 'displaycolumn', 
                cLabel: 'Display Column', 
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
            PI_displaylabel: { 
                cValidate :'', 
                cName: 'displaylabel', 
                cLabel: 'Display Label', 
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
            PI_sourcefield: { 
                cValidate :'', 
                cName: 'sourcefield', 
                cLabel: 'Source Field', 
                cLabelSize: 4, 
                cOrder: 25, 
                cKey: false,
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_displaylookup: {
                cValidate :'', 
                cName: 'displaylookup', 
                cLabel: 'Display Lookup', 
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
            PI_lookupinitialwhere: { 
                cValidate :'', 
                cName: 'lookupinitialwhere', 
                cLabel: 'Initial Where', 
                cLabelSize: 4, 
                cOrder: 27, 
                cKey: false,
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cRows: 5, 
                cMaxRows: 5, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_sortfield: { 
                cValidate :'', 
                cName: 'lookupsortfield', 
                cLabel: 'Sort Field', 
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
            
            PI_setcolumnvalue: { 
                cValidate :'', 
                cName: 'setcolumnvalue', 
                cLabel: 'Set Column Value', 
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
            PI_setcolumnwhere: { 
                cValidate :'', 
                cName: 'setcolumnwhere',
                cLabel: 'Set Column Where', 
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
            PI_onchangetriggerfield: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSSParamName'    , 
                    ColumnDB: 'ParamName'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '',
                    ParamView: "" 
                        }, 
                cName: 'onchangetriggerfield', 
                cLabel: 'On Change Field', 
                cLabelSize: 4, 
                cOrder: 31, 
                cKey:false, 
                cStatic: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'' ,
                cDisplayColumn:'ParamName' ,
                cValidate :'', 
            }, 
            PI_onchangetriggerinitialwhere: { 
                cValidate :'', 
                cName: 'onchangetriggerinitialwhere', 
                cLabel: 'On Change Initial Where', 
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
            PI_paramview: { 
                cValidate :'', 
                cName: 'paramviewlookup', 
                cLabel: 'Param View', 
                cLabelSize: 4, 
                cOrder: 33, 
                cKey: false,
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_analysistype: { 
                dataLookUp: null, 
                cValidate :'', 
                cName: 'analysistypetype', 
                cLabel: 'Analysis Type', 
                cLabelSize: 4, 
                cOrder: 34, 
                cKey: false, 
                cTriggered: false, 
                cDefault: 'Account Analysis', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: true, 
                cOption: [
                    { label: 'Account Analysis', id: 'Account Analysis' },
                    { label: 'Analysis Category All', id: 'Analysis Category All' },
                    { label: 'Stock Analysis', id: 'Stock Analysis' },
                    { label: 'Debtor Analysis', id: 'Debtor Analysis' },
                    { label: 'Creditor Analysis', id: 'Creditor Analysis' },
                    { label: 'Item Analysis', id: 'Item Analysis' },
                    { label: 'Supplier Analysis', id: 'Supplier Analysis' },
                    { label: 'Lot Analysis', id: 'Lot Analysis' },
                    { label: 'Tag Analysis', id: 'Tag Analysis' },
                    { label: 'Fixed Asset Analysis', id: 'Fixed Asset Analysis' }],
                cMasterUrl: '' ,
                cDisplayColumn: '' ,
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
        },
    },
    methods: {
        OncopyfromcolumnChange(data) {
            // console.log(data)
            this.M_SS_ReportParameterD.copyfromcolumn = data.id
            this.M_SS_ReportParameterD.copyfromcolumnLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                var param = {
                  OptionFunctionCd: "GetColumnRptParameter",
                  ModuleCd: this.Module,
                  SubPortfolioCd: this.getDataUser().subportfolio_cd,
                  SS_OptionRptParameter_ID: data.SS_OptionRptParameter_ID
                }

                this.FnDynamicFunction(param)
                .then(ress => {     
                  if (ress == null) return

                  if (ress.length > 0) {
                      console.log(ress[0])
                    this.M_SS_ReportParameterD.rowno = ress[0].RowNo
                    this.M_SS_ReportParameterD.taborder = ress[0].TabOrder
                    this.M_SS_ReportParameterD.paramname = ress[0].ParamName
                    this.M_SS_ReportParameterD.columntype = ress[0].ColumnType
                    this.M_SS_ReportParameterD.setvalue = ress[0].setValue
                    this.M_SS_ReportParameterD.isrequired = ress[0].isRequired
                    this.M_SS_ReportParameterD.isvisible = ress[0].isVisible
                    this.M_SS_ReportParameterD.iscolumn = ress[0].isColumn
                    this.M_SS_ReportParameterD.isdisabled = ress[0].isDisabled
                    this.M_SS_ReportParameterD.maxlength = ress[0].MaxLength
                    this.M_SS_ReportParameterD.isparam = ress[0].isParam
                    this.M_SS_ReportParameterD.cntreportpath = ress[0].CntReportPath
                    this.M_SS_ReportParameterD.iscomptfail = ress[0].isComptFail
                    this.M_SS_ReportParameterD.lookupcd = ress[0].LookUpCd
                    this.M_SS_ReportParameterD.lookupcdLabel = ress[0].LookUpCd
                    this.M_SS_ReportParameterD.lookupdb = ress[0].LookUpDB
                    this.M_SS_ReportParameterD.lookupinitialwhere = ress[0].LookUpInitialWhere
                    this.M_SS_ReportParameterD.lookupsortfield = ress[0].LookUpSortField
                    this.M_SS_ReportParameterD.sourcefield = ress[0].sourceField
                    this.M_SS_ReportParameterD.displaycolumn = ress[0].DisplayColumn
                    this.M_SS_ReportParameterD.setcolumnvalue = ress[0].SetColumnValue
                    this.M_SS_ReportParameterD.setcolumnwhere = ress[0].SetColumnWhere
                    this.M_SS_ReportParameterD.paramview = ress[0].ParamViewLookUp
                    this.M_SS_ReportParameterD.analysistype = ress[0].AnalysisType
                    this.M_SS_ReportParameterD.displaylookup = ress[0].DisplayLookup
                    // this.M_SS_ReportParameterD.paramname = ''
                    this.M_SS_ReportParameterD.label = ''

                    if(ress[0].DefaultValue != 'etc' && ress[0].DefaultValue != ''){
                        this.M_SS_ReportParameterD.defaultvalue = ress[0].DefaultValue
                        this.M_SS_ReportParameterD.defaultvalueLabel = ress[0].DefaultValue
                        this.M_SS_ReportParameterD.defaultvalue2 = ress[0].DefaultValue
                        this.PI_defaultvalue2.cVisible = false
                    }
                    else{
                        this.M_SS_ReportParameterD.defaultvalue = 'etc'
                        this.M_SS_ReportParameterD.defaultvalueLabel = 'etc'
                        this.M_SS_ReportParameterD.defaultvalue2 = ''
                        this.PI_defaultvalue2.cVisible = true
                    }

                    this.PI_comptfail.cProtect = true
                  }
                })
            }
        })
        this.$forceUpdate()
        },
        OncolumntypeChange (data) {
            this.M_SS_ReportParameterD.columntype = data.id
            this.M_SS_ReportParameterD.columntypeLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                if(data.id == 'Dropdown'){
                    this.PI_setvalue.cValidate = 'required'
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_displaycolumn.cValidate = ''

                    this.$refs.ref_setvalue.isRequired = true
                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_displaycolumn.isRequired = false
                }
                else if( data.id == 'CheckBox'){
                    this.PI_setvalue.cValidate = 'required'
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_displaycolumn.cValidate = ''

                    this.$refs.ref_setvalue.isRequired = true
                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_displaycolumn.isRequired = false
                }
                else if( data.id == 'LookUp'){
                    this.PI_setvalue.cValidate = 'false'
                    this.PI_lookupcd.cValidate = 'required'
                    this.PI_lookupdb.cValidate = 'required'
                    this.PI_displaycolumn.cValidate = 'required'

                    this.$refs.ref_setvalue.isRequired = false
                    this.$refs.ref_lookupcd.isRequired = true
                    this.$refs.ref_lookupdb.isRequired = true
                    this.$refs.ref_displaycolumn.isRequired = true
                }
                else if( data.id == 'RadioButtonList'){
                    this.PI_setvalue.cValidate = 'required'
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_displaycolumn.cValidate = ''

                    this.$refs.ref_setvalue.isRequired = true
                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_displaycolumn.isRequired = false
                }
                else{
                    this.PI_setvalue.cValidate = ''
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_displaycolumn.cValidate = ''

                    this.$refs.ref_setvalue.isRequired = false
                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_displaycolumn.isRequired = false
                }


            }
        })
        this.$forceUpdate()
        },
        OndefaultvalueChange (data) {
            // console.log(data)
           this.M_SS_ReportParameterD.defaultvalue = data.id
            this.M_SS_ReportParameterD.defaultvalueLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{defaultvalue}
                
                if(data.id == 'etc'){
                    this.PI_defaultvalue2.cVisible = true
                    this.M_SS_ReportParameterD.defaultvalue2 = ''
                }
                else{
                    this.PI_defaultvalue2.cVisible = false
                    this.M_SS_ReportParameterD.defaultvalue2 = data.id  
                }
            }
        })
        this.$forceUpdate()
        },
        OndefaultvalueChange2 (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{defaultvalue2}
            }
        })
        this.$forceUpdate()
        },
        OnlookupcdChange (data) {
            console.log(data)
            this.M_SS_ReportParameterD.lookupcd = data.id
            this.M_SS_ReportParameterD.lookupcdLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                this.M_SS_ReportParameterD.lookupdb = data.ColumnDB
                this.M_SS_ReportParameterD.displaycolumn = data.DisplayLookup
                this.M_SS_ReportParameterD.viewname = data.ViewName
//{lookupcd}
            }
        })
        this.$forceUpdate()
        },
        OntriggerfieldChange (data) {
            this.M_SS_ReportParameterD.onchangetriggerfield = data.id
            this.M_SS_ReportParameterD.onchangetriggerfieldLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{onchangetriggerfield}
            }
        })
        this.$forceUpdate()
        },
        OnanalysistypeChange (data) {
            this.M_SS_ReportParameterD.analysistype = data.id
            this.M_SS_ReportParameterD.analysistypeLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{analysistype}
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
        M_Cancel(){
            if (this.inputStatus == 'EDIT') {
                this.listDisabled = false 
                this.$store.commit('setStatus', 'VIEW')
            }
            this.M_ClearForm()
            this.listDisabled = false 
            this.$store.commit('setStatus', 'VIEW')
        },
        doDoubleClick(){
        },
        rowClicked (record, index) {
        },
        rowLink: function(url){
        },
        goModal() {
            this.getModal(this.M_SS_ReportParameterD.viewname)
        },
        paramFromParent(){
            let data = this.$store.getters.GetPage1Data
            // console.log(data)
            this.getDataRptParameter()
            this.M_ClearForm()

            this.PI_copyfromcolumn.dataLookUp.InitialWhere = "OptionSeq='"+data.OptionSeq+"'"
            this.PI_onchangetriggerfield.dataLookUp.InitialWhere = "OptionSeq='"+data.OptionSeq+"'"
            
        },	
        M_Post(){
        },
        M_Refresh(){
            this.getDataRptParameter()
        },
        M_Save(){
            // console.log(this.M_SS_ReportParameterD)
            // return
            // alert(this.$store.getters.getStatus.toUpperCase())

            if (this.inputStatus == 'NEW') {
                var param = {
                    OptionSeqV2: this.getOptionSeq().OptionSeq ,
                    LineNo: 1 ,
                    OptionSeq: this.M_SS_ReportParameterD.optionseq ,
                    PathReport: this.M_SS_ReportParameterD.pathname ,
                    ReportName: this.M_SS_ReportParameterD.reportname ,
                    ParamName: this.M_SS_ReportParameterD.paramname ,
                    Label: this.M_SS_ReportParameterD.label ,
                    ColumnType: this.M_SS_ReportParameterD.columntype,
                    DefaultValue: this.M_SS_ReportParameterD.defaultvalue2 ,
                    setValue: this.M_SS_ReportParameterD.setvalue ,
                    isRequired: this.M_SS_ReportParameterD.isrequired === "True" ? 1 : 0 ,
                    isVisible: this.M_SS_ReportParameterD.isvisible === "True" ? 1 : 0 ,
                    isColumn: this.M_SS_ReportParameterD.iscolumn === "True" ? 1 : 0 ,
                    TabOrder: this.M_SS_ReportParameterD.taborder ,
                    MaxLength: this.M_SS_ReportParameterD.maxlength ,
                    RowNo: this.M_SS_ReportParameterD.rowno ,
                    position: this.M_SS_ReportParameterD.position ,
                    LookUpCd: this.M_SS_ReportParameterD.lookupcd ,
                    LookUpDB: this.M_SS_ReportParameterD.lookupdb ,
                    LookUpInitialWhere: this.M_SS_ReportParameterD.lookupinitialwhere ,
                    SetColumnValue: this.M_SS_ReportParameterD.setcolumnvalue ,
                    SetColumnWhere: this.M_SS_ReportParameterD.setcolumnwhere ,
                    OnChangeTriggerField: this.M_SS_ReportParameterD.onchangetriggerfield ,
                    OnChangeTriggerInitialWhere: this.M_SS_ReportParameterD.onchangetriggerinitialwhere ,
                    UserInput: this.getDataUser().user_id ,
                    DisplayColumn: this.M_SS_ReportParameterD.displaycolumn ,
                    isComptFail: this.M_SS_ReportParameterD.iscomptfail === "True" ? 1 : 0,
                    CntReportPath: this.M_SS_ReportParameterD.cntreportpath,
                    isParam: this.M_SS_ReportParameterD.isparam === "True" ? 1 : 0,
                    LookUpSortField: this.M_SS_ReportParameterD.lookupsortfield,
                    sourceField: this.M_SS_ReportParameterD.sourcefield,
                    DisplayLookUp: this.M_SS_ReportParameterD.displaylookup,
                    isDisabled: this.M_SS_ReportParameterD.isdisabled === "True" ? 1 : 0,
                    ParamViewLookUp: this.M_SS_ReportParameterD.paramviewlookup,
                    AnalysisType: this.M_SS_ReportParameterD.analysistype,
                    IncludeParameter: this.M_SS_ReportParameterD.includeparameter
                    // SS_OptionRptParameter_ID: this.M_SS_ReportParameterD.id ,
                }

                // console.log('new', param)

                this.postJSON(this.getUrlInsert(), param)
                .then((response) => {
                    //handling Insert
                    if(response == null) {
                        return
                    }
                    this.alertSuccess(response.Message)
                    .then(() => {
                        // this.formRptParameter1 = [] 
                        //set Form to View (again)
                        // this.$store.commit('setStatus', 'VIEW')
                        // this.formRptParameter1Selected jadi null semua (1,2,0)
                        this.listDisabled = false
                        this.formRptParameter1Selected = null
                        this.formRptParameter2Selected = null
                        this.formRptParameter0Selected = null
                        this.getDataRptParameter()

                    })
                })
            }
            else if (this.inputStatus == 'EDIT') {
                var param = {
                    OptionSeqV2: this.getOptionSeq().OptionSeq ,
                    LineNo: 1 ,
                    OptionSeq: this.M_SS_ReportParameterD.optionseq ,
                    PathReport: this.M_SS_ReportParameterD.pathname ,
                    ReportName: this.M_SS_ReportParameterD.reportname ,
                    ParamName: this.M_SS_ReportParameterD.paramname ,
                    Label: this.M_SS_ReportParameterD.label ,
                    ColumnType: this.M_SS_ReportParameterD.columntype ,
                    DefaultValue: this.M_SS_ReportParameterD.defaultvalue2 ,
                    setValue: this.M_SS_ReportParameterD.setvalue ,
                    isRequired: this.M_SS_ReportParameterD.isrequired === "True" ? 1 : 0 ,
                    isVisible: this.M_SS_ReportParameterD.isvisible === "True" ? 1 : 0 ,
                    isColumn: this.M_SS_ReportParameterD.iscolumn === "True" ? 1 : 0 ,
                    TabOrder: this.M_SS_ReportParameterD.taborder ,
                    MaxLength: this.M_SS_ReportParameterD.maxlength ,
                    RowNo: this.M_SS_ReportParameterD.rowno ,
                    position: this.M_SS_ReportParameterD.position ,
                    LookUpCd: this.M_SS_ReportParameterD.lookupcd ,
                    LookUpDB: this.M_SS_ReportParameterD.lookupdb ,
                    LookUpInitialWhere: this.M_SS_ReportParameterD.lookupinitialwhere ,
                    SetColumnValue: this.M_SS_ReportParameterD.setcolumnvalue ,
                    SetColumnWhere: this.M_SS_ReportParameterD.setcolumnwhere ,
                    OnChangeTriggerField: this.M_SS_ReportParameterD.onchangetriggerfield ,
                    OnChangeTriggerInitialWhere: this.M_SS_ReportParameterD.onchangetriggerinitialwhere ,
                    UserInput: this.getDataUser().user_id ,
                    DisplayColumn: this.M_SS_ReportParameterD.displaycolumn ,
                    SS_OptionRptParameter_ID: this.M_SS_ReportParameterD.id ,
                    isComptFail: this.M_SS_ReportParameterD.iscomptfail === "True" ? 1 : 0,
                    CntReportPath: this.M_SS_ReportParameterD.cntreportpath,
                    isParam: this.M_SS_ReportParameterD.isparam === "True" ? 1 : 0,
                    LookUpSortField: this.M_SS_ReportParameterD.lookupsortfield,
                    sourceField: this.M_SS_ReportParameterD.sourcefield,
                    DisplayLookUp: this.M_SS_ReportParameterD.displaylookup,
                    isDisabled: this.M_SS_ReportParameterD.isdisabled === "True" ? 1 : 0,
                    ParamViewLookUp: this.M_SS_ReportParameterD.paramviewlookup,
                    AnalysisType: this.M_SS_ReportParameterD.analysistype,
                    IncludeParameter: this.M_SS_ReportParameterD.includeparameter,
                }

                // console.log('edit', param)

                this.postJSON(this.getUrlUpdate(), param)
                .then((response) => {
                    //handling Update
                    if(response == null) {
                        return
                    }
                    this.alertSuccess(response.Message)
                    .then(() => {
                        // this.formRptParameter1 = [] 
                        
                        // this.$store.commit('setStatus', 'VIEW')
                        this.listDisabled = false
                        this.formRptParameter1Selected = null
                        this.formRptParameter2Selected = null
                        this.formRptParameter0Selected = null
                        this.getDataRptParameter()
                    })
                })
            }
        },
        M_Insert(){
        },
        M_Update(){
            this.$store.commit('setStatus', 'EDIT')
        },
        M_ClearForm(){
            this.M_SS_ReportParameterD = {
                optionseq: this.DataRowPage1.OptionSeq,
                reportname: this.DataRowPage1.ReportName,
                pathname: this.DataRowPage1.PathReport,
                paramname: '',
                label: '',
                columntype: '',
                defaultvalue: '',
                defaultvalue2: '',
                setvalue: '',
                isrequired: 'False',
                isvisible: 'True',
                iscolumn: 'False',
                taborder: '',
                maxlength: '',
                rowno: '',
                position: '',
                lookupcd: '',
                lookupdb: '',
                lookupinitialwhere: '',
                setcolumnvalue: '',
                setcolumnwhere: '',
                onchangetriggerfield: '',
                onchangetriggerinitialwhere: '',
                userinput: '',
                useredit: '',
                timeinput: '',
                timeedit: '',
                displaycolumn: '',
                iscomptfail: 'False',
                cntreportpath: '',
                isparam: 'True',
                lookupsortfield: '',
                sourcefield: '',
                displaylookup: '',
                isdisabled: 'False',
                paramviewlookup: '',
                analysistype: '',
                viewname: '',
                includeparameter: ' '
            }
        },
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.$refs.ref_rowno.focus()
        },
        M_Edit(){
            let data = this.$store.getters.GetPage1Data
            this.$refs.ref_rowno.focus()
        },
        M_Delete(){
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: 1,
                SS_OptionRptParameter_ID: this.M_SS_ReportParameterD.id,
            }
            
            this.postJSON( this.getUrlDelete(), param )
            .then(response => {
                if (response == null) return

                this.alertSuccess("Deleting Data Successfully")
                .then(() => {
                    this.formRptParameter1 = []
                    this.formRptParameter2 = []
                    this.formRptParameter0 = []
                    this.formRptParameter1Selected = null
                    this.formRptParameter2Selected = null
                    this.formRptParameter0Selected = null
                    
                    this.getDataRptParameter()
                })
            })
        },
        beforeGetDataBy (record) {
            // console.log(this.formRptParameter0Selected)
            // console.log(this.formRptParameter1Selected)
            // console.log(this.formRptParameter2Selected)
            // this.$nextTick(() => {
                if (record.position.toString() == "1") {
                this.formRptParameter0Selected = null
                this.formRptParameter2Selected = null
            }
            else if (record.position == "2") {
                this.formRptParameter1Selected = null
                this.formRptParameter0Selected = null
            }
            else if (record.position == "0") {
                this.formRptParameter1Selected = null
                this.formRptParameter2Selected = null
            }

                this.getDataBy(record)
            // })
        },
        getDataBy (record) {
            this.tempParam = record
            
            // if (this.inputStatus != 'VIEW') return
            // console.log(this.formRptParameter0Selected)
            var param = {
                OptionSeqV2: this.getOptionSeq().OptionSeq,
                LineNo: 2,
                optionseq: record.OptionSeq,
                ss_optionrptparameter_id: record.value		
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return
                var value = ""

                var data = response.Data[0]
                if((data.defaultvalue != '^PortfolioCd^') && 
                    (data.defaultvalue != '^PortfolioName^') &&
                    (data.defaultvalue != '^SubPortfolioCd^') && 
                    (data.defaultvalue != '^Name^') &&
                    (data.defaultvalue != '^UserId^') &&
                    (data.defaultvalue != '^UserName^') &&
                    (data.defaultvalue != '^Address1^') &&
                    (data.defaultvalue != '^Address2^') &&
                    (data.defaultvalue != '^Address3^') &&
                    (data.defaultvalue != '^Address4^') &&
                    (data.defaultvalue != '^ZipCode^') &&
                    (data.defaultvalue != '^PhoneNo^') &&
                    (data.defaultvalue != '^FaxNo^')){
                        value = "etc"
                    }
                else{
                    value = data.defaultvalue
                }

                console.log(data)
                this.M_SS_ReportParameterD = {
                    optionseq: data.optionseq,
                    reportname: data.reportname,
                    pathname: data.pathreport,
                    paramname: data.paramname,
                    label: data.label,
                    columntype: data.columntype,
                    defaultvalue: value,
                    defaultvalue2: data.defaultvalue,
                    setvalue: data.setvalue,
                    isrequired: data.isrequired,
                    isvisible: data.isvisible,
                    iscolumn: data.iscolumn,
                    taborder: data.taborder,
                    maxlength: data.maxlength,
                    rowno: data.rowno,
                    position: data.position,
                    lookupcd: data.lookupcd,
                    lookupdb: data.lookupdb,
                    lookupinitialwhere: data.lookupinitialwhere,
                    setcolumnvalue: data.setcolumnvalue,
                    setcolumnwhere: data.setcolumnwhere,
                    onchangetriggerfield: data.onchangetriggerfield,
                    onchangetriggerinitialwhere: data.onchangetriggerinitialwhere,
                    userinput: data.user_input,
                    useredit: data.useredit,
                    timeinput: data.timeinput,
                    timeedit: data.timeedit,
                    displaycolumn: data.displaycolumn,
                    iscomptfail: data.iscomptfail,
                    cntreportpath: data.cntreportpath,
                    isparam: data.isparam,
                    lookupsortfield: data.lookupsortfield,
                    sourcefield: data.sourcefield,
                    displaylookup: data.displaylookup,
                    isdisabled: data.isdisabled,
                    paramviewlookup: data.paramviewlookup,
                    analysistype: data.analysistype,
                    viewname: data.viewname,
                    id: data.ss_optionrptparameter_id,
                    includeparameter: data.includeparameter
                }
  

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.useredit
                
                this.M_SS_ReportParameterD.lookupcdLabel = this.M_SS_ReportParameterD.lookupcd != null ? data.lookupcd :'' 

                if(value == 'etc'){
                    this.PI_defaultvalue2.cVisible = true
                }else{
                    this.PI_defaultvalue2.cVisible = false
                }

                if(data.columntype == 'Dropdown'){
                    this.PI_setvalue.cValidate = 'required'
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_displaycolumn.cValidate = ''

                    this.$refs.ref_setvalue.isRequired = true
                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_displaycolumn.isRequired = false
                }
                else if( data.columntype == 'CheckBox'){
                    this.PI_setvalue.cValidate = 'required'
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_displaycolumn.cValidate = ''

                    this.$refs.ref_setvalue.isRequired = true
                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_displaycolumn.isRequired = false
                }
                else if( data.columntype == 'LookUp'){
                    this.PI_setvalue.cValidate = 'false'
                    this.PI_lookupcd.cValidate = 'required'
                    this.PI_lookupdb.cValidate = 'required'
                    this.PI_displaycolumn.cValidate = 'required'

                    this.$refs.ref_setvalue.isRequired = false
                    this.$refs.ref_lookupcd.isRequired = true
                    this.$refs.ref_lookupdb.isRequired = true
                    this.$refs.ref_displaycolumn.isRequired = true
                }
                else if( data.columntype == 'RadioButtonList'){
                    this.PI_setvalue.cValidate = 'required'
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_displaycolumn.cValidate = ''

                    this.$refs.ref_setvalue.isRequired = true
                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_displaycolumn.isRequired = false
                }
                else{
                    this.PI_setvalue.cValidate = ''
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_displaycolumn.cValidate = ''

                    this.$refs.ref_setvalue.isRequired = false
                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_displaycolumn.isRequired = false
                }

                this.$store.commit('setStatus', 'EDIT')
            })
        },
        moveUpDown (direction, from) {
            var DATAS = []
            var DATAS_SELECT = []

            if (from == '1') {
                DATAS = this.formRptParameter1
                DATAS_SELECT = this.formRptParameter1Selected
                    }
            else if (from == '2') {
                DATAS = this.formRptParameter2
                DATAS_SELECT = this.formRptParameter2Selected
                }

            if (direction == 'U') {
                // console.log(DATAS)
                var idxNow = DATAS.map(x => x.value).indexOf(DATAS_SELECT.value)
                if (idxNow < 1) return
                // console.log(idxNow)

                var rownoNow, rownoUp
                rownoNow = DATAS[idxNow].rowno
                rownoUp = DATAS[idxNow-1].rowno

                DATAS[idxNow].rowno = rownoUp
                DATAS[idxNow-1].rowno = rownoNow

                var dataPost = []

                for (let x = 0 ; x < DATAS.length ; x ++) {
                    var rn
                    if (x == idxNow) {
                        rn = rownoUp
                    }
                    else if (x == (idxNow-1)) {
                        rn = rownoNow
                }
                    else {
                        rn = DATAS[x].rowno
            }
                    
                    dataPost.push({
                        RowNo: rn,
                        SS_OptionRptParameter_ID: DATAS[x].value
                    })
                }

                var param = {
                    OptionSeq: this.getOptionSeq().OptionSeq ,
                    LineNo: 2 ,
                    Data: dataPost
                }
                
                this.postJSON(this.getUrlUpdateMulti(), param)
                .then(ress => {
                    if (ress == null) return
                    this.getDataRptParameter()
                    this.getDataBy(this.tempParam)
                        })
                    }
                else if (direction == 'D') {
                var idxNow = DATAS.map(x => x.value).indexOf(DATAS_SELECT.value)
                if (idxNow < 0) return
                if (idxNow == (DATAS.length-1)) return

                var rownoNow, rownoUp
                rownoNow = DATAS[idxNow].rowno
                rownoUp = DATAS[idxNow+1].rowno

                DATAS[idxNow].rowno = rownoUp
                DATAS[idxNow+1].rowno = rownoNow

                var dataPost = []

                for (let x = 0 ; x < DATAS.length ; x ++) {
                    var rn
                    if (x == idxNow) {
                        rn = rownoUp
                    }
                    else if (x == (idxNow+1)) {
                        rn = rownoNow
                    }
                    else {
                        rn = DATAS[x].rowno
                    }
                    
                    dataPost.push({
                        RowNo: rn,
                        SS_OptionRptParameter_ID: DATAS[x].value
                        })
                    }

                var param = {
                    OptionSeq: this.getOptionSeq().OptionSeq ,
                    LineNo: 2 ,
                    Data: dataPost
                }
                
                this.postJSON(this.getUrlUpdateMulti(), param)
                .then(ress => {
                    if (ress == null) return
                    this.getDataRptParameter()
                    this.getDataBy(this.tempParam)
                })
            }
        },
        openFormRptParameter1(){
            // this.FormType = 'FORM'
            this.$store.commit('setStatus', 'NEW')
            this.M_ClearForm()
            this.M_SS_ReportParameterD.position = "1"
            this.listDisabled = true
        },
        openFormRptParameter2(){
            // this.FormType = 'FORM'
            this.$store.commit('setStatus', 'NEW')
            this.M_ClearForm()
            this.listDisabled = true
            this.M_SS_ReportParameterD.position = "2"
        },
        openFormRptParameter0(){
            // this.FormType = 'FORM'
            this.$store.commit('setStatus', 'NEW')
            this.M_ClearForm()
            this.listDisabled = true
            this.M_SS_ReportParameterD.position = "0"
        },
        getModal(data){
            console.log(JSON.stringify(data,null,2))
            this.$modal.show(MyModal, 
                { //Props passing data
                    dataModal:data
                },
                {//Property
                    height: '80%',
                    width : '50%',
                    minWidth: "300",
                    minHeight: "500",
                    draggable: true,
                    resizable: true,
                    reset: true
                },
                {// event listener
                    'before-open': (event) => { console.log('this will be called before the modal before Oepn',event); },
                    'before-close': (event) => { console.log('this will be called before the modal before closes',event); },
                    'opened': (event) => { console.log('this will be called before the modal opended',event); },
                    'closed': (event) => { console.log('this will be called before the modal closed',event); },
                }
            )
            
        },
        getDataModal(record){
          var param = {
                OptionSeq:this.getOptionSeq().OptionSeq,
                UserId:this.getDataUser().user_id,
                PortfolioCd:this.getDataUser().portfolio_cd,              
                SubPortfolioCd:this.getDataUser().subportfolio_cd,
                view: this.M_SS_ReportParameterD.viewname,
                LineNo:3,
                InitialWhere:"",
                SortField:'',
                // ParamView: "'"+this.M_SS_ReportParameterD.viewname+"'"
            }
              this.postJSON( this.getUrlById(), param).then(response => {
                  // response from API
                  if (response == null) return
                  this.dataModal = response.Data
              })
        },
        getDataRptParameter(){
            var param = {
                OptionSeqV2: this.getOptionSeq().OptionSeq,
                UserId: this.getDataUser().user_id,
                PortfolioCd: this.getDataUser().portfolio_cd, 
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                LineNo: 1,
                OptionSeq: this.DataRowPage1.OptionSeq,
                InitialWhere: '',
                SortField: '',
                ParamView: ''
            }
            this.postJSON( this.getUrlById(), param )
            .then( response => {
                if(response == null) return
                var data = response.Data 
                this.formRptParameter1 = []
                this.formRptParameter2 = []
                this.formRptParameter0 = []

                if(data.length > 0){
                    this.$nextTick(() => {
                        data.forEach((dt, idx) => {
                            // dt.position.filters()f
                            if(dt.paramname && dt.paramname != ''){
                                if (dt.position.toString() == '1') {
                                    this.formRptParameter1.push({
                                        value: dt.ss_optionrptparameter_id,
                                        key: dt.paramname, 
                                        OptionSeq: dt.optionseq,
                                        position: dt.position,
                                        rowno: dt.rowno
                                    })
                                }
                                else if (dt.position.toString() == '2') {
                                    // console.log(dt)
                                    this.formRptParameter2.push({
                                        value: dt.ss_optionrptparameter_id,
                                        key:dt.paramname,
                                        OptionSeq: dt.optionseq,
                                        position: dt.position,
                                        rowno: dt.rowno
                                    })
                                }
                                else {
                                    this.formRptParameter0.push({
                                        value: dt.ss_optionrptparameter_id,
                                        key:dt.paramname,
                                        OptionSeq: dt.optionseq,
                                        position: dt.position,
                                        rowno: dt.rowno
                                    })
                                }
                            }
                        })
                    })
                }
            })
        }
    },
    beforeCreate: function () {
    },
    created: function() {
        // this.$store.commit('setFormType','List')
        // this.getToolbar().ProcessPS()
    },
    beforeMount: function() {
    },
    mounted: function() {
        // this.getDataModuleAccess()
        // this.getAllAccess()
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