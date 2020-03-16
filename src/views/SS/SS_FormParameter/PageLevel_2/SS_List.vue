<template>
    <div>
        <b-row style="padding-top:10px; padding-right: 10px; padding-left: 20px; padding-bottom: 10px; !important; height: 1050px !important;">
            <b-col sm="4">
                <ABSButton @click="openformParameter1" icon="plus" text="Add" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton @click="M_Delete" icon="trash" text="Delete" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <ABSButton @click="moveUpDown('U','1')" icon="arrow-up" text="Up" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton @click="moveUpDown('D','1')" icon="arrow-down" text="Down" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <div>Column List</div>
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
            <b-col sm="8" id="col-left" class="bColMasterForm">
                <ABSButton @click="M_Save" icon="save" text="Save" classButton="btnList__btnPrimary" classIcon="icon-style-1"/>
                <ABSButton @click="M_Cancel" icon="ban" text="Cancel" classButton="btnList__btnPrimary" classIcon="icon-style-2"/>
                <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                    <b-row style="padding-left:20px; padding-top:10px;">					
                        <b-col md="12" id="col-left"> <!-- table open -->
                            <b-row>
                                <b-col md="4">
                                    <ABSInputSelectList @change="OncolumnnameChange" :prop="PI_columnname" :value="M_SS_SettingsList.columnname" :label="M_SS_SettingsList.columnnameLabel"  ref="ref_columnname "/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="4">
                                    <ABSInputSelect2 @change="OncolumntypeChange" :prop="PI_columntype" :value="M_SS_SettingsList.columntype" :label="M_SS_SettingsList.columntypeLabel"  ref="ref_columntype "/>
                                </b-col>
                            </b-row>
                             <b-row>
                                <b-col md="4">
                                    <ABSinputTextVuex @input="OnlabelChange" :prop="PI_label" v-model="M_SS_SettingsList.label"  ref="ref_label"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="4">
                                    <ABSinputRadioButtonVuex @input="OncolumnsizeChange" :prop="PI_columnsize" v-model="M_SS_SettingsList.columnsize"  ref="ref_columnsize"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="4">
                                    <ABSinputRadioButtonVuex @input="OnisfieldboldChange" :prop="PI_isfieldbold" v-model="M_SS_SettingsList.isfieldbold" ref="ref_isfieldbold"/>
                                </b-col>
                            </b-row>
                            <b-row>
                                <b-col md="4">
                                    <ABSInputSelect2 @change="OncolumncolourChange" :prop="PI_columncolour" :value="M_SS_SettingsList.columncolour" :label="M_SS_SettingsList.columncolourLabel" ref="ref_columncolour"/>
                                </b-col>
                            </b-row>
                        </b-col> <!-- table close -->
                    </b-row>
                </b-form>
            </b-col>
            <b-col sm="4" style="position: relative !important; top: -50px !important;">
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
export default {
    props: {PageLevel: '', TabIndex: '', data: ''}, 
    data() {
        return {
            listDisabled: false,
            tempParam: {},
            Module: "SS",
            FormType: "View",
            formParameter1Selected: null,
            formParameter0Selected: null,
            formParameter1: [],
            formParameter0: [],
            widthModal :'80%',
            paragraphs: [true],
            timer: null,

            dataModal:[],
            IEBy: {Input: '', Edit: ''},
            M_SS_SettingsList :{
                detaillistid: 0,
                headerid: 0,
                position: '',
                rowno: '',
                columntype: '',
                columnname: '',
                columncolour: '',
                columnsize: '',
                iconurl: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                label: '',
                isfieldbold: '',
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
                cOrder: 201, 
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
            PI_columntype: { 
                dataLookUp: null, 
                cValidate :'required', 
                cName: 'columntype', 
                cLabel: 'Column Type', 
                cLabelSize: 4, 
                cOrder: 202, 
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
                    { label: 'Status', id: 'FCS' },
                    { label: 'Image', id: 'FCI' },
                    { label: 'Text', id: 'FCT' },
                    { label: 'Data', id: 'CB' }],
                cMasterUrl: '' ,
                cDisplayColumn: '' 
            }, 
            PI_label: { 
                cValidate :'', 
                cName: 'label', 
                cLabel: 'Label', 
                cLabelSize: 4, 
                cOrder: 203, 
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
                cLabel: 'Font Size', 
                cId: 'rdbcolumnsize', 
                cRadioOptions: [{ text: 'Small', value: '11' }, { text: 'Large', value: '14' }], 
                cLabelSize: 4, 
                cOrder: 204, 
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
                cOrder: 205, 
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
                cOrder: 206, 
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
        OncolumnnameChange(data) {
            // console.log(data)
            this.M_SS_SettingsList.columnname = data.label
            this.M_SS_SettingsList.columnnameLabel = data.label
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
            }
        })
        this.$forceUpdate()
        },
        OncolumntypeChange(data) {
            // console.log(data)
            this.M_SS_SettingsList.columntype = data.label
            this.M_SS_SettingsList.columntypeLabel = data.label
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
            // console.log(data)
            this.M_SS_SettingsList.columncolour = data.label
            this.M_SS_SettingsList.columncolourLabel = data.label
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
        paramFromParent(){
            let data = this.$store.getters.GetPage1Data
            this.M_SS_SettingsList.headerid = data.header_id
            this.PI_columnname.dataLookUp.InitialWhere = "table_name='"+data.table_name+"'"
            
            this.getDataFrmParameter()
            this.M_ClearForm()
        },	
        M_Post(){
        },
        M_Refresh(){
            this.getDataFrmParameter()
        },
        M_NgeSave(){
            if (this.inputStatus == 'NEW') {
                var param = {
                    OptionSeq: this.getOptionSeq().OptionSeq ,
                    LineNo: 4 ,
                    header_id: this.DataRowPage1.header_id,
                    user_edit: this.getDataUser().user_id,
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
                        this.$store.commit('setStatus', 'VIEW')
                        // this.formParameter1Selected jadi null semua (1,2,0)
                        this.listDisabled = false
                        this.formParameter1Selected = null
                        this.formParameter0Selected = null
                        this.getDataFrmParameter()

                    })
                })
            }
            else if (this.inputStatus == 'EDIT') {
                var param = {
                    OptionSeq: this.getOptionSeq().OptionSeq ,
                    LineNo: 4 ,
                    detail_list_id: this.M_SS_SettingsList.detaillistid,
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
                        // this.formParameter1 = [] 
                        
                        this.$store.commit('setStatus', 'VIEW')
                        this.listDisabled = false
                        this.formParameter1Selected = null
                        this.formParameter0Selected = null
                        this.getDataFrmParameter()
                    })
                })
            }
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
                columntype: '',
                columnname: '',
                columncolour: '',
                columnsize: '',
                iconurl: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                label: '',
                isfieldbold: '',
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
                detail_list_id: this.M_SS_SettingsList.detaillistid,
            }
            
            this.postJSON( this.getUrlDelete(), param )
            .then(response => {
                if (response == null) return

                this.alertSuccess("Deleting Data Successfully")
                .then(() => {
                    this.formParameter1 = []
                    this.formParameter0 = []
                    this.formParameter1Selected = null
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
                detail_list_id: this.M_SS_SettingsList.detaillistid,
            }
            
            this.postJSON( this.getUrlDelete(), param )
            .then(response => {
                if (response == null) return

                this.alertSuccess("Deleting Data Successfully")
                .then(() => {
                    this.formParameter1 = []
                    this.formParameter0 = []
                    this.formParameter1Selected = null
                    this.formParameter0Selected = null
                    
                    this.getDataFrmParameter()
                    this.M_ClearForm()
                    this.$store.commit('setStatus', 'VIEW')
                })
            })
        },
        beforeGetDataBy (record) {
            if (record.position.toString() == "1") {
                this.formParameter0Selected = null
                this.formParameter2Selected = null
            }
            this.getDataBy(record)
        },
        getDataBy (record) {
            this.tempParam = record
            
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: 2,	
                detail_list_id: record.detaillistid,
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                // console.log(data)
                

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
                    userinput: data.user_input,
                    useredit: data.user_edit,
                    timeinput: data.time_input,
                    timeedit: data.time_edit,
                    rowid: data.row_id,
                    lastupdatestamp: data.lastupdatestamp,
                }
               

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit        

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

            if (direction == 'U') {
                // console.log(DATAS)
                var idxNow = DATAS.map(x => x.value).indexOf(DATAS_SELECT.value)
                if (idxNow < 1) return
                // console.log(idxNow)

                var rownoNow, rownoUp
                // console.log(DATAS[idxNow]);
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
                    // console.log(DATAS[x]);
                    dataPost.push({

                        row_no: rn,
                        detail_list_id: DATAS[x].value
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
                        detail_list_id: DATAS[x].value
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
                    this.getDataBy(this.tempParam)
                })
            } 
        },
        openformParameter1(){
            // this.FormType = 'FORM'
            this.$store.commit('setStatus', 'NEW')
            this.M_ClearForm()
            this.M_SS_SettingsList.position = "1"
            this.listDisabled = true

        },
        openformParameter0(){
            // this.FormType = 'FORM'
            this.$store.commit('setStatus', 'NEW')
            this.M_ClearForm()
            this.M_SS_SettingsList.position = "0"
            this.listDisabled = true

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
                                if (dt.position.toString() == '1' || dt.position.toString() == '2') {
                                    this.formParameter1.push({
                                        value: dt.detail_list_id,
                                        key: dt.column_name, 
                                        headerid: dt.header_id,
                                        detaillistid: dt.detail_list_id,
                                        position: dt.position,
                                        rowno: dt.row_no
                                    })
                                }
                                else {
                                    this.formParameter0.push({
                                        value: dt.detail_list_id,
                                        key: dt.column_name, 
                                        headerid: dt.header_id,
                                        detaillistid: dt.detail_list_id,
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