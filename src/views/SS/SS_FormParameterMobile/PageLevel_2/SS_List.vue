<template>
    <div>
        <b-row style="padding-top:10px; padding-right: 10px; padding-left: 20px; padding-bottom: 10px; !important; height: 1050px !important;">
             <b-col sm="2">
                <div>Picture</div>
                <b-form :data-vv-scope="'FormScope2_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope2_' + PageLevel + '_' + TabIndex">
                    <b-row style="padding-top:10px;">					
                        <b-col md="12" id="col-left"> <!-- table open -->
                             <b-row>
                                <b-col>
                                    <ABSProcessInputSelect2 @change="OncolumntypepictChange" :inputStatus="FormStatus2" :prop="PI_columntypepict" :value="M_SS_SettingsListPict.columntypepict" :label="M_SS_SettingsListPict.columntypepictLabel"  ref="ref_columntypepict"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col>
                                    <ABSProcessInputSelectList @change="OncolumnnamepictChange" :inputStatus="FormStatus2" :prop="PI_columnnamepict" :value="M_SS_SettingsListPict.columnnamepict" :label="M_SS_SettingsListPict.columnnamepictLabel"  ref="ref_columnnamepict"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col>
                                    <ABSProcessInputSelect2 @change="OncolumncolourpictChange" :inputStatus="FormStatus2" :prop="PI_columncolourpict" :value="M_SS_SettingsListPict.columncolourpict" :label="M_SS_SettingsListPict.columncolourpictLabel" ref="ref_columncolourpict"/>
                                </b-col>
                            </b-row>
                             <b-row>
                                <b-col>
                                    <b-button size="sm" :disabled="FormStatus2=='view'" class="float-right btnModal__btnCancel" @click="M_CancelPict">
                                        Cancel
                                    </b-button>
                                    <b-button size="sm" :disabled="FormStatus2=='view'" class="float-right btnModal__btnOK" variant="primary" @click="M_SavePict">
                                        OK
                                    </b-button>
                                </b-col>
                            </b-row>
                        </b-col> <!-- table close -->
                    </b-row>
                </b-form>
            </b-col>
            <b-col sm="3">
                <ABSButton @click="openformParameter1" icon="plus" text="Add" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton @click="M_Delete" icon="trash" text="Delete" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <ABSButton @click="moveUpDown('U','1')" icon="arrow-up" text="Up" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton @click="moveUpDown('D','1')" icon="arrow-down" text="Down" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <div>Position 1</div>
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
             <b-col sm="3">
                <ABSButton @click="openformParameter2" icon="plus" text="Add" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton @click="M_Delete" icon="trash" text="Delete" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <ABSButton @click="moveUpDown('U','2')" icon="arrow-up" text="Up" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton @click="moveUpDown('D','2')" icon="arrow-down" text="Down" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <div>Position 2</div>
                <ABSMultiSelect
                    id="MySelect"
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
                                <b-col md="10">
                                    <ABSProcessInputSelect2 @change="OncolumntypeChange" :inputStatus="FormStatus" :prop="PI_columntype" :value="M_SS_SettingsList.columntype" :label="M_SS_SettingsList.columntypeLabel"  ref="ref_columntype "/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="10">
                                    <ABSProcessInputSelectList @change="OncolumnnameChange" :inputStatus="FormStatus" :prop="PI_columnname" :value="M_SS_SettingsList.columnname" :label="M_SS_SettingsList.columnnameLabel"  ref="ref_columnname "/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="3" class="lbl-col-align" style="right: -10px;">
                                    <label :class="inputStatus==FormStatus ? 'lbl-view-form' : 'text-field-form'" for="">Pst</label>
                                </b-col>
                                <b-col md="1" style="margin-left: 12px;">
                                    <ABSProcessTextBoxOnly :inputStatus="FormStatus" :prop="PI_position" v-model="M_SS_SettingsList.position" ref="ref_position"/>
                                </b-col>
                                 <b-col md="3" class="lbl-col-align" style="right: 30px;">
                                    <label :class="inputStatus==FormStatus ? 'lbl-view-form' : 'text-field-form'" for="">Row</label>
                                </b-col>
                                <b-col md="1" style="margin-left: 1px;right: 31px;">
                                    <ABSProcessTextBoxOnly :inputStatus="FormStatus" :prop="PI_rowno" v-model="M_SS_SettingsList.rowno" ref="ref_rowno"/>
                                </b-col>
                            </b-row>
                             <b-row>
                                <b-col md="10">
                                    <ABSProcessinputText @input="OnlabelChange" :inputStatus="FormStatus" :prop="PI_label" v-model="M_SS_SettingsList.label"  ref="ref_label"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="10">
                                    <ABSProcessinputRadioButton @input="OncolumnsizeChange" :inputStatus="FormStatus" :prop="PI_columnsize" v-model="M_SS_SettingsList.columnsize" ref="ref_columnsize"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="10">
                                    <ABSProcessinputRadioButton @input="OnisfieldboldChange" :inputStatus="FormStatus" :prop="PI_isfieldbold" v-model="M_SS_SettingsList.isfieldbold" ref="ref_isfieldbold"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="10">
                                    <ABSProcessInputSelect2 @change="OncolumncolourChange" :inputStatus="FormStatus" :prop="PI_columncolour" :value="M_SS_SettingsList.columncolour" :label="M_SS_SettingsList.columncolourLabel" ref="ref_columncolour"/>
                                </b-col>
                            </b-row>
                        </b-col> <!-- table close -->
                    </b-row>
                </b-form>
            </b-col>
        </b-row>
    </div>
</template>

<script>
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
            editStatus: false,
            addStatus: false,
            addStatus2: false,
            disabledStatus: true,
            LogBookOption: null,
            widthModal :'80%',
            FormStatus: 'view',
            FormStatus2: 'new', 
            paragraphs: [true],
            timer: null,

            dataModal:[],
            IEBy: {Input: '', Edit: ''},
            M_SS_SettingsList :{
                detaillistid: 0,
                headerid: 0,
                position: '',
                rowno: '',
                columntype: 'CB',
                columnname: '',
                columncolour: '555555',
                columnsize: 'S',
                iconurl: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                label: '',
                isfieldbold: 'False',
                lastupdatestamp: 0
                
            },
            M_SS_SettingsListPict:{
                columntypepict: '',
                columnnamepict: '',
                columncolourpict: '',
                detaillistid: '',
                headerid: '',
                lastupdatestamp: 0
            },

            
            PI_columntype: { 
                dataLookUp: null, 
                cValidate :'required', 
                cName: 'columntype', 
                cLabel: 'Column Type', 
                cLabelSize: 4, 
                cOrder: 201, 
                cKey: false, 
                cType: 'text',
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cStatic: true, 
                cOption: [
                    { label: 'Status', id: 'FCS' },
                    { label: 'Image', id: 'FCI' },
                    { label: 'Text', id: 'FCT' },
                    { label: 'Data', id: 'CB' }],
                cMasterUrl: '' ,
                cDisplayColumn: '' 
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
                cOrder: 202, 
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
            PI_position: { 
                cValidate :'', 
                cName: 'position', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 203, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_rowno: { 
                cValidate :'', 
                cName: 'rowno', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 204, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_label: { 
                cValidate :'', 
                cName: 'label', 
                cLabel: 'Label', 
                cLabelSize: 4, 
                cOrder: 205, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_columnsize: { 
                cValidate :'', 
                cName: 'columnsize', 
                cLabel: 'Size', 
                cId: 'rdbcolumnsize', 
                cRadioOptions: [{ text: 'Small', value: 'S' }, { text: 'Large', value: 'L' }], 
                cLabelSize: 4, 
                cOrder: 207, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_isfieldbold: { 
                cValidate :'', 
                cName: 'isfieldbold', 
                cLabel: 'Bold', 
                cId: 'rdbisfieldbold', 
                cRadioOptions: [{ text: 'Yes', value: 'True' }, { text: 'No', value: 'False' }], 
                cLabelSize: 4, 
                cOrder: 207, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_columncolour: { 
                dataLookUp: null, 
                cValidate :'', 
                cName: 'columncolour', 
                cLabel: 'Colour', 
                cLabelSize: 4, 
                cOrder: 208, 
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
                    { label: 'Black', id: '555555' },
                    { label: 'Red', id: 'F50404' },
                    { label: 'Green', id: '2C9D05' },
                    { label: 'Blue', id: '0680FF' },
                    { label: 'Orange', id: 'F99500' }],
                cMasterUrl: '' ,
                cDisplayColumn: '' 
            }, 
            PI_columntypepict: { 
                dataLookUp: null, 
                cValidate :'required', 
                cName: 'columntypepict', 
                cLabel: 'Column Type', 
                cLabelSize: 4, 
                cOrder: 301, 
                cKey: false, 
                cType: 'text',
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope2_' + this.PageLevel + '_' + this.TabIndex,
                cStatic: true, 
                cOption: [
                    { label: 'Status', id: 'FCS' },
                    { label: 'Image', id: 'FCI' },
                    { label: 'Text', id: 'FCT' }],
                cMasterUrl: '' ,
                cDisplayColumn: '' 
            }, 
            PI_columnnamepict: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSSAllColumn'    , 
                    ColumnDB: 'column_name'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''
                    }, 
                cValidate :'required', 
                cName: 'columnnamepict', 
                cLabel: 'Column Name', 
                cLabelSize: 4, 
                cOrder: 302, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope2_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cDisplayColumn: 'column_name' ,
            }, 
              PI_columncolourpict: { 
                dataLookUp: null, 
                cValidate :'', 
                cName: 'columncolourpict', 
                cLabel: 'Colour', 
                cLabelSize: 4, 
                cOrder: 303, 
                cKey: false, 
                cType: 'text',
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope2_' + this.PageLevel + '_' + this.TabIndex,
                cStatic: true, 
                cOption: [
                    { label: 'Black', id: '555555' },
                    { label: 'Red', id: 'F50404' },
                    { label: 'Green', id: '2C9D05' },
                    { label: 'Blue', id: '0680FF' },
                    { label: 'Orange', id: 'F99500' }],
                cMasterUrl: '' ,
                cDisplayColumn: '' 
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
            this.M_SS_SettingsList.columntype = data.id
            this.M_SS_SettingsList.columntypeLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                if(data.id == 'FCS'){
                    this.PI_label.cProtect = true
                    this.PI_columnsize.cProtect = true
                    this.PI_isfieldbold.cProtect = true
                    this.PI_columncolour.cProtect = false

                }
                else if(data.id == 'FCI'){
                    this.PI_label.cProtect = true
                    this.PI_columnsize.cProtect = true
                    this.PI_isfieldbold.cProtect = true
                    this.PI_columncolour.cProtect = true
                }
                else if(data.id == 'FCT'){
                    this.PI_label.cProtect = true
                    this.PI_columnsize.cProtect = true
                    this.PI_isfieldbold.cProtect = true
                    this.PI_columncolour.cProtect = true
                }
                else if(data.id == 'CB'){
                    this.PI_label.cProtect = false
                    this.PI_columnsize.cProtect = false
                    this.PI_isfieldbold.cProtect = false
                    this.PI_columncolour.cProtect = false
                }
            }
        })
        this.$forceUpdate()
        },
        OncolumnnameChange(data) {
            this.M_SS_SettingsList.columnname = data.label
            this.M_SS_SettingsList.columnnameLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
            }
        })
        this.$forceUpdate()
        },
        OnlabelChange(data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
            }
        })
        this.$forceUpdate()
        },
        OncolumnsizeChange(data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                
            }
        })
        this.$forceUpdate()
        },
        OnisfieldboldChange(data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
            }
        })
        this.$forceUpdate()
        },
        OncolumncolourChange(data) {
            this.M_SS_SettingsList.columncolour = data.id
            this.M_SS_SettingsList.columncolourLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
            }
        })
        this.$forceUpdate()
        },
        OncolumntypepictChange(data) {
            this.M_SS_SettingsListPict.columntypepict = data.id
            this.M_SS_SettingsListPict.columntypepictLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                if(data.id == 'FCS'){
                    this.PI_columncolourpict.cProtect = false
                    this.PI_columncolourpict.cValidate = 'required'
                    this.$refs.ref_columncolourpict.isRequired = true
                }
                else if(data.id == 'FCI'){
                    this.PI_columncolourpict.cProtect = true
                    this.PI_columncolourpict.cValidate = ''
                    this.$refs.ref_columncolourpict.isRequired = false
                }
                else if(data.id == 'FCT'){
                    this.PI_columncolourpict.cProtect = true
                    this.PI_columncolourpict.cValidate = ''
                    this.$refs.ref_columncolourpict.isRequired = false
                }
            }
        })
        this.$forceUpdate()
        },
        OncolumnnamepictChange(data) {
            this.M_SS_SettingsListPict.columnnamepict = data.label
            this.M_SS_SettingsListPict.columnnamepictLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
            }
        })
        this.$forceUpdate()
        },
        OncolumncolourpictChange(data) {
            this.M_SS_SettingsListPict.columncolourpict = data.id
            this.M_SS_SettingsListPict.columncolourpictLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
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
            if (this.FormStatus == 'new') {
                this.listDisabled = false 
                this.FormStatus = 'view'
            }
            this.listDisabled = false 
            this.FormStatus = 'view'
            
        },
        M_CancelPict(){
            if (this.FormStatus2 == 'new') {
                this.listDisabled = false 
                this.M_SS_SettingsList.columntypepict = ''
                this.M_SS_SettingsList.columncolourpict = ''
                this.M_SS_SettingsList.columnnamepict = ''
            }
            this.listDisabled = false 
            this.FormStatus2 == 'new'
        },
        doDoubleClick(){
        },
        rowClicked (record, index) {
        },
        rowLink: function(url){
        },
        paramFromParent(){
            let data = this.$store.getters.GetPage1Data

            // console.log(data);
            this.M_SS_SettingsList.headerid = data.header_id
            this.PI_columnname.dataLookUp.InitialWhere = "table_name='"+data.view_name+"'"
            this.PI_columnnamepict.dataLookUp.InitialWhere = "table_name='"+data.view_name+"'"
            
            this.getDataFrmParameter()
        },	
        M_Post(){
        },
        M_Refresh(){
            this.getDataFrmParameter()
        },
        M_Save(){
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
        M_SavePict(){
            var scopeForm = "FormScope2_" + this.PageLevel + "_" + this.TabIndex
            this.$validator._base.validateAll(scopeForm).then((result) => {
                if (!result) return
                this.alertConfirmation("Are You Sure Want To Save This Data ?")
                .then(ress => {
                    if (ress.value) {
                        this.M_NgeSave2()
                    }
                })
            })
        },
        M_NgeSave(){
            // console.log(this.M_SS_SettingsList.columnsize);
            if(this.M_SS_SettingsList.columnsize == 'S'){
                this.M_SS_SettingsList.columnsize ='11'
            }
            else{
                this.M_SS_SettingsList.columnsize = '14'
            }
            
            // if (this.editStatus){
               if(this.addStatus == true){
                   var param = {
                    OptionSeq: this.getOptionSeq().OptionSeq ,
                    LineNo: 4 ,
                    header_id: this.DataRowPage1.header_id,
                    position: this.M_SS_SettingsList.position, 
                    row_no: this.M_SS_SettingsList.rowno, 
                    column_type: this.M_SS_SettingsList.columntype, 
                    column_name: this.M_SS_SettingsList.columnname, 
                    column_colour: this.M_SS_SettingsList.columncolour, 
                    column_size: this.M_SS_SettingsList.columnsize, 
                    icon_url: this.M_SS_SettingsList.iconurl, 
                    is_field_bold: this.M_SS_SettingsList.isfieldbold,
                    label: this.M_SS_SettingsList.label,
                    user_input: this.getDataUser().user_id,
                }

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
                        this.FormStatus = 'view'
                        // this.formParameter1Selected jadi null semua (1,2,0)
                        this.listDisabled = false
                        this.formParameter1Selected = null
                        this.formParameter2Selected = null
                        this.getDataFrmParameter()

                    })
                })
                }
                else if(this.addStatus == false){
                        var param = {
                        OptionSeq: this.getOptionSeq().OptionSeq ,
                        LineNo: 4 ,
                        detail_list_id: this.M_SS_SettingsList.detaillistid,
                        header_id: this.M_SS_SettingsList.headerid,
                        position: this.M_SS_SettingsList.position,
                        row_no: this.M_SS_SettingsList.rowno,
                        column_type: this.M_SS_SettingsList.columntype,
                        column_name: this.M_SS_SettingsList.columnname,
                        column_colour: this.M_SS_SettingsList.columncolour,
                        column_size: this.M_SS_SettingsList.columnsize,
                        icon_url: this.M_SS_SettingsList.iconurl,
                        lastupdatestamp: this.M_SS_SettingsList.lastupdatestamp,
                        is_field_bold: this.M_SS_SettingsList.isfieldbold,
                        label: this.M_SS_SettingsList.label,
                        user_edit: this.getDataUser().user_id
                    }

                    this.postJSON(this.getUrlUpdate(), param)
                    .then((response) => {
                        //handling Update
                        if(response == null) {
                            return
                        }
                        this.alertSuccess(response.Message)
                        .then(() => {
                            this.FormStatus = 'view'
                            this.listDisabled = false
                            this.formParameter1Selected = null
                            this.formParameter2Selected = null
                            this.getDataFrmParameter()
                        })
                    })
                }
            // }

            
        },
        M_NgeSave2(){
               if(this.addStatus2 == true){
                   var param = {
                    OptionSeq: this.getOptionSeq().OptionSeq ,
                    LineNo: 4 ,
                    header_id: this.DataRowPage1.header_id,
                    position: '1', 
                    row_no: '1', 
                    column_type: this.M_SS_SettingsListPict.columntypepict, 
                    column_name: this.M_SS_SettingsListPict.columnnamepict, 
                    column_colour: this.M_SS_SettingsListPict.columncolourpict, 
                    column_size: 0, 
                    icon_url: '', 
                    is_field_bold: 'False',
                    label: '',
                    user_input: this.getDataUser().user_id,
                }

                this.postJSON(this.getUrlInsert(), param)
                .then((response) => {
                    //handling Insert
                    if(response == null) {
                        return
                    }
                    this.alertSuccess(response.Message)
                    .then(() => {
                        this.FormType = 'view'
                        this.addStatus2 = false

                        this.listDisabled = false
                        this.formParameter1Selected = null
                        this.formParameter2Selected = null
                        this.getDataFrmParameter()

                    })
                })
                }
                else if(this.addStatus2 == false){
                        var param = {
                        OptionSeq: this.getOptionSeq().OptionSeq ,
                        LineNo: 4 ,
                        detail_list_id: this.M_SS_SettingsListPict.detaillistid,
                        header_id: this.M_SS_SettingsListPict.headerid,
                        position: '1', 
                        row_no: '1', 
                        column_type: this.M_SS_SettingsListPict.columntypepict,
                        column_name: this.M_SS_SettingsListPict.columnnamepict,
                        column_colour: this.M_SS_SettingsListPict.columncolourpict,
                        column_size: 0,
                        icon_url: '', 
                        lastupdatestamp: this.M_SS_SettingsListPict.lastupdatestamp,
                        is_field_bold: 'False',
                        label: '',
                        user_edit: this.getDataUser().user_id
                    }

                    this.postJSON(this.getUrlUpdate(), param)
                    .then((response) => {
                        if(response == null) {
                            return
                        }
                        this.alertSuccess(response.Message)
                        .then(() => {
                            this.FormStatus = 'view'
                            this.addStatus2 = false
                            this.listDisabled = false
                            this.formParameter1Selected = null
                            this.formParameter2Selected = null
                            this.getDataFrmParameter()
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
            this.M_SS_SettingsList = {
                detaillistid: 0,
                headerid: 0,
                position: '',
                rowno: '',
                pict: 'CB',
                colpictumnname: '',
                columncpictolour: '555555',
                columnsize: 'S',
                iconurl: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                label: '',
                isfieldbold: 'False',
                lastupdatestamp: 0
            }
        },
        M_New(){
            let data = this.$store.getters.GetPage1Data

            this.M_SS_SettingsList.headerid = data.header_id
            this.$refs.ref_columnname.focus()
        },
        M_Edit(){
            let data = this.$store.getters.GetPage1Data

            this.M_SS_SettingsList.headerid = data.header_id
            this.$refs.ref_columnname.focus()
        },
        M_Delete(){
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: 4,
                ss_table_mbl_detail_list_id: this.M_SS_SettingsList.detaillistid,
                lastupdatestamp: this.M_SS_SettingsList.lastupdatestamp,
            }
            
            this.postJSON( this.getUrlDelete(), param )
            .then(response => {
                if (response == null) return

                this.alertSuccess("Deleting Data Successfully")
                .then(() => {
                    this.formParameter1 = []
                    this.formParameter2 = []
                    this.formParameter1Selected = null
                    this.formParameter2Selected = null
                    
                    this.getDataFrmParameter()
                    this.$store.commit('setStatus', 'VIEW')
                    this.FormStatus = 'view'
                })
            })
        },
        beforeGetDataBy (record) {
            if (record.position.toString() == "1") {
                this.formParameter0Selected = null
                this.formParameter2Selected = null
            }
            else if (record.position == "2") {
                this.formParameter1Selected = null
                this.formParameter0Selected = null
            }
            this.getDataBy(record)
        },
        getDataBy (record) {
            this.tempParam = record
            
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: 4,	
                ss_table_mbl_detail_list_id: record.detaillistid,
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                // console.log(data);

                if(data.column_type == 'CB'){
                    this.M_SS_SettingsList = {
                    detaillistid: data.detail_list_id,
                    headerid: data.header_id,
                    position: data.position,
                    rowno: data.row_no,
                    columntype: data.column_type,
                    columnname: data.column_name,
                    columncolour: data.column_colour,
                    columnsize: data.column_size,
                    iconurl: data.icon_url,
                    label: data.label,
                    isfieldbold: data.is_field_bold,
                    userinput: data.user_input,
                    useredit: data.user_edit,
                    timeinput: data.time_input,
                    timeedit: data.time_edit,
                    rowid: data.row_id,
                    lastupdatestamp: data.lastupdatestamp,
                    }
                }
                else{
                    this.M_SS_SettingsListPict = {
                    columntypepict: data.column_type,
                    columnnamepict: data.column_name,
                    columncolourpict: data.column_colour
                    }
                    
                }
                
                if(data.column_type == 'FCS'){
                    this.PI_columncolourpict.cProtect = false
                    this.PI_columncolourpict.cValidate = 'required'
                    this.$refs.ref_columncolourpict.isRequired = true
                }
                else if(data.column_type == 'FCI'){
                    this.PI_columncolourpict.cProtect = true
                    this.PI_columncolourpict.cValidate = ''
                    this.$refs.ref_columncolourpict.isRequired = false
                }
                else if(data.column_type == 'FCT'){
                    this.PI_columncolourpict.cProtect = true
                    this.PI_columncolourpict.cValidate = ''
                    this.$refs.ref_columncolourpict.isRequired = false
                }

                if(data.column_size == 11){
                    this.M_SS_SettingsList.columnsize = 'S'
                }
                else if(data.column_size == 14){
                    this.M_SS_SettingsList.columnsize = 'L'
                }

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit        

                this.M_SS_SettingsList.columnnameLabel = this.M_SS_SettingsList.columnname != null ? data.column_name :''

                this.FormStatus = 'new'
                this.editStatus = true
                this.addStatus = false
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
                var idxNow = DATAS.map(x => x.value).indexOf(DATAS_SELECT.value)
                if (idxNow < 1) return

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

                        row_no: rn,
                        detail_list_id: DATAS[x].value
                    })
                }

                var param = {
                    OptionSeq: this.getOptionSeq().OptionSeq ,
                    LineNo: 5 ,
                    Data: dataPost
                }
                
                this.postJSON(this.getUrlUpdateMulti(), param)
                .then(ress => {
                    if (ress == null) return
                    this.getDataFrmParameter()
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
                        row_no: rn,
                        detail_list_id: DATAS[x].value
                        })
                    }

                var param = {
                    OptionSeq: this.getOptionSeq().OptionSeq ,
                    LineNo: 5,
                    Data: dataPost
                }
                
                this.postJSON(this.getUrlUpdateMulti(), param)
                .then(ress => {
                    if (ress == null) return
                    this.getDataFrmParameter()
                    this.getDataBy(this.tempParam)
                })
            } 
        },
        openformParameter1(){
            var canadd = this.FormType == 'VIEW' ? false : true
            if (canadd == true) {
                this.FormStatus = 'new'
                this.addStatus = true
                this.editStatus = false
                this.M_SS_SettingsList.position = "1"
                this.M_SS_SettingsList.columntype = 'CB'
                this.M_SS_SettingsList.columnname = ''
                this.M_SS_SettingsList.columnnameLabel = ''
                this.M_SS_SettingsList.columncolour = '555555'
                this.M_SS_SettingsList.rowno = ''
                this.M_SS_SettingsList.label = ''
                this.formParameter1Selected = null
                this.formParameter2Selected = null
            }
            else {
                this.FormStatus = 'view'
                this.addStatus = false
                this.editStatus = false
                this.M_SS_SettingsList.position = "1"
            }
            return canadd

        },
        openformParameter2(){
            var canadd = this.FormType == 'VIEW' ? false : true
            if (canadd == true) {
                this.FormStatus = 'new'
                this.addStatus = true
                this.editStatus = false
                this.M_SS_SettingsList.position = "2"
                this.M_SS_SettingsList.columntype = 'CB'
                this.M_SS_SettingsList.columnname = ''
                this.M_SS_SettingsList.columnnameLabel = ''
                this.M_SS_SettingsList.columncolour = '555555'
                this.M_SS_SettingsList.rowno = ''
                this.M_SS_SettingsList.label = ''
                this.formParameter1Selected = null
                this.formParameter2Selected = null
            }
            else {
                this.FormStatus = 'view'
                this.addStatus = false
                this.editStatus = false
                this.M_SS_SettingsList.position = "2"
            }
            return canadd
            

        },
        getDataFrmParameter(){
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: 5,
                header_id: this.DataRowPage1.header_id
            }
            this.postJSON( this.getUrlById(), param )
            .then( response => {
                if(response == null) return
                var data = response.Data 
                this.formParameter1 = []
                this.formParameter2 = []

                var isNonCBExist = data.filter(x => {
                    return x.column_type !== 'CB'
                })

                if (isNonCBExist.length >= 1) {
                    this.addStatus2 = false
                }
                else {
                    this.addStatus2 = true
                }

                if(data.length > 0){
                        data.forEach((dt, idx) => {
                           if(dt.column_type && dt.column_type == 'CB'){
                                if (dt.position.toString() == '1') {
                                    this.formParameter1.push({
                                        value: dt.detail_list_id,
                                        key: dt.column_name, 
                                        headerid: dt.header_id,
                                        detaillistid: dt.detail_list_id,
                                        position: dt.position,
                                        rowno: dt.row_no
                                    })
                                }
                                else if (dt.position.toString() == '2') {
                                    this.formParameter2.push({
                                        value: dt.detail_list_id,
                                        key: dt.column_name, 
                                        headerid: dt.header_id,
                                        detaillistid: dt.detail_list_id,
                                        position: dt.position,
                                        rowno: dt.row_no
                                    })
                                }
                            }
                            else if(dt.column_type && dt.column_type != 'CB'){
                                this.M_SS_SettingsListPict.columntypepict = dt.column_type,
                                this.M_SS_SettingsListPict.columnnamepict = dt.column_name,
                                this.M_SS_SettingsListPict.columnnamepictLabel = dt.column_name,
                                this.M_SS_SettingsListPict.columncolourpict = dt.column_colour
                                this.M_SS_SettingsListPict.detaillistid = dt.detail_list_id,
                                this.M_SS_SettingsListPict.headerid = dt.header_id,
                                this.M_SS_SettingsListPict.lastupdatestamp = dt.lastupdatestamp
                            
                            }
                        })
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