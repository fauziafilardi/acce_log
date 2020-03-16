<template>
    <div>
        <b-modal id="modalFormParameter0" title="Form Parameter 0 Entry" size="lg" ref="modalFormParameter0" class="modalCustomABS">
            <b-row>
                <b-col sm="6">
                    <b-form data-vv-scope="'FormScope_1_1'" data-vv-value-path="'FormScope_1_1'">
                        <ABSProcessInputSelect2 @change="OncolumnnameentryChange" :prop="PI_columnnameentry" :value="M_SS_ColumnParameter.columnnameentry" :label="M_SS_ColumnParameter.columnnameentryLabel"  ref="ref_columnnameentry"/>
                    </b-form>
                </b-col>
            </b-row>
            <div slot="modal-footer" class="w-100">
                <div style="padding-right:20px;">
                    <b-btn size="sm" class="float-right btnModal__btnCancel" @click="$refs.modalFormParameter0.hide()">
                    Cancel
                    </b-btn>
                        <b-btn size="sm" class="float-right btnModal__btnOK" variant="primary" @click="M_Save2">
                    OK
                    </b-btn>
                </div>
            </div>
        </b-modal>


        <b-row style="padding-top:10px; padding-right: 10px; padding-left: 20px; padding-bottom: 10px; !important; height: 1050px !important;">
            <b-col sm="4">
                <ABSButton @click="openformParameter1" icon="plus" text="Add" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton @click="M_Delete" icon="trash" text="Delete" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <ABSButton @click="moveUpDown('U','1')" icon="arrow-up" text="Up" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton @click="moveUpDown('D','1')" icon="arrow-down" text="Down" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <div>Position 1(Left Side)</div>
                <ABSMultiSelect
                    id="MySelect"
                    v-model="formParameter1Selected"
                    :options="formParameter1"
                    :multi="false"
                    @change="beforeGetDataBy"
                    size=10
                    class="selectCustom"
                    :disabled="listDisabled"
                    style="margin-top:5px !important;"
                />
            </b-col>
             <b-col sm="4">
                <ABSButton @click="openformParameter2" icon="plus" text="Add" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton @click="M_Delete" icon="trash" text="Delete" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <ABSButton @click="moveUpDown('U','2')" icon="arrow-up" text="Up" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton @click="moveUpDown('D','2')" icon="arrow-down" text="Down" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <div>Position 2(Right Side)</div>
                <ABSMultiSelect
                    v-model="formParameter2Selected"
                    :options="formParameter2"
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
                                <b-col md="1" ></b-col> 
                                <b-col md="11">
                                    <ABSInputSelect2 @change="OncolumntypeChange" :prop="PI_columntype" :value="M_SS_ColumnParameter.columntype" :label="M_SS_ColumnParameter.columntypeLabel"  ref="ref_columntype"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="1" ></b-col> 
                                <b-col md="11">
                                    <ABSInputSelectList @change="OncolumnnameChange" :prop="PI_columnname" :value="M_SS_ColumnParameter.columnname" :label="M_SS_ColumnParameter.columnnameLabel"  ref="ref_columnname "/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="1" ></b-col> 
                                <b-col md="11">
                                    <ABSInputSelectList @change="Oncolumnname2Change" :prop="PI_columnname2" :value="M_SS_ColumnParameter.columnname2" :label="M_SS_ColumnParameter.columnname2Label"  ref="ref_columnname2"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="1" ></b-col> 
                                <b-col md="11">
                                    <ABSinputRadioButtonVuex @input="OnrunningnostatusChange" :prop="PI_runningnostatus" v-model="M_SS_ColumnParameter.runningnostatus"  ref="ref_runningnostatus"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="1" ></b-col> 
                                <b-col md="11">
                                    <ABSInputSelectList @change="OnrunningcdtablenameChange" :prop="PI_runningcdtablename" :value="M_SS_ColumnParameter.runningcdtablename" :label="M_SS_ColumnParameter.runningcdtablenameLabel"  ref="ref_runningcdtablename"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="1" ></b-col> 
                                <b-col md="11">
                                    <ABSInputSelectList @change="OnrunningcdcolumnspecChange" :prop="PI_runningcdcolumnspec" :value="M_SS_ColumnParameter.runningcdcolumnspec" :label="M_SS_ColumnParameter.runningcdcolumnspecLabel"  ref="ref_runningcdcolumnspec"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="4" class="lbl-col-align" style="right: -22px;">
                                    <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">Pst</label>
                                </b-col>
                                <b-col md="1" style="margin-left: 23px;">
                                    <ABSTextBoxOnly  :prop="PI_position" v-model="M_SS_ColumnParameter.position" ref="ref_position"/>
                                </b-col>
                                <b-col class="lbl-col-align" style="right: 5px;">
                                    <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">Order</label>
                                </b-col>
                                <b-col md="1" style="margin-left: 10px;right: 15px;">
                                    <ABSTextBoxOnly  :prop="PI_corder" v-model="M_SS_ColumnParameter.corder" ref="ref_corder"/>
                                </b-col>
                                 <b-col class="lbl-col-align" style="right: 30px;">
                                    <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">Row</label>
                                </b-col>
                                <b-col md="1" style="margin-left: 1px;right: 31px;">
                                    <ABSTextBoxOnly  :prop="PI_rowno" v-model="M_SS_ColumnParameter.rowno" ref="ref_rowno"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="1" ></b-col> 
                                <b-col md="11">
                                    <ABSinputTextVuex :prop="PI_columnlabel" v-model="M_SS_ColumnParameter.columnlabel"  ref="ref_columnlabel"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="1" ></b-col> 
                                <b-col md="11">
                                    <ABSTextAreaVuex :prop="PI_columnvalue" v-model="M_SS_ColumnParameter.columnvalue" ref="ref_columnvalue"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="1" ></b-col> 
                                <b-col md="11">
                                    <ABSinputTextVuex :prop="PI_maxlength" v-model="M_SS_ColumnParameter.maxlength"  ref="ref_maxlength"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="1" ></b-col> 
                                <b-col md="11">
                                    <ABSinputRadioButtonVuex :prop="PI_iskey" v-model="M_SS_ColumnParameter.iskey"  ref="ref_iskey"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="1" ></b-col> 
                                <b-col md="11">
                                    <ABSinputRadioButtonVuex :prop="PI_isrequired" v-model="M_SS_ColumnParameter.isrequired"  ref="ref_isrequired"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="1" ></b-col> 
                                <b-col md="11">
                                    <ABSinputRadioButtonVuex :prop="PI_isvisible" v-model="M_SS_ColumnParameter.isvisible"  ref="ref_isvisible"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="1" ></b-col> 
                                <b-col md="11">
                                    <ABSinputRadioButtonVuex :prop="PI_isprotected" v-model="M_SS_ColumnParameter.isprotected"  ref="ref_isprotected"/>
                                </b-col>
                            </b-row>
                            <div class="div-collapse">
                                <span class="master-span-form">
                                    Lookup Code
                                </span>
                            </div>
                            <b-row>
                                <b-col md="1" ></b-col> 
                                <b-col md="11">
                                    <ABSInputSelectList @change="OnlookupcdChange" :prop="PI_lookupcd" :value="M_SS_ColumnParameter.lookupcd" :label="M_SS_ColumnParameter.lookupcdLabel"  ref="ref_lookupcd"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="1"></b-col> 
                                <b-col md="11">
                                    <ABSinputTextVuex :prop="PI_viewname" v-model="M_SS_ColumnParameter.viewname"  ref="ref_viewname"/>
                                </b-col>
                                <!-- <b-col md="1">
                                    <b-button style="font-size: 10px;padding-top: 2px;padding-bottom: 4px;" :disabled="inputStatus=='VIEW'" @click="goModal"><font-awesome-icon icon="list" class="icon-style-1"/></b-button>
                                </b-col> -->
                            </b-row>
                            <b-row>
                                <b-col md="1" ></b-col> 
                                <b-col md="11">
                                    <ABSinputTextVuex :prop="PI_lookupdb" v-model="M_SS_ColumnParameter.lookupdb"  ref="ref_lookupdb"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="1" ></b-col> 
                                <b-col md="11">
                                    <ABSInputSelectList @change="OnlookuptableChange" :prop="PI_lookuptable" :value="M_SS_ColumnParameter.lookuptable" :label="M_SS_ColumnParameter.lookuptableLabel" ref="ref_lookuptable"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="1" ></b-col> 
                                <b-col md="11">
                                    <ABSInputSelectList @change="OnlookupdbdescsChange" :prop="PI_lookupdbdescs" :value="M_SS_ColumnParameter.lookupdbdescs" :label="M_SS_ColumnParameter.lookupdbdescsLabel"  ref="ref_lookupdbdescs"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="1" ></b-col> 
                                <b-col md="11">
                                    <ABSInputSelectList @change="OnlookupdbparameterChange" :prop="PI_lookupdbparameter" :value="M_SS_ColumnParameter.lookupdbparameter" :label="M_SS_ColumnParameter.lookupdbparameterLabel"  ref="ref_lookupdbparameter"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="1" ></b-col> 
                                <b-col md="11">
                                <ABSInputSelectList @change="OnmasterurlChange" :prop="PI_masterurl" :value="M_SS_ColumnParameter.masterurl" :label="M_SS_ColumnParameter.masterurlLabel"  ref="ref_masterurl"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="1" ></b-col> 
                                <b-col md="11">
                                    <ABSTextAreaVuex :prop="PI_lookupinitialwhere" v-model="M_SS_ColumnParameter.lookupinitialwhere"  ref="ref_lookupinitialwhere"/>
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
                </b-form>
            </b-col>
            <b-col sm="4" style="position: relative !important; top: -300px !important;">
                <ABSButton @click="openFormParameter0" icon="plus" text="Add" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton @click="M_Delete2" icon="trash" text="Delete" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <ABSButton :disabled="true" @click="moveUpDown('U','0')" icon="arrow-up" text="Up" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton :disabled="true" @click="moveUpDown('D','0')" icon="arrow-down" text="Down" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <div>Position 0</div>
                <ABSMultiSelect
                v-model="formParameter0Selected"
                :options="formParameter0"
                :multi="false"
                size=5
                @change="beforeGetDataBy"
                class="selectCustom"
                :disabled="listDisabled"
                style="margin-top:5px !important;"
                />
            </b-col>
        </b-row>
    </div>
</template>

<script>
// import MyModal from'./SS_ViewModal.vue'
export default {
    props: {PageLevel: '', TabIndex: '', data: ''}, 
    data() {
        return {
            listDisabled: false,
            tempParam: {},
            Module: "SS",
            FormType: "View",
            formParameter1Selected: null,
            formParameter1: [],
            formParameter2Selected: null,
            formParameter2:[],
            formParameter0Selected: null,
            formParameter0:[],  
            formParameter0Temp: [],
            widthModal :'80%',
            paragraphs: [true],
            timer: null,

            dataModal:[],
            IEBy: {Input: '', Edit: ''},
            M_SS_ColumnParameter :{
                detailid: 0,
                headerid: 0,
                position: '',
                rowno: '',
                columnname: '',
                columnname2: '',
                columnlabel: '',
                columntype: '',
                columnvalue: '',
                corder: '',
                maxlength: '0',
                lookupcd: '',
                lookuptable: '',
                lookupdb: '',
                lookupdbdescs: '',
                lookupdbparameter: '',
                lookupinitialwhere: '',
                isrequired: 'False',
                isvisible: 'True',
                iskey: 'False',
                isprotected: 'False',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                columnnameentry: '',
                runningnostatus: 'False',
                runningcdtablename: '',
                runningcdcolumnspec: '',
                masterurl: ''
            },

            PI_columntype: { 
                dataLookUp: null, 
                cValidate :'required', 
                cName: 'columntype', 
                cLabel: 'Column Type', 
                cLabelSize: 4, 
                cOrder: 101, 
                cKey: false, 
                cType: 'text',
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cStatic: true, 
                cOption: [
                    { label: 'String', id: 'String' },
                    { label: 'Numeric', id: 'Numeric' },
                    { label: 'Decimal', id: 'Decimal' },
                    { label: 'DateRange', id: 'DateRange' },
                    { label: 'DateTime', id: 'DateTime' },
                    { label: 'TimeRange', id: 'TimeRange' },
                    { label: 'FileUpload', id: 'FileUpload' },
                    { label: 'LookUp', id: 'LookUp' },
                    { label: 'TextArea', id: 'TextArea' },
                    { label: 'CheckBox', id: 'CheckBox' },
                    { label: 'RadioButtonList', id: 'RadioButtonList' },
                    { label: 'Dropdown', id: 'Dropdown' }],
                cMasterUrl: '' ,
                cDisplayColumn: '' , 
            }, 
            PI_columnname: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSSAllColumn'    , 
                    ColumnDB: 'column_name'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''
                    }, 
                cValidate :'required', 
                cName: 'columnname', 
                cLabel: 'Column Name', 
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
                cDisplayColumn: 'column_name' ,
            }, 
            PI_columnname2: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSSAllColumn'    , 
                    ColumnDB: 'column_name'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''
                    }, 
                cValidate :'', 
                cName: 'columnname2', 
                cLabel: 'Column Name 2', 
                cLabelSize: 4, 
                cOrder: 103, 
                 cTriggered: false, 
                cDefault: '', 
                cProtect: true, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cDisplayColumn: 'column_name' 
            },
            PI_runningnostatus: { 
                cValidate :'', 
                cName: 'runningnostatus', 
                cLabel: 'Running Status', 
                cId: 'rdbrunningnostatus', 
                cRadioOptions: [{ text: 'Yes', value: 'True' }, { text: 'No', value: 'False' }], 
                cLabelSize: 4, 
                cOrder: 104, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_runningcdtablename: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSSAllTable'    , 
                    ColumnDB: 'table_name'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''
                    }, 
                cValidate :'', 
                cName: 'runningcdtablename', 
                cLabel: 'Running Cd Table', 
                cLabelSize: 4, 
                cOrder: 105, 
                 cTriggered: false, 
                cDefault: '', 
                cProtect: true, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cDisplayColumn: 'table_name' 
            },
            PI_runningcdcolumnspec: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSSAllColumn'    , 
                    ColumnDB: 'column_name'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''
                    }, 
                cValidate :'', 
                cName: 'runningcdcolumnspec', 
                cLabel: 'Running Cd Column', 
                cLabelSize: 4, 
                cOrder: 106, 
                 cTriggered: false, 
                cDefault: '', 
                cProtect: true, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cDisplayColumn: 'column_name' 
            },
            PI_position: { 
                cValidate :'', 
                cName: 'position', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 107, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_corder: { 
                cValidate :'', 
                cName: 'order', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 108, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            
            PI_rowno: { 
                cValidate :'', 
                cName: 'rowno', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 109, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

            PI_columnlabel: { 
                cValidate :'required', 
                cName: 'columnlabel', 
                cLabel: 'Label', 
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
            PI_columnvalue: { 
                cValidate :'', 
                cName: 'columnvalue', 
                cLabel: 'Set Value', 
                cLabelSize: 4, 
                cOrder: 111, 
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
            PI_maxlength: { 
                cValidate :'', 
                cName: 'maxlength', 
                cLabel: 'Max Length', 
                cLabelSize: 4, 
                cOrder: 112, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_iskey: { 
                cValidate :'', 
                cName: 'iskey', 
                cLabel: 'Key', 
                cId: 'rdbiskey', 
                cRadioOptions: [{ text: 'Yes', value: 'True' }, { text: 'No', value: 'False' }], 
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
            PI_isrequired: { 
                cValidate :'', 
                cName: 'isrequired', 
                cLabel: 'Required', 
                cId: 'rdbisrequired', 
                cRadioOptions: [{ text: 'Yes', value: 'True' }, { text: 'No', value: 'False' }], 
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
            PI_isvisible: { 
                cValidate :'', 
                cName: 'isvisible', 
                cLabel: 'Visible', 
                cId: 'rdbisvisible', 
                cRadioOptions: [{ text: 'Yes', value: 'True' }, { text: 'No', value: 'False' }], 
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
            PI_isprotected: { 
                cValidate :'', 
                cName: 'isprotected', 
                cLabel: 'Protect', 
                cId: 'rdbisprotected', 
                cRadioOptions: [{ text: 'Yes', value: 'True' }, { text: 'No', value: 'False' }], 
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
            PI_lookupcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSSAllLookup'    , 
                    ColumnDB: 'OptionLookUpCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'lookupcd', 
                cLabel: 'Lookup Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 117, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: true, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: 'SS/SS_LookupEntry' ,
                cDisplayColumn: 'option_lookup_cd' ,
            }, 
            PI_viewname: { 
                cValidate :'', 
                cName: 'viewname', 
                cLabel: 'View Name', 
                cLabelSize: 4, 
                cOrder: 118, 
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
                cLabel: 'Lookup DB', 
                cLabelSize: 4, 
                cOrder: 119, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_lookuptable: {
                dataLookUp: { 
                    LookUpCd: 'GetLookupSSAllTable'    , 
                    ColumnDB: 'table_name'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'lookupcd', 
                cLabel: 'Lookup Table', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 120, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: true, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cDisplayColumn: 'table_name' ,
            },
            PI_lookupdbdescs: { 
                 dataLookUp: { 
                    LookUpCd: 'GetLookupSSAllColumn'    , 
                    ColumnDB: 'column_name'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'lookupdbdescs', 
                cLabel: 'Lookup Descs', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 121, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: true, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cDisplayColumn: 'column_name' ,
            }, 
            PI_lookupdbparameter: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSSAllColumn'    , 
                    ColumnDB: 'column_name'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'lookupdbparameter', 
                cLabel: 'Lookup Param', 
                cLabelSize: 4, 
                cOrder: 122, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: true, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cKey: false, 
                cType: 'text',
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cStatic: false, 
                cOption: [], 
                cDisplayColumn: 'column_name' ,
            }, 
            PI_masterurl: { 
                dataLookUp: { 
                        LookUpCd: 'GetSSPageMasterFile', 
                        ColumnDB: 'page_master_seq', 
                        InitialWhere: "", 
                        ParamWhere: ''  
                            }, 
                cValidate :'', 
                cName: 'masterurl', 
                cLabel: 'Master Url', 
                cLabelSize: 4, 
                cOrder: 123, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: true, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: '' ,
                cDisplayColumn: 'location_url' ,
            }, 
            PI_lookupinitialwhere: { 
                cValidate :'', 
                cName: 'lookupinitialwhere', 
                cLabel: 'Initial Where', 
                cLabelSize: 4, 
                cOrder: 124, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_columnnameentry: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSSFilterColumn', 
                    ColumnDB: 'column_name', 
                    InitialWhere: "", 
                    ParamWhere: '',
                    ParamView: "" 
                        }, 
                cName: 'columnnameentry', 
                cLabel: 'Column Name', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: false, 
                cStatic: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true,
                cProtect: false,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'' ,
                cDisplayColumn:'column_name' ,
                cValidate :'',  
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
        },
    },
    methods: {
        OncolumntypeChange(data) {
            this.M_SS_ColumnParameter.columntype = data.id
            this.M_SS_ColumnParameter.columntypeLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                if(data.id == 'DateRange'){
                    this.PI_columnname2.cProtect = false

                    this.PI_columnvalue.cValidate = ''
                    this.$refs.ref_columnvalue.isRequired = false

                    this.PI_lookupcd.cProtect = true
                    this.PI_lookupdb.cProtect = true
                    this.PI_lookuptable.cProtect = true
                    this.PI_lookupdbdescs.cProtect = true
                    this.PI_lookupdbparameter.cProtect = true
                    this.PI_masterurl.cProtect = true
                    this.PI_lookupinitialwhere.cProtect = true

                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_lookuptable.isRequired = false
                    this.$refs.ref_lookupdbdescs.isRequired = false
                    this.$refs.ref_lookupdbparameter.isRequired = false
                    
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_lookuptable.cValidate = ''
                    this.PI_lookupdbdescs.cValidate = ''
                    this.PI_lookupdbparameter.cValidate = ''

                    this.PI_runningnostatus.cProtect = true
                    this.PI_runningcdtablename.cProtect = true
                    this.PI_runningcdcolumnspec.cProtect = true

                    this.PI_maxlength.cProtect = true
                    this.M_SS_ColumnParameter.maxlength = ''
                }
                else if( data.id == 'TimeRange'){
                    this.PI_columnname2.cProtect = false

                    this.PI_columnvalue.cValidate = ''
                    this.$refs.ref_columnvalue.isRequired = false

                    this.PI_lookupcd.cProtect = true
                    this.PI_lookupdb.cProtect = true
                    this.PI_lookuptable.cProtect = true
                    this.PI_lookupdbdescs.cProtect = true
                    this.PI_lookupdbparameter.cProtect = true
                    this.PI_masterurl.cProtect = true
                    this.PI_lookupinitialwhere.cProtect = true

                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_lookuptable.isRequired = false
                    this.$refs.ref_lookupdbdescs.isRequired = false
                    this.$refs.ref_lookupdbparameter.isRequired = false
                    
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_lookuptable.cValidate = ''
                    this.PI_lookupdbdescs.cValidate = ''
                    this.PI_lookupdbparameter.cValidate = ''

                    this.PI_runningnostatus.cProtect = true
                    this.PI_runningcdtablename.cProtect = true
                    this.PI_runningcdcolumnspec.cProtect = true

                    this.PI_maxlength.cProtect = true
                    this.M_SS_ColumnParameter.maxlength = ''
                }
                else if( data.id == 'LookUp'){
                    this.PI_columnname2.cProtect = true

                    this.PI_columnvalue.cValidate = ''
                    this.$refs.ref_columnvalue.isRequired = false

                    this.PI_lookupcd.cProtect = false
                    this.PI_lookupdb.cProtect = false
                    this.PI_lookuptable.cProtect = false
                    this.PI_lookupdbdescs.cProtect = false
                    this.PI_lookupdbparameter.cProtect = false
                    this.PI_masterurl.cProtect = false
                    this.PI_lookupinitialwhere.cProtect = false

                    this.$refs.ref_lookupcd.isRequired = true
                    this.$refs.ref_lookupdb.isRequired = true
                    this.$refs.ref_lookuptable.isRequired = true
                    this.$refs.ref_lookupdbdescs.isRequired = true
                    this.$refs.ref_lookupdbparameter.isRequired = true
                    
                    this.PI_lookupcd.cValidate = 'required'
                    this.PI_lookupdb.cValidate = 'required'
                    this.PI_lookuptable.cValidate = 'required'
                    this.PI_lookupdbdescs.cValidate = 'required'
                    this.PI_lookupdbparameter.cValidate = 'required'


                    this.PI_runningnostatus.cProtect = true
                    this.PI_runningcdtablename.cProtect = true
                    this.PI_runningcdcolumnspec.cProtect = true

                    this.PI_maxlength.cProtect = true
                    this.M_SS_ColumnParameter.maxlength = ''
                }
                else if( data.id == 'RadioButtonList'){
                    this.PI_columnvalue.cValidate = 'required'
                    this.$refs.ref_columnvalue.isRequired = true

                    this.PI_columnname2.cProtect = true

                    this.PI_lookupcd.cProtect = true
                    this.PI_lookupdb.cProtect = true
                    this.PI_lookuptable.cProtect = true
                    this.PI_lookupdbdescs.cProtect = true
                    this.PI_lookupdbparameter.cProtect = true
                    this.PI_masterurl.cProtect = true
                    this.PI_lookupinitialwhere.cProtect = true

                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_lookuptable.isRequired = false
                    this.$refs.ref_lookupdbdescs.isRequired = false
                    this.$refs.ref_lookupdbparameter.isRequired = false
                    
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_lookuptable.cValidate = ''
                    this.PI_lookupdbdescs.cValidate = ''
                    this.PI_lookupdbparameter.cValidate = ''

                    this.PI_runningnostatus.cProtect = true
                    this.PI_runningcdtablename.cProtect = true
                    this.PI_runningcdcolumnspec.cProtect = true

                    this.PI_maxlength.cProtect = true
                    this.M_SS_ColumnParameter.maxlength = ''
                }
                else if( data.id == 'Dropdown'){
                    this.PI_columnvalue.cValidate = 'required'
                    this.$refs.ref_columnvalue.isRequired = true

                    this.PI_columnname2.cProtect = true

                    this.PI_lookupcd.cProtect = true
                    this.PI_lookupdb.cProtect = true
                    this.PI_lookuptable.cProtect = true
                    this.PI_lookupdbdescs.cProtect = true
                    this.PI_lookupdbparameter.cProtect = true
                    this.PI_masterurl.cProtect = true
                    this.PI_lookupinitialwhere.cProtect = true

                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_lookuptable.isRequired = false
                    this.$refs.ref_lookupdbdescs.isRequired = false
                    this.$refs.ref_lookupdbparameter.isRequired = false
                    
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_lookuptable.cValidate = ''
                    this.PI_lookupdbdescs.cValidate = ''
                    this.PI_lookupdbparameter.cValidate = ''

                    this.PI_runningnostatus.cProtect = true
                    this.PI_runningcdtablename.cProtect = true
                    this.PI_runningcdcolumnspec.cProtect = true

                    this.PI_maxlength.cProtect = true
                    this.M_SS_ColumnParameter.maxlength = ''
                }
                else if( data.id == 'CheckBox'){
                    this.PI_columnvalue.cValidate = 'required'
                    this.$refs.ref_columnvalue.isRequired = true

                    this.PI_columnname2.cProtect = true
                    
                    this.PI_lookupcd.cProtect = true
                    this.PI_lookupdb.cProtect = true
                    this.PI_lookuptable.cProtect = true
                    this.PI_lookupdbdescs.cProtect = true
                    this.PI_lookupdbparameter.cProtect = true
                    this.PI_masterurl.cProtect = true
                    this.PI_lookupinitialwhere.cProtect = true

                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_lookuptable.isRequired = false
                    this.$refs.ref_lookupdbdescs.isRequired = false
                    this.$refs.ref_lookupdbparameter.isRequired = false
                    
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_lookuptable.cValidate = ''
                    this.PI_lookupdbdescs.cValidate = ''
                    this.PI_lookupdbparameter.cValidate = ''

                    this.PI_runningnostatus.cProtect = true
                    this.PI_runningcdtablename.cProtect = true
                    this.PI_runningcdcolumnspec.cProtect = true

                    this.PI_maxlength.cProtect = true
                    this.M_SS_ColumnParameter.maxlength = ''
                }
                else if( data.id == 'String'){
                    this.PI_runningnostatus.cProtect = false
                    this.PI_runningcdtablename.cProtect = false
                    this.PI_runningcdcolumnspec.cProtect = false

                    this.PI_maxlength.cProtect = false

                    this.PI_columnname2.cProtect = true

                    this.PI_columnvalue.cValidate = ''
                    this.$refs.ref_columnvalue.isRequired = false

                    this.PI_lookupcd.cProtect = true
                    this.PI_lookupdb.cProtect = true
                    this.PI_lookuptable.cProtect = true
                    this.PI_lookupdbdescs.cProtect = true
                    this.PI_lookupdbparameter.cProtect = true
                    this.PI_masterurl.cProtect = true
                    this.PI_lookupinitialwhere.cProtect = true

                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_lookuptable.isRequired = false
                    this.$refs.ref_lookupdbdescs.isRequired = false
                    this.$refs.ref_lookupdbparameter.isRequired = false
                    
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_lookuptable.cValidate = ''
                    this.PI_lookupdbdescs.cValidate = ''
                    this.PI_lookupdbparameter.cValidate = ''
                }
                else if( data.id == 'TextArea'){
                    this.PI_maxlength.cProtect = false

                    this.PI_columnname2.cProtect = true

                    this.PI_columnvalue.cValidate = ''
                    this.$refs.ref_columnvalue.isRequired = false

                    this.PI_lookupcd.cProtect = true
                    this.PI_lookupdb.cProtect = true
                    this.PI_lookuptable.cProtect = true
                    this.PI_lookupdbdescs.cProtect = true
                    this.PI_lookupdbparameter.cProtect = true
                    this.PI_masterurl.cProtect = true
                    this.PI_lookupinitialwhere.cProtect = true

                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_lookuptable.isRequired = false
                    this.$refs.ref_lookupdbdescs.isRequired = false
                    this.$refs.ref_lookupdbparameter.isRequired = false
                    
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_lookuptable.cValidate = ''
                    this.PI_lookupdbdescs.cValidate = ''
                    this.PI_lookupdbparameter.cValidate = ''

                    this.PI_runningnostatus.cProtect = true
                    this.PI_runningcdtablename.cProtect = true
                    this.PI_runningcdcolumnspec.cProtect = true
                }
                else{
                    this.PI_columnname2.cProtect = true

                    this.PI_columnvalue.cValidate = ''
                    this.$refs.ref_columnvalue.isRequired = false

                    this.PI_lookupcd.cProtect = true
                    this.PI_lookupdb.cProtect = true
                    this.PI_lookuptable.cProtect = true
                    this.PI_lookupdbdescs.cProtect = true
                    this.PI_lookupdbparameter.cProtect = true
                    this.PI_masterurl.cProtect = true
                    this.PI_lookupinitialwhere.cProtect = true

                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_lookuptable.isRequired = false
                    this.$refs.ref_lookupdbdescs.isRequired = false
                    this.$refs.ref_lookupdbparameter.isRequired = false
                    
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_lookuptable.cValidate = ''
                    this.PI_lookupdbdescs.cValidate = ''
                    this.PI_lookupdbparameter.cValidate = ''

                    this.PI_runningnostatus.cProtect = true
                    this.PI_runningcdtablename.cProtect = true
                    this.PI_runningcdcolumnspec.cProtect = true

                    this.PI_maxlength.cProtect = true
                    this.M_SS_ColumnParameter.maxlength = ''
                }
            }
        })
        this.$forceUpdate()
        },
        OncolumnnameChange(data) {
            // console.log(data)
            this.M_SS_ColumnParameter.columnname = data.label
            this.M_SS_ColumnParameter.columnnameLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                if(this.M_SS_ColumnParameter.columntype == 'String' || this.M_SS_ColumnParameter.columntype == 'TextArea'){
                    this.M_SS_ColumnParameter.maxlength = data.character_maximum_length
                }else{
                    this.M_SS_ColumnParameter.maxlength = ''
                }

                if(data.is_nullable == 'YES'){
                    this.M_SS_ColumnParameter.isrequired = 'False'
                }
                else{
                    this.M_SS_ColumnParameter.isrequired = 'True'
                }

                if(data.is_key == 'Y'){
                    this.M_SS_ColumnParameter.iskey = 'True'
                }
                else{
                    this.M_SS_ColumnParameter.iskey = 'False'
                }
            }
        })
        this.$forceUpdate()
        },
        Oncolumnname2Change(data) {
            this.M_SS_ColumnParameter.columnname2 = data.label
            this.M_SS_ColumnParameter.columnname2Label = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
            }
        })
        this.$forceUpdate()
        },
        OnrunningnostatusChange(data) {
            // console.log(data)
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                if(data == 'True'){
                    this.PI_runningcdtablename.cValidate = 'required'
                    this.PI_runningcdcolumnspec.cValidate = 'required'
                    this.$refs.ref_runningcdtablename.isRequired = true
                    this.$refs.ref_runningcdcolumnspec.isRequired = true
                }
                else{
                    this.PI_runningcdtablename.cValidate = ''
                    this.PI_runningcdcolumnspec.cValidate = ''
                    this.$refs.ref_runningcdtablename.isRequired = false
                    this.$refs.ref_runningcdcolumnspec.isRequired = false
                }
            }
        })
        this.$forceUpdate()
        },
        OnrunningcdtablenameChange(data) {
            // console.log(data)
            this.M_SS_ColumnParameter.runningcdtablename = data.id
            this.M_SS_ColumnParameter.runningcdtablenameLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                this.PI_runningcdcolumnspec.dataLookUp.InitialWhere = "table_name='"+data.table_name+"'"
            }
        })
        this.$forceUpdate()
        },
        OnrunningcdcolumnspecChange(data) {
            // console.log(data)
            this.M_SS_ColumnParameter.runningcdcolumnspec = data.label
            this.M_SS_ColumnParameter.runningcdcolumnspecLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
            }
        })
        this.$forceUpdate()
        },
        OnlookuptableChange(data) {
            // console.log(data)
            this.M_SS_ColumnParameter.lookuptable = data.id
            this.M_SS_ColumnParameter.lookuptableLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                this.PI_lookupdbdescs.dataLookUp.InitialWhere = "table_name='"+data.table_name+"'"
                this.PI_lookupdbparameter.dataLookUp.InitialWhere = "table_name='"+data.table_name+"'"
            }
        })
        this.$forceUpdate()
        },
        OnlookupdbdescsChange(data) {
            // console.log(data)
            this.M_SS_ColumnParameter.lookupdbdescs = data.label
            this.M_SS_ColumnParameter.lookupdbdescsLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
            }
        })
        this.$forceUpdate()
        },
        OnlookupdbparameterChange(data) {
            // console.log(data)
            this.M_SS_ColumnParameter.lookupdbparameter = data.label
            this.M_SS_ColumnParameter.lookupdbparameterLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
            }
        })
        this.$forceUpdate()
        },
        OnlookupcdChange (data) {
            // console.log(data);
            this.M_SS_ColumnParameter.lookupcd = data.id
            this.M_SS_ColumnParameter.lookupcdLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                this.M_SS_ColumnParameter.lookupdb = data.column_db
                this.M_SS_ColumnParameter.viewname = data.view_name
                var param = {
                    OptionFunctionCd : "GetSSTableDetailLookup",
                    ModuleCd: this.Module,
                    option_lookup_cd: data.id
                }

                this.FnDynamicFunction(param)
                .then(ress => {
                    // console.log(ress)
                    var datas = ress.Data[0]
                    if (ress != null){
                        this.M_SS_ColumnParameter.viewname = datas.view_name
                        this.M_SS_ColumnParameter.lookupdb = datas.column_db
                        this.M_SS_ColumnParameter.lookuptable = datas.lookup_table
                        this.M_SS_ColumnParameter.lookupdbdescs = datas.lookup_db_descs
                        this.M_SS_ColumnParameter.lookupdbparameter = datas.lookup_db_parameter
                        this.M_SS_ColumnParameter.masterurl = datas.master_url
                    }
                })
            }
        })
        this.$forceUpdate()
        },
        OncolumnnameentryChange (data) {
                // console.log(data);
                this.M_SS_ColumnParameter.columnnameentry = data.column_name
                this.M_SS_ColumnParameter.columnnameentryLabel = data.label
            this.$nextTick(() => {
                if (this.inputStatus != "VIEW") {
    //{lookupcd}
                }
            })
        },
        OnmasterurlChange(data) {
    //   console.log(data);
          this.M_SS_ColumnParameter.masterurl = data.label
          this.M_SS_ColumnParameter.masterurlLabel = data.label
      this.$nextTick(() => {
          if (this.inputStatus != "VIEW") {
                var master = ""
                var master2 = ""

                if(data.label != ''){
                    master = data.label.split('.')[0].trim()
                    // master2 = data.label.split('.')[1].trim()
                    this.M_SS_ColumnParameter.masterurl = master
                    this.M_SS_ColumnParameter.masterurlLabel = master
                }
                // console.log(master);
                // console.log(master2);
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
            this.getModal(this.M_SS_ColumnParameter.viewname)
        },
        paramFromParent(){
            let data = this.$store.getters.GetPage1Data
            // console.log(data.header_id)
            this.M_SS_ColumnParameter.headerid = data.header_id
            this.PI_columnname.dataLookUp.InitialWhere = "table_name='"+data.table_name+"'"
            this.PI_columnname2.dataLookUp.InitialWhere = "table_name='"+data.table_name+"'"
            this.PI_columnnameentry.dataLookUp.ParamView = ""+data.header_id+",'"+data.table_name+"'"

            // console.log(this.PI_columnnameentry.dataLookUp.ParamView)
            // console.log('1');
            this.getDataFrmParameter()
            this.M_ClearForm()
        },	
        M_Post(){
        },
        M_Refresh(){
            this.getDataFrmParameter()
        },
        M_NgeSave(){
            var inputcolumname = ''
            if(this.M_SS_ColumnParameter.columntype == 'DateRange'){
                inputcolumname = this.M_SS_ColumnParameter.columnname + ',' + this.M_SS_ColumnParameter.columnname2
            }
            else{
                inputcolumname = this.M_SS_ColumnParameter.columnname
            }

            if (this.inputStatus == 'NEW') {
                // console.log(this.DataRowPage1.header_id)
                var param = {
                    OptionSeq: this.getOptionSeq().OptionSeq ,
                    LineNo: 1 ,
                    header_id: this.DataRowPage1.header_id,
                    position: this.M_SS_ColumnParameter.position,
                    row_no: this.M_SS_ColumnParameter.rowno == '' || this.M_SS_ColumnParameter.rowno == null ? 0 : this.M_SS_ColumnParameter.rowno,
                    column_name: inputcolumname,
                    column_label: this.M_SS_ColumnParameter.columnlabel,
                    column_type: this.M_SS_ColumnParameter.columntype,
                    column_value: this.M_SS_ColumnParameter.columnvalue,
                    corder: this.M_SS_ColumnParameter.corder == '' || this.M_SS_ColumnParameter.corder == null ? 0 : this.M_SS_ColumnParameter.corder,
                    max_length: this.M_SS_ColumnParameter.maxlength == '' || this.M_SS_ColumnParameter.maxlength == null ? 0 : this.M_SS_ColumnParameter.maxlength,
                    lookup_cd: this.M_SS_ColumnParameter.lookupcd,
                    lookup_table: this.M_SS_ColumnParameter.lookuptable,
                    lookup_db: this.M_SS_ColumnParameter.lookupdb,
                    lookup_db_descs: this.M_SS_ColumnParameter.lookupdbdescs,
                    lookup_db_parameter: this.M_SS_ColumnParameter.lookupdbparameter,
                    lookup_initial_where: this.M_SS_ColumnParameter.lookupinitialwhere,
                    cmaster_url: this.M_SS_ColumnParameter.masterurl,
                    is_required: this.M_SS_ColumnParameter.isrequired == '' || this.M_SS_ColumnParameter.isrequired == null ? 'False' : this.M_SS_ColumnParameter.isrequired,
                    is_visible: this.M_SS_ColumnParameter.isvisible == '' || this.M_SS_ColumnParameter.isvisible == null ? 'True' : this.M_SS_ColumnParameter.isvisible,
                    is_key: this.M_SS_ColumnParameter.iskey == '' || this.M_SS_ColumnParameter.iskey == null ? 'False' : this.M_SS_ColumnParameter.iskey,
                    is_protected: this.M_SS_ColumnParameter.isprotected == '' || this.M_SS_ColumnParameter.isprotected == null ? 'False' : this.M_SS_ColumnParameter.isprotected,
                    user_edit: this.getDataUser().user_id,
                    running_no_status: this.M_SS_ColumnParameter.runningnostatus,
                    running_cd_table_name: this.M_SS_ColumnParameter.runningcdtablename == '' || this.M_SS_ColumnParameter.runningcdtablename == null ? 'NULL' : this.M_SS_ColumnParameter.runningcdtablename,
                    running_cd_column_spec: this.M_SS_ColumnParameter.runningcdcolumnspec == '' || this.M_SS_ColumnParameter.runningcdcolumnspec == null ? 'NULL' : this.M_SS_ColumnParameter.runningcdcolumnspec
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
                        // this.formParameter1 = [] 
                        //set Form to View (again)
                        this.$store.commit('setStatus', 'VIEW')
                        // this.formParameter1Selected jadi null semua (1,2,0)
                        this.listDisabled = false
                        this.formParameter1Selected = null
                        this.formParameter2Selected = null
                        this.formParameter0Selected = null
                        this.getDataFrmParameter()

                    })
                })
            }
            else if (this.inputStatus == 'EDIT') {
                // console.log(this.M_SS_ColumnParameter);
                var param = {
                    OptionSeq: this.getOptionSeq().OptionSeq ,
                    LineNo: 1 ,
                    detail_id: this.M_SS_ColumnParameter.detailid,
                    position: this.M_SS_ColumnParameter.position,
                    row_no: this.M_SS_ColumnParameter.rowno == '' || this.M_SS_ColumnParameter.rowno == null ? 0 : this.M_SS_ColumnParameter.rowno,
                    column_name: inputcolumname,
                    column_label: this.M_SS_ColumnParameter.columnlabel,
                    column_type: this.M_SS_ColumnParameter.columntype,
                    column_value: this.M_SS_ColumnParameter.columnvalue,
                    corder: this.M_SS_ColumnParameter.corder == '' || this.M_SS_ColumnParameter.corder == null ? 0 : this.M_SS_ColumnParameter.corder,
                    max_length: this.M_SS_ColumnParameter.maxlength == '' || this.M_SS_ColumnParameter.maxlength == null ? 0 : this.M_SS_ColumnParameter.maxlength,
                    lookup_cd: this.M_SS_ColumnParameter.lookupcd,
                    lookup_table: this.M_SS_ColumnParameter.lookuptable,
                    lookup_db: this.M_SS_ColumnParameter.lookupdb,
                    lookup_db_descs: this.M_SS_ColumnParameter.lookupdbdescs,
                    lookup_db_parameter: this.M_SS_ColumnParameter.lookupdbparameter,
                    lookup_initial_where: this.M_SS_ColumnParameter.lookupinitialwhere,
                    cmaster_url: this.M_SS_ColumnParameter.masterurl,
                    is_required: this.M_SS_ColumnParameter.isrequired == '' || this.M_SS_ColumnParameter.isrequired == null ? 'False' : this.M_SS_ColumnParameter.isrequired,
                    is_visible: this.M_SS_ColumnParameter.isvisible == '' || this.M_SS_ColumnParameter.isvisible == null ? 'True' : this.M_SS_ColumnParameter.isvisible,
                    is_key: this.M_SS_ColumnParameter.iskey == '' || this.M_SS_ColumnParameter.iskey == null ? 'False' : this.M_SS_ColumnParameter.iskey,
                    is_protected: this.M_SS_ColumnParameter.isprotected == '' || this.M_SS_ColumnParameter.isprotected == null ? 'False' : this.M_SS_ColumnParameter.isprotected,
                    user_edit: this.getDataUser().user_id,
                    running_no_status: this.M_SS_ColumnParameter.runningnostatus,
                    running_cd_table_name: this.M_SS_ColumnParameter.runningcdtablename == '' || this.M_SS_ColumnParameter.runningcdtablename == null ? 'NULL' : this.M_SS_ColumnParameter.runningcdtablename,
                    running_cd_column_spec: this.M_SS_ColumnParameter.runningcdcolumnspec == '' || this.M_SS_ColumnParameter.runningcdcolumnspec == null ? 'NULL' : this.M_SS_ColumnParameter.runningcdcolumnspec
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
                        // this.formParameter1 = [] 
                        
                        this.$store.commit('setStatus', 'VIEW')
                        this.listDisabled = false
                        this.formParameter1Selected = null
                        this.formParameter2Selected = null
                        this.formParameter0Selected = null
                        this.getDataFrmParameter()
                    })
                })
            }
        },
        M_Save(){
            // console.log(this.M_SS_ColumnParameter)
            // return
            // alert(this.$store.getters.getStatus.toUpperCase())
            var scopeForm = "FormScope_" + this.PageLevel + "_" + this.TabIndex
            this.$validator._base.validateAll(scopeForm).then((result) => {
                if (!result) return
                this.alertConfirmation("Are You Sure Want To Save This Data ?")
                .then(ress => {
                    if (ress.value) {
                        this.M_NgeSave()
                    }
                })
            })
        },
        M_Save2(){
            var param = {
                    OptionSeq: this.getOptionSeq().OptionSeq ,
                    LineNo: 2 ,
                    header_id: this.DataRowPage1.header_id,
                    table_name: this.DataRowPage1.table_name,
                    column_name: this.M_SS_ColumnParameter.columnnameentry
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
                        // this.formParameter1 = [] 
                        //set Form to View (again)
                        this.$store.commit('setStatus', 'VIEW')
                        // this.formParameter1Selected jadi null semua (1,2,0)
                        this.listDisabled = false
                        this.formParameter1Selected = null
                        this.formParameter2Selected = null
                        this.formParameter0Selected = null
                        this.getDataFrmParameter()

                        this.$refs.modalFormParameter0.hide()

                    })
                })
        },
        M_Insert(){
        },
        M_Update(){
            this.$store.commit('setStatus', 'EDIT')
        },
        M_ClearForm(){
            this.M_SS_ColumnParameter = {
                detailid: '',
                headerid: this.DataRowPage1.header_id,
                position: '',
                rowno: '',
                columnname: '',
                columnlabel: '',
                columntype: '',
                columnvalue: '',
                corder: '',
                maxlength: '',
                lookupcd: '',
                lookuptable: '',
                lookupdb: '',
                lookupdbdescs: '',
                lookupdbparameter: '',
                lookupinitialwhere: '',
                isrequired: 'False',
                isvisible: 'True',
                iskey: 'False',
                isprotected: 'False',
                userinput: '',
                useredit: '',
                timeinput: '',
                timeedit: '',
                runningnostatus: 'False',
                runningcdtablename: '',
                runningcdcolumnspec: '',
                masterurl: ''
            }
        },
        M_New(){
            let data = this.$store.getters.GetPage1Data
            // console.log(data);

            this.M_SS_ColumnParameter.headerid = data.header_id
            this.$refs.ref_columntype.focus()
        },
        M_Edit(){
            let data = this.$store.getters.GetPage1Data

            this.M_SS_ColumnParameter.headerid = data.header_id
            this.$refs.ref_columntype.focus()
        },
        M_Delete(){
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: 1,
                detail_id: this.M_SS_ColumnParameter.detailid,
            }
            
            this.postJSON( this.getUrlDelete(), param )
            .then(response => {
                if (response == null) return

                this.alertSuccess("Deleting Data Successfully")
                .then(() => {
                    this.formParameter1 = []
                    this.formParameter2 = []
                    this.formParameter0 =[]
                    this.formParameter1Selected = null
                    this.formParameter2Selected = null
                    this.formParameter0Selected = null
                    
                    this.getDataFrmParameter()
                    this.M_ClearForm()
                    this.$store.commit('setStatus', 'VIEW')
                })
            })
        },
        M_Delete2 (){
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: 2,
                detail_id: this.M_SS_ColumnParameter.detailid,
            }
            
            this.postJSON( this.getUrlDelete(), param )
            .then(response => {
                if (response == null) return

                this.alertSuccess("Deleting Data Successfully")
                .then(() => {
                    this.formParameter1 = []
                    this.formParameter2 = []
                    this.formParameter0 =[]
                    this.formParameter1Selected = null
                    this.formParameter2Selected = null
                    this.formParameter0Selected = null
                    
                    this.getDataFrmParameter()
                    this.M_ClearForm()
                    this.$store.commit('setStatus', 'VIEW')
                })
            })
        },
        beforeGetDataBy (record) {
            // console.log(this.formParameter0Selected)
            // console.log(this.formParameter1Selected)
            // console.log(this.formParameter2Selected)
            // this.$nextTick(() => {
                if (record.position.toString() == "1") {
                    this.formParameter0Selected = null
                    this.formParameter2Selected = null
                }
                else if (record.position == "2") {
                    this.formParameter1Selected = null
                    this.formParameter0Selected = null
                }
                else if (record.position == "0") {
                    this.formParameter1Selected = null
                    this.formParameter2Selected = null
                }
                this.getDataBy(record)
            // })
        },
        getDataBy (record) {
            this.tempParam = record
            
            // if (this.inputStatus != 'VIEW') return
            // console.log(record)
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: 2,	
                detail_id: record.detailid,
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return
                var column = ""
                var column2 = ""

                var data = response.Data[0]
                // console.log(data);

                if(data.column_type == 'DateRange'){
                    column = data.column_name.split(',')[0].trim()
                    column2 = data.column_name.split(',')[1].trim()
                }
                else{
                    column = data.column_name
                    column2 = ''
                }
                

                this.M_SS_ColumnParameter = {
                    detailid: data.detail_id,
                    headerid: data.header_id,
                    position: data.position,
                    rowno: data.row_no,
                    columnname: column,
                    columnname2: column2,
                    columnlabel: data.column_label,
                    columntype: data.column_type,
                    columnvalue: data.column_value,
                    corder: data.corder,
                    maxlength: data.max_length,
                    lookupcd: data.lookup_cd,
                    lookuptable: data.lookup_table,
                    lookupdb: data.lookup_db,
                    lookupdbdescs: data.lookup_db_descs,
                    lookupdbparameter: data.lookup_db_parameter,
                    lookupinitialwhere: data.lookup_initial_where,
                    isrequired: data.is_required,
                    isvisible: data.is_visible,
                    iskey: data.is_key,
                    isprotected: data.is_protected,
                    userinput: data.user_input,
                    useredit: data.user_edit,
                    timeinput: data.time_input,
                    timeedit: data.time_edit,
                    runningnostatus: data.running_no_status,
                    runningcdtablename: data.running_cd_table_name,
                    runningcdcolumnspec: data.running_cd_column_spec,
                    masterurl: data.cmaster_url
                }
               
                if(data.column_type == 'DateRange'){
                    this.PI_columnname2.cProtect = false

                    this.PI_columnvalue.cValidate = ''
                    this.$refs.ref_columnvalue.isRequired = false

                    this.PI_lookupcd.cProtect = true
                    this.PI_lookupdb.cProtect = true
                    this.PI_lookuptable.cProtect = true
                    this.PI_lookupdbdescs.cProtect = true
                    this.PI_lookupdbparameter.cProtect = true
                    this.PI_masterurl.cProtect = true
                    this.PI_lookupinitialwhere.cProtect = true

                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_lookuptable.isRequired = false
                    this.$refs.ref_lookupdbdescs.isRequired = false
                    this.$refs.ref_lookupdbparameter.isRequired = false
                    
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_lookuptable.cValidate = ''
                    this.PI_lookupdbdescs.cValidate = ''
                    this.PI_lookupdbparameter.cValidate = ''

                    this.PI_runningnostatus.cProtect = true
                    this.PI_runningcdtablename.cProtect = true
                    this.PI_runningcdcolumnspec.cProtect = true

                    this.PI_maxlength.cProtect = true
                    this.M_SS_ColumnParameter.maxlength = ''
                }
                else if( data.column_type == 'TimeRange'){
                    this.PI_columnname2.cProtect = false

                    this.PI_columnvalue.cValidate = ''
                    this.$refs.ref_columnvalue.isRequired = false

                    this.PI_lookupcd.cProtect = true
                    this.PI_lookupdb.cProtect = true
                    this.PI_lookuptable.cProtect = true
                    this.PI_lookupdbdescs.cProtect = true
                    this.PI_lookupdbparameter.cProtect = true
                    this.PI_masterurl.cProtect = true
                    this.PI_lookupinitialwhere.cProtect = true

                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_lookuptable.isRequired = false
                    this.$refs.ref_lookupdbdescs.isRequired = false
                    this.$refs.ref_lookupdbparameter.isRequired = false
                    
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_lookuptable.cValidate = ''
                    this.PI_lookupdbdescs.cValidate = ''
                    this.PI_lookupdbparameter.cValidate = ''

                    this.PI_runningnostatus.cProtect = true
                    this.PI_runningcdtablename.cProtect = true
                    this.PI_runningcdcolumnspec.cProtect = true

                    this.PI_maxlength.cProtect = true
                    this.M_SS_ColumnParameter.maxlength = ''
                }
                else if( data.column_type == 'LookUp'){
                    this.PI_columnname2.cProtect = true

                    this.PI_columnvalue.cValidate = ''
                    this.$refs.ref_columnvalue.isRequired = false

                    this.PI_lookupcd.cProtect = false
                    this.PI_lookupdb.cProtect = false
                    this.PI_lookuptable.cProtect = false
                    this.PI_lookupdbdescs.cProtect = false
                    this.PI_lookupdbparameter.cProtect = false
                    this.PI_masterurl.cProtect = false
                    this.PI_lookupinitialwhere.cProtect = false

                    this.$refs.ref_lookupcd.isRequired = true
                    this.$refs.ref_lookupdb.isRequired = true
                    this.$refs.ref_lookuptable.isRequired = true
                    this.$refs.ref_lookupdbdescs.isRequired = true
                    this.$refs.ref_lookupdbparameter.isRequired = true
                    
                    this.PI_lookupcd.cValidate = 'required'
                    this.PI_lookupdb.cValidate = 'required'
                    this.PI_lookuptable.cValidate = 'required'
                    this.PI_lookupdbdescs.cValidate = 'required'
                    this.PI_lookupdbparameter.cValidate = 'required'


                    this.PI_runningnostatus.cProtect = true
                    this.PI_runningcdtablename.cProtect = true
                    this.PI_runningcdcolumnspec.cProtect = true

                    this.PI_maxlength.cProtect = true
                    this.M_SS_ColumnParameter.maxlength = ''
                }
                else if( data.column_type == 'RadioButtonList'){
                    this.PI_columnvalue.cValidate = 'required'
                    this.$refs.ref_columnvalue.isRequired = true

                    this.PI_columnname2.cProtect = true

                    this.PI_lookupcd.cProtect = true
                    this.PI_lookupdb.cProtect = true
                    this.PI_lookuptable.cProtect = true
                    this.PI_lookupdbdescs.cProtect = true
                    this.PI_lookupdbparameter.cProtect = true
                    this.PI_masterurl.cProtect = true
                    this.PI_lookupinitialwhere.cProtect = true

                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_lookuptable.isRequired = false
                    this.$refs.ref_lookupdbdescs.isRequired = false
                    this.$refs.ref_lookupdbparameter.isRequired = false
                    
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_lookuptable.cValidate = ''
                    this.PI_lookupdbdescs.cValidate = ''
                    this.PI_lookupdbparameter.cValidate = ''

                    this.PI_runningnostatus.cProtect = true
                    this.PI_runningcdtablename.cProtect = true
                    this.PI_runningcdcolumnspec.cProtect = true

                    this.PI_maxlength.cProtect = true
                    this.M_SS_ColumnParameter.maxlength = ''
                }
                else if( data.column_type == 'Dropdown'){
                    this.PI_columnvalue.cValidate = 'required'
                    this.$refs.ref_columnvalue.isRequired = true

                    this.PI_columnname2.cProtect = true

                    this.PI_lookupcd.cProtect = true
                    this.PI_lookupdb.cProtect = true
                    this.PI_lookuptable.cProtect = true
                    this.PI_lookupdbdescs.cProtect = true
                    this.PI_lookupdbparameter.cProtect = true
                    this.PI_masterurl.cProtect = true
                    this.PI_lookupinitialwhere.cProtect = true

                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_lookuptable.isRequired = false
                    this.$refs.ref_lookupdbdescs.isRequired = false
                    this.$refs.ref_lookupdbparameter.isRequired = false
                    
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_lookuptable.cValidate = ''
                    this.PI_lookupdbdescs.cValidate = ''
                    this.PI_lookupdbparameter.cValidate = ''

                    this.PI_runningnostatus.cProtect = true
                    this.PI_runningcdtablename.cProtect = true
                    this.PI_runningcdcolumnspec.cProtect = true

                    this.PI_maxlength.cProtect = true
                    this.M_SS_ColumnParameter.maxlength = ''
                }
                else if( data.column_type == 'CheckBox'){
                    this.PI_columnvalue.cValidate = 'required'
                    this.$refs.ref_columnvalue.isRequired = true

                    this.PI_columnname2.cProtect = true
                    
                    this.PI_lookupcd.cProtect = true
                    this.PI_lookupdb.cProtect = true
                    this.PI_lookuptable.cProtect = true
                    this.PI_lookupdbdescs.cProtect = true
                    this.PI_lookupdbparameter.cProtect = true
                    this.PI_masterurl.cProtect = true
                    this.PI_lookupinitialwhere.cProtect = true

                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_lookuptable.isRequired = false
                    this.$refs.ref_lookupdbdescs.isRequired = false
                    this.$refs.ref_lookupdbparameter.isRequired = false
                    
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_lookuptable.cValidate = ''
                    this.PI_lookupdbdescs.cValidate = ''
                    this.PI_lookupdbparameter.cValidate = ''

                    this.PI_runningnostatus.cProtect = true
                    this.PI_runningcdtablename.cProtect = true
                    this.PI_runningcdcolumnspec.cProtect = true

                    this.PI_maxlength.cProtect = true
                    this.M_SS_ColumnParameter.maxlength = ''
                }
                else if( data.column_type == 'String'){
                    this.PI_runningnostatus.cProtect = false
                    this.PI_runningcdtablename.cProtect = false
                    this.PI_runningcdcolumnspec.cProtect = false

                    this.PI_maxlength.cProtect = false

                    this.PI_columnname2.cProtect = true

                    this.PI_columnvalue.cValidate = ''
                    this.$refs.ref_columnvalue.isRequired = false

                    this.PI_lookupcd.cProtect = true
                    this.PI_lookupdb.cProtect = true
                    this.PI_lookuptable.cProtect = true
                    this.PI_lookupdbdescs.cProtect = true
                    this.PI_lookupdbparameter.cProtect = true
                    this.PI_masterurl.cProtect = true
                    this.PI_lookupinitialwhere.cProtect = true

                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_lookuptable.isRequired = false
                    this.$refs.ref_lookupdbdescs.isRequired = false
                    this.$refs.ref_lookupdbparameter.isRequired = false
                    
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_lookuptable.cValidate = ''
                    this.PI_lookupdbdescs.cValidate = ''
                    this.PI_lookupdbparameter.cValidate = ''
                }
                else if( data.column_type == 'TextArea'){
                    this.PI_maxlength.cProtect = false

                    this.PI_columnname2.cProtect = true

                    this.PI_columnvalue.cValidate = ''
                    this.$refs.ref_columnvalue.isRequired = false

                    this.PI_lookupcd.cProtect = true
                    this.PI_lookupdb.cProtect = true
                    this.PI_lookuptable.cProtect = true
                    this.PI_lookupdbdescs.cProtect = true
                    this.PI_lookupdbparameter.cProtect = true
                    this.PI_masterurl.cProtect = true
                    this.PI_lookupinitialwhere.cProtect = true

                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_lookuptable.isRequired = false
                    this.$refs.ref_lookupdbdescs.isRequired = false
                    this.$refs.ref_lookupdbparameter.isRequired = false
                    
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_lookuptable.cValidate = ''
                    this.PI_lookupdbdescs.cValidate = ''
                    this.PI_lookupdbparameter.cValidate = ''

                    this.PI_runningnostatus.cProtect = true
                    this.PI_runningcdtablename.cProtect = true
                    this.PI_runningcdcolumnspec.cProtect = true
                }
                else{
                    this.PI_columnname2.cProtect = true

                    this.PI_columnvalue.cValidate = ''
                    this.$refs.ref_columnvalue.isRequired = false

                    this.PI_lookupcd.cProtect = true
                    this.PI_lookupdb.cProtect = true
                    this.PI_lookuptable.cProtect = true
                    this.PI_lookupdbdescs.cProtect = true
                    this.PI_lookupdbparameter.cProtect = true
                    this.PI_masterurl.cProtect = true
                    this.PI_lookupinitialwhere.cProtect = true

                    this.$refs.ref_lookupcd.isRequired = false
                    this.$refs.ref_lookupdb.isRequired = false
                    this.$refs.ref_lookuptable.isRequired = false
                    this.$refs.ref_lookupdbdescs.isRequired = false
                    this.$refs.ref_lookupdbparameter.isRequired = false
                    
                    this.PI_lookupcd.cValidate = ''
                    this.PI_lookupdb.cValidate = ''
                    this.PI_lookuptable.cValidate = ''
                    this.PI_lookupdbdescs.cValidate = ''
                    this.PI_lookupdbparameter.cValidate = ''

                    this.PI_runningnostatus.cProtect = true
                    this.PI_runningcdtablename.cProtect = true
                    this.PI_runningcdcolumnspec.cProtect = true

                    this.PI_maxlength.cProtect = true
                    this.M_SS_ColumnParameter.maxlength = ''
                }


                if(data.running_no_status == 'True'){
                    this.PI_runningcdtablename.cValidate = 'required'
                    this.PI_runningcdcolumnspec.cValidate = 'required'
                    this.$refs.ref_runningcdtablename.isRequired = true
                    this.$refs.ref_runningcdcolumnspec.isRequired = true
                }
                else{
                    this.PI_runningcdtablename.cValidate = ''
                    this.PI_runningcdcolumnspec.cValidate = ''
                    this.$refs.ref_runningcdtablename.isRequired = false
                    this.$refs.ref_runningcdcolumnspec.isRequired = false
                }


                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit                

                this.PI_lookupdbdescs.dataLookUp.InitialWhere = "table_name='"+data.lookup_table+"'"
                this.PI_lookupdbparameter.dataLookUp.InitialWhere = "table_name='"+data.lookup_table+"'"
                this.PI_runningcdcolumnspec.dataLookUp.InitialWhere = "table_name='"+data.running_cd_table_name+"'"
                
                this.M_SS_ColumnParameter.lookupcdLabel = this.M_SS_ColumnParameter.lookupcd != null ? data.lookup_cd :''
                this.M_SS_ColumnParameter.runningcdtablenameLabel = this.M_SS_ColumnParameter.runningcdtablename != null ? data.running_cd_table_name :''
                this.M_SS_ColumnParameter.runningcdcolumnspecLabel = this.M_SS_ColumnParameter.runningcdcolumnspec != null ? data.running_cd_column_spec :''
                this.M_SS_ColumnParameter.lookuptableLabel = this.M_SS_ColumnParameter.lookuptable != null ? data.lookup_table :''
                this.M_SS_ColumnParameter.lookupdbdescsLabel = this.M_SS_ColumnParameter.lookupdbdescs != null ? data.lookup_db_descs :''
                this.M_SS_ColumnParameter.lookupdbparameterLabel = this.M_SS_ColumnParameter.lookupdbparameter != null ? data.lookup_db_parameter  :''
                this.M_SS_ColumnParameter.columnnameLabel = this.M_SS_ColumnParameter.columnname != null ? column :''
                this.M_SS_ColumnParameter.columnname2Label = this.M_SS_ColumnParameter.columnname2 != null ? column2 :''
                this.M_SS_ColumnParameter.masterurlLabel = this.M_SS_ColumnParameter.masterurl != null ? data.cmaster_url : ''

                this.$store.commit('setStatus', 'EDIT')
            })
        },
        moveUpDown (direction, from) {
            var DATAS = []
            var DATAS_SELECT = []

            if (from == '1') {
                DATAS = this.formParameter1
                DATAS_SELECT = this.formParameter1Selected
                    }
            else if (from == '2') {
                DATAS = this.formParameter2
                DATAS_SELECT = this.formParameter2Selected
                }

            if (direction == 'U') {
                // console.log(DATAS)
                var idxNow = DATAS.map(x => x.value).indexOf(DATAS_SELECT.value)
                if (idxNow < 1) return
                // console.log(idxNow)

                var rownoNow, rownoUp
                console.log(DATAS[idxNow]);
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
                    console.log(DATAS[x]);
                    dataPost.push({

                        row_no: rn,
                        detail_id: DATAS[x].value
                    })
                }

                var param = {
                    OptionSeq: this.getOptionSeq().OptionSeq ,
                    LineNo: 3 ,
                    Data: dataPost
                }
                
                this.postJSON(this.getUrlUpdateMulti(), param)
                .then(ress => {
                    if (ress == null) return
                    this.getDataFrmParameter()
                    // console.log(this.tempParam)
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
                    // console.log(DATAS[x].value)
                    dataPost.push({
                        row_no: rn,
                        detail_id: DATAS[x].value
                        })
                    }

                var param = {
                    OptionSeq: this.getOptionSeq().OptionSeq ,
                    LineNo: 3,
                    Data: dataPost
                }
                
                this.postJSON(this.getUrlUpdateMulti(), param)
                .then(ress => {
                    if (ress == null) return
                    this.getDataFrmParameter()
                    // console.log(this.tempParam)
                    this.getDataBy(this.tempParam)
                })
            }
        },
        getModal(data){
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
                UserId:this.getDataUser().UserId,
                PortfolioCd:this.getDataUser().PortfolioCd,              
                SubPortfolioCd:this.getDataUser().SubPortfolioCd,
                view: this.M_SS_ColumnParameter.viewname,
                LineNo:5,
                InitialWhere:"",
                SortField:'',
            }
              this.postJSON( this.getUrlById(), param).then(response => {
                  // response from API
                  if (response == null) return
                  this.dataModal = response.Data
              })
        },
        openformParameter1(){
            // this.FormType = 'FORM'
            this.$store.commit('setStatus', 'NEW')
            this.M_ClearForm()
            this.M_SS_ColumnParameter.position = "1"
            this.listDisabled = true

        },
        openformParameter2(){
            // this.FormType = 'FORM'
            this.$store.commit('setStatus', 'NEW')
            this.M_ClearForm()
            this.listDisabled = true
            this.M_SS_ColumnParameter.position = "2"

        },
        openFormParameter0(){
            this.M_SS_ColumnParameter.columnnameentry = ''

            this.$store.commit('setStatus', 'MODULEENTRY')
            this.$refs.modalFormParameter0.show()

        },
        getDataFrmParameter(){
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: 1,
                header_id: this.DataRowPage1.header_id
            }
            this.postJSON( this.getUrlById(), param )
            .then( response => {
                if(response == null) return
                var data = response.Data 
                // console.log(data)
                this.formParameter1 = []
                this.formParameter2 = []
                this.formParameter0 = []

                if(data.length > 0){
                    // this.$nextTick(() => {
                        data.forEach((dt, idx) => {
                            // console.log(dt)
                            // dt.position.filters()f
                            // if(dt.paramname && dt.paramname != ''){
                                if (dt.position.toString() == '1') {
                                    this.formParameter1.push({
                                        value: dt.detail_id,
                                        key: dt.column_name, 
                                        headerid: dt.header_id,
                                        detailid: dt.detail_id,
                                        position: dt.position,
                                        rowno: dt.row_no
                                    })
                                }
                                else if (dt.position.toString() == '2') {
                                    this.formParameter2.push({
                                        value: dt.detail_id,
                                        key: dt.column_name, 
                                        headerid: dt.header_id,
                                        detailid: dt.detail_id,
                                        position: dt.position,
                                        rowno: dt.row_no
                                    })
                                }
                                else {
                                    this.formParameter0.push({
                                        value: dt.detail_id,
                                        key: dt.column_name, 
                                        headerid: dt.header_id,
                                        detailid: dt.detail_id,
                                        position: dt.position,
                                        rowno: dt.row_no
                                    })
                                }
                            // }
                        })
                    // })
                }
            })
        }
    },
    beforeCreate: function () {
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