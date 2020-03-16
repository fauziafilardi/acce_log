<template>
    <div>
        <div :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
            <div class="div-collapse" v-b-toggle.collapse1>
                <span class="master-span" v-show="IEBy.Input && IEBy.Edit">
                    Input By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}} <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                </span>
            </div>
            <b-collapse id="collapse1" :visible="true">
                <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">              
                    <b-col md="12" id="col-left" class="bColMasterForm">
                        <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                            <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">              
                                <b-col md="6" id="col-left" class="bColMasterForm">                        
                                        <ABSinputTextVuex :prop="PI_PortfolioCd" v-model="M_CM_Portfolio.PortfolioCd"/>
                                        <ABSinputTextVuex :prop="PI_Name" v-model="M_CM_Portfolio.Name"/>
                                        <ABSinputTextVuex :prop="PI_ReferenceNo" v-model="M_CM_Portfolio.ReferenceNo"/>
                                        <ABSinputTextVuex :prop="PI_Address1" v-model="M_CM_Portfolio.Address1"/>
                                        <ABSinputTextVuex :prop="PI_Address2" v-model="M_CM_Portfolio.Address2"/>
                                        <ABSinputTextVuex :prop="PI_Address3" v-model="M_CM_Portfolio.Address3"/>
                                        <ABSinputTextVuex :prop="PI_Address4" v-model="M_CM_Portfolio.Address4"/>  
                                        <ABSinputTextVuex :prop="PI_ZipCode" v-model="M_CM_Portfolio.ZipCode"/>
                                        <ABSInputSelectList @change="OnCityCdChange" :prop="PI_CityCd" :value="M_CM_Portfolio.CityCd"/>
                                        <ABSinputTextVuex :prop="PI_Website" v-model="M_CM_Portfolio.Website"/>
                                        <ABSinputTextVuex :prop="PI_PhoneNo" v-model="M_CM_Portfolio.PhoneNo"/>
                                        <ABSinputTextVuex :prop="PI_FaxNo" v-model="M_CM_Portfolio.FaxNo"/>
                                        <ABSinputTextVuex :prop="PI_SIRPrefix" v-model="M_CM_Portfolio.SIRPrefix"/>
                                        <ABSinputRadioButtonVuex :prop="PI_CBUniquePaymentNo" v-model="M_CM_Portfolio.CBUniquePaymentNo"/>
                                        <ABSinputRadioButtonVuex :prop="PI_BaseOnTaxHandling" v-model="M_CM_Portfolio.BaseOnTaxHandling"/>                            
                                        <ABSinputTextArea :prop="PI_Remarks" v-model="M_CM_Portfolio.Remarks"/>
                                </b-col>
                            </b-row>               
                            <div class="div-collapse__extend">
                                Picture
                            </div>
                            <b-row style="padding-left: 10px; padding-bottom: 10px; !important;">
                                <b-col md="6">
                                    <ABSFileUpload :prop="PI_PictureFileName"
                                                @fileName="getFileName"
                                                v-model="M_CM_Portfolio.ReferenceFileName"
                                                :file="M_CM_Portfolio.PictureFileName"
                                                :image="M_CM_Portfolio.ReferenceFileName"/>
                                </b-col>                                
                            </b-row>
                            <div class="div-collapse__extend">
                                Database Connection
                            </div>
                            <b-row style="padding-left: 10px; padding-bottom: 10px; !important;">
                                <b-col md="6" id="col-left" class="bColMasterForm">
                                    <ABSinputTextVuex :prop="PI_DBConnection" v-model="M_CM_Portfolio.DBConnection"/>
                                </b-col>
                            </b-row>
                            <div class="div-collapse__extend">
                                Password Security
                            </div>
                            <b-row style="padding-left: 10px; padding-bottom: 10px; !important;">
                                <b-col md="6" id="col-left" class="bColMasterForm">
                                        <ABSinputTextVuex :prop="PI_MinPasswordLength" v-model="M_CM_Portfolio.MinPasswordLength"/>
                                        <ABSinputTextVuex :prop="PI_MaxPasswordLive" v-model="M_CM_Portfolio.MaxPasswordLive"/>
                                        <ABSinputRadioButton :prop="PI_PasswordStrength" v-model="M_CM_Portfolio.PasswordStrength"/>
                                        <ABSinputTextVuex :prop="PI_MaxLoginFailedAttempt" v-model="M_CM_Portfolio.MaxLoginFailedAttempt"/>                        
                                </b-col>                
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
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
            FormType: "Form",
            Module:"CM",
            M_CM_Portfolio: {
                PortfolioCd: '',
                Name: '',
                ReferenceNo: '',
                Address1: '',
                Address2: '',
                Address3: '',
                Address4: '',
                ZipCode: '',
                Website: '',
                PhoneNo: '',
                FaxNo: '',
                SIRPrefix: '',
                CBUniquePaymentNo: '',
                BaseOnTaxHandling: '',
                Remarks: '',
                PictureFileName: '',
                MinPasswordLength: '',
                MaxPasswordLive: '',
                PasswordStrength: '',
                MaxLoginFailedAttempt: '',
                ReferenceFileName: ''
            },
            IEBy: {Input: '', Edit: ''},
            
            PI_PortfolioCd: {
                cValidate: 'min:2|max:4',
                cName: 'PortfolioCd',
                cLabel: 'Portfolio Code',
                // cLabelSize: 5,
                cOrder: 1,
                cKey: true,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_Name: {
                cValidate: 'min:1|max:60',
                cName: 'Name',
                cLabel: 'Name',
                //cLabelSize: 5,
                cOrder: 2,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_ReferenceNo: {
                cValidate: 'min:1|max:60',
                cName: 'ReferenceNo',
                cLabel: 'Reference No',
                //cLabelSize: 5,
                cOrder: 3,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_Address1: {
                cValidate: 'required|min:1|max:60',
                cName: 'Address1',
                cLabel: 'Address',
                //cLabelSize: 5,
                cOrder: 4,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_Address2: {
                cValidate: 'min:1|max:60',
                cName: 'Address2',
                cLabel: '',
                //cLabelSize: 5,
                cOrder: 5,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_Address3: {
                cValidate: 'min:1|max:60',
                cName: 'Address3',
                cLabel: '',
                //cLabelSize: 5,
                cOrder: 6,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_Address4: {
                cValidate: 'min:1|max:60',
                cName: 'Address4',
                cLabel: '',
                //cLabelSize: 5,
                cOrder: 7,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_ZipCode: {
                cValidate: 'min:1|max:60',
                cName: 'ZipCode',
                cLabel: 'Zip Code',
                //cLabelSize: 5,
                cOrder: 8,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_CityCd: { 
                dataLookUp: { 
                    LookUpCd: 'GetCityCd'    , 
                    ColumnDB: 'CityCd', 
                    InitialWhere: "", 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName:'CityCd', 
                cLabel:'City Code', 
                cKey:false, 
                cOrder:9, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cMasterUrl:'CM/CM_SubPortfolioClass' ,
                cDisplayColumn:'CityCd,Descs',
            }, 
            PI_Website: {
                cValidate: 'min:1|max:60',
                cName: 'Website',
                cLabel: 'Website',
                //cLabelSize: 5,
                cOrder: 10,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_PhoneNo: {
                cValidate: 'min:1|max:60',
                cName: 'PhoneNo',
                cLabel: 'Telephone',
                //cLabelSize: 5,
                cOrder: 11,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_FaxNo: {
                cValidate: 'min:1|max:60',
                cName: 'FaxNo',
                cLabel: 'Fax',
                //cLabelSize: 5,
                cOrder: 12,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_SIRPrefix: {
                cValidate: 'min:1|max:60',
                cName: 'SIRPrefix',
                cLabel: 'SIR Prefix',
                //cLabelSize: 5,
                cOrder: 13,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_CBUniquePaymentNo: {
                cId: 'rdCBUniquePaymentNo',
                cName: 'CBUniquePaymentNo',
                cRadioOptions: [
                            { text: 'Yes', value: 'Y' },
                            { text: 'No', value: 'N' }
                        ],
                cLabel: 'Cash Book Unique Payment No',
                //cLabelSize: 5,
                cOrder: 14,
                cRadioDefaultOption: '',
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_BaseOnTaxHandling: {
                cId: 'rdBaseOnTaxHandling',
                cName: 'BaseOnTaxHandling',
                cRadioOptions: [
                            { text: 'Portofolio', value: 'P' },
                            { text: 'Subportofolio', value: 'S' }
                        ],
                cLabel: 'Tax Batch No Base On',
                //cLabelSize: 5,
                cOrder: 15,
                cRadioDefaultOption: '',
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },            
            PI_Remarks: {
                cValidate: 'min:1|max:100',
                cName: 'Remarks',
                cNameError: 'Remarks cannot be empty',
                cValue: '',
                cResize: false,
                cPlaceholder: '',
                cRows: 10,
                cMaxRows: 12,
            },
            PI_PictureFileName: {
                // cValidate: 'min:1|max:60',
                cName: 'PictureFileName',
                cLabel: 'Picture File',
                cPlaceholder: 'Choose a file...',
                //cLabelSize: 5,
                // cOrder: 17,
                cTabIndex: this.TabIndex,
                cPageLevel: this.PageLevel,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                // cModule: this.Module
                cModule: "SS"
            },
            PI_DBConnection: {
                cValidate: '',
                cName: 'DBConnection',
                cLabel: 'DB Connection String (encrypted) ',
                //cLabelSize: 5,
                cOrder: 18,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cProtect: true
            },
            PI_MinPasswordLength: {
                cValidate: 'min:1|max:60',
                cName: 'MinPasswordLength',
                cLabel: 'Minimum Password Length',
                //cLabelSize: 5,
                cOrder: 19,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },            
            PI_MaxPasswordLive: {
                cValidate: 'min:1|max:60',
                cName: 'MaxPasswordLive',
                cLabel: 'Maximum Password Live',
                //cLabelSize: 5,
                cOrder: 20,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_PasswordStrength: {
                cId: 'rdPasswordStrength',
                cName: 'PasswordStrength',
                cRadioOptions: [
                            { text: 'No Control', value: 'Y' },
                            { text: 'Combination Alpha Numeric', value: 'N' }
                        ],
                cLabel: 'Password Strength',
                //cLabelSize: 5,
                cOrder: 14,
                cRadioDefaultOption: '',
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_MaxLoginFailedAttempt: {
                cValidate: 'min:1|max:60',
                cName: 'MaxLoginFailedAttempt',
                cLabel: 'Max Login Failed Attempt',
                //cLabelSize: 5,
                cOrder: 22,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_ReferenceFileName: { 
                cLabel:'Picture File', 
                cValue:'', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
            },
            PTAnalysis: {
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cPageMasterSeq: this.data.PageMasterSeq,
                cFormPageNo: this.data.PageOrder
            }
        }
    },
    methods: {
        getFileName(fileName) {
            this.M_CM_Portfolio.PictureFileName = fileName
        },
        OnCityCdChange (data) {
            this.$nextTick(() => {
                this.M_CM_Portfolio.CityCd = data.id
                this.M_CM_Portfolio.CityCdLabel = data.label
                //{SubPortfolioClassCd}
            })
            this.$forceUpdate()
        },
        setToolbarButton () {
           //this.getToolbar().statusFunction[4].disabled = false
		},
        M_PageSize(){

        },
        M_TabClick(){

        },
        M_Pagination(){

        },
        M_Advance_Filter(){

        },
        M_Post(){

        },
        M_Refresh(){

        },
        M_New(){
            this.$nextTick().then(() => document.getElementById("PortfolioCd").focus())
        },
        M_Edit(){
            this.$nextTick().then(() => document.getElementById("Name").focus())
        },
        M_ClearForm () {
            this.M_CM_Portfolio = {
                PortfolioCd: '',
                Name: '',
                ReferenceNo: '',
                Address1: '',
                Address2: '',
                Address3: '',
                Address4: '',
                ZipCode: '',
                Website: '',
                PhoneNo: '',
                FaxNo: '',
                SIRPrefix: '',
                CBUniquePaymentNo: '',
                BaseOnTaxHandling: '',
                Remarks: '',
                PictureFileName: '',
                MinPasswordLength: '',
                MaxPasswordLive: '',
                PasswordStrength: '',
                MaxLoginFailedAttempt: '',
                ReferenceFileName: ''
            }
        },
        M_Delete(dt){
            var data = this.FormToABSList().getRowSelected()
            var dataDelete = []

            data.forEach((value) => {
                dataDelete.push({
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
        M_Insert () {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                UserInput: this.getDataUser().user_id,
                PortfolioCd: this.M_CM_Portfolio.PortfolioCd,
                Name: this.M_CM_Portfolio.Name,
                ReferenceNo: this.M_CM_Portfolio.ReferenceNo,
                Address1: this.M_CM_Portfolio.Address1,
                Address2: this.M_CM_Portfolio.Address2,
                Address3: this.M_CM_Portfolio.Address3,
                Address4: this.M_CM_Portfolio.Address4,
                ZipCode: this.M_CM_Portfolio.ZipCode,
                Website: this.M_CM_Portfolio.Website,
                PhoneNo: this.M_CM_Portfolio.PhoneNo,
                FaxNo: this.M_CM_Portfolio.FaxNo,
                SIRPrefix: this.M_CM_Portfolio.SIRPrefix,
                CBUniquePaymentNo: this.M_CM_Portfolio.CBUniquePaymentNo,
                BaseOnTaxHandling: this.M_CM_Portfolio.BaseOnTaxHandling,
                Remarks: this.M_CM_Portfolio.Remarks,
                PictureFileName: this.M_CM_Portfolio.PictureFileName,
                MinPasswordLength: this.M_CM_Portfolio.MinPasswordLength,
                MaxPasswordLive: this.M_CM_Portfolio.MaxPasswordLive,
                PasswordStrength: this.M_CM_Portfolio.PasswordStrength,
                MaxLoginFailedAttempt: this.M_CM_Portfolio.MaxLoginFailedAttempt,
                ReferenceFileName: this.M_CM_Portfolio.ReferenceFileName
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
                this.$parent.resultInsert(response.Message)                
            })
        },
        M_Update () {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                UserEdit: this.getDataUser().user_id,
                PortfolioCd: this.M_CM_Portfolio.PortfolioCd,
                Name: this.M_CM_Portfolio.Name,
                ReferenceNo: this.M_CM_Portfolio.ReferenceNo,
                Address1: this.M_CM_Portfolio.Address1,
                Address2: this.M_CM_Portfolio.Address2,
                Address3: this.M_CM_Portfolio.Address3,
                Address4: this.M_CM_Portfolio.Address4,
                ZipCode: this.M_CM_Portfolio.ZipCode,
                Website: this.M_CM_Portfolio.Website,
                PhoneNo: this.M_CM_Portfolio.PhoneNo,
                FaxNo: this.M_CM_Portfolio.FaxNo,
                SIRPrefix: this.M_CM_Portfolio.SIRPrefix,
                CBUniquePaymentNo: this.M_CM_Portfolio.CBUniquePaymentNo,
                BaseOnTaxHandling: this.M_CM_Portfolio.BaseOnTaxHandling,
                Remarks: this.M_CM_Portfolio.Remarks,
                PictureFileName: this.M_CM_Portfolio.PictureFileName,
                MinPasswordLength: this.M_CM_Portfolio.MinPasswordLength,
                MaxPasswordLive: this.M_CM_Portfolio.MaxPasswordLive,
                PasswordStrength: this.M_CM_Portfolio.PasswordStrength,
                MaxLoginFailedAttempt: this.M_CM_Portfolio.MaxLoginFailedAttempt,
                ReferenceFileName: this.M_CM_Portfolio.ReferenceFileName,
                CityCd: this.M_CM_Portfolio.CityCd,
                LastUpdateStamp: this.M_CM_Portfolio.LastUpdateStamp
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return
                this.$parent.resultUpdate(response.Message)                
            })
        },
        paramFromParent(){
        },
        rowLink: function(url){
        },
        getDataBy () {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
            }            

            this.postJSON( this.getUrlById(), param )
                .then( response => {

                if(response == null) return
                var data = response.Data
                // console.log(data)

                if(data.length > 0){
                    // this.$store.commit('setStatus', 'EDIT')
                    this.getToolbar().FormStatus = 'EDIT'
                    this.getToolbar().ProcessPS()
                    data = data[0]
                    this.$nextTick(() => {
                        this.M_CM_Portfolio.PortfolioCd = data.PortfolioCd
                        this.M_CM_Portfolio.Name = data.Name
                        this.M_CM_Portfolio.ReferenceNo = data.ReferenceNo
                        this.M_CM_Portfolio.Address1 = data.Address1
                        this.M_CM_Portfolio.Address2 = data.Address2
                        this.M_CM_Portfolio.Address3 = data.Address3
                        this.M_CM_Portfolio.Address4 = data.Address4
                        this.M_CM_Portfolio.ZipCode = data.ZipCode
                        this.M_CM_Portfolio.CityCd = data.CityCd
                        this.M_CM_Portfolio.Website = data.Website
                        this.M_CM_Portfolio.PhoneNo = data.PhoneNo
                        this.M_CM_Portfolio.FaxNo = data.FaxNo
                        this.M_CM_Portfolio.SIRPrefix = data.SIRPrefix
                        this.M_CM_Portfolio.CBUniquePaymentNo = data.CBUniquePaymentNo
                        this.M_CM_Portfolio.BaseOnTaxHandling = data.BaseOnTaxHandling
                        this.M_CM_Portfolio.Remarks = data.Remarks
                        this.M_CM_Portfolio.PictureFileName = data.PictureFileName
                        this.M_CM_Portfolio.ReferenceFileName= data.ReferenceFileName
                        this.M_CM_Portfolio.MinPasswordLength = data.MinPasswordLength
                        this.M_CM_Portfolio.MaxPasswordLive = data.MaxPasswordLive
                        this.M_CM_Portfolio.PasswordStrength = data.PasswordStrength
                        this.M_CM_Portfolio.MaxLoginFailedAttempt = data.MaxPasswordLive
                        this.M_CM_Portfolio.LastUpdateStamp = data.LastUpdateStamp                                              

                        // EventBus.$emit('ebSetValue' + this.PI_CityCd.cName + '_' + this.PageLevel + '_' + this.TabIndex, {data: data.CityCd, action: 'getByID'})
                       
                    })
                    
                    this.IEBy.Input = data.userinput
                    this.IEBy.Edit = data.useredit
                }
                else {
                    // this.$store.commit('setStatus', 'NEW')
                    this.getToolbar().FormStatus = 'NEW'
                    this.getToolbar().ProcessPS()
                }
            })
        },
        getDBConnection(){
            this.postEncode( this.getUrlDBConnection())
                .then( response => {
                    if(response == null) return
                    var data = response.Data
                    this.M_CM_Portfolio.DBConnection = data.DBConnection
                })
        }
    },
    beforeCreate: function () {
    },
    created: function() {
        this.$store.commit('setFormType','Form')
        // this.isDetail = true
    },
    beforeMount: function() {
    },
    mounted: function() {
        // alert('alert')
        this.getDBConnection()
        this.getDataBy()
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