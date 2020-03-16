<template>
    <div class="height--full">
        <HeaderFormListVuex2 :isProcess = "true" />

        <div class="content-app-form__body" style="background-color: white;padding-top: 1px !important;margin-left: 15px;margin-right: 15px;height: 95%;overflow-y: auto;overflow-x: hidden;padding-bottom: 80px;">
            <div :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
                <b-collapse id="collapse1" :visible="true">
                    <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">
                        <b-col md="12" id="col-left" class="bColMasterForm">	
                            <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                                <b-row style="padding-left:10px;">
                                    <b-col md="12" id="col-left"> <!-- table open -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnfromcontactcdChange" :prop="PI_fromcontactcd" :value="M_CM_ExportLawanTransaksiToEFaktur.fromcontactcd" :label="M_CM_ExportLawanTransaksiToEFaktur.fromcontactcdLabel" ref="ref_fromcontactcd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OntocontactcdChange" :prop="PI_tocontactcd" :value="M_CM_ExportLawanTransaksiToEFaktur.tocontactcd" :label="M_CM_ExportLawanTransaksiToEFaktur.tocontactcdLabel" ref="ref_tocontactcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_fromcontactname" v-model="M_CM_ExportLawanTransaksiToEFaktur.fromcontactname"  ref="ref_fromcontactname" />                                        
                                      </b-col>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_tocontactname" v-model="M_CM_ExportLawanTransaksiToEFaktur.tocontactname"  ref="ref_tocontactname" />
                                      </b-col>
                                    </b-row>                                    
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OndelimiterChange" :prop="PI_delimiter" v-model="M_CM_ExportLawanTransaksiToEFaktur.delimiter"  ref="ref_delimiter" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6" style="padding-left:25px !important">
                                        <b-button style="font-size: 10px;padding-top: 3px;padding-bottom: 3px;" @click="goPreview"><font-awesome-icon icon="list" class="icon-style-1"/> Preview</b-button>
                                        <b-button style="font-size: 10px;padding-top: 3px;padding-bottom: 3px;" @click="goDownload"><font-awesome-icon icon="list" class="icon-style-1"/> Download</b-button>
                                      </b-col>
                                    </b-row>
                                </b-col> <!-- table close -->
                                
                                </b-row>
                            </b-form>
                            
                        </b-col>
                    </b-row>
                </b-collapse>
            </div>

            <ABSListVuex
                :prop = "propList"
                :title = "'InvoiceEfaktur'"
                :isProcess = "false"
                @rowClicked = "rowClicked"
                @rowDblClicked = "doDoubleClick"
                @rowLinkClick = "rowLink"
                @pageSize = "M_PageSize"
                @pagination = "M_Pagination"
                @filter = "M_Advance_Filter"
                @headTable = "M_Head_Table"
            />

           

        </div>
    </div>
</template>

<script>
// import MyModal from'./BG_viewModal.vue'
export default {
    data() {
        return {
            propList: {
                initialWhere: "SubPortfoliCd='"+this.getDataUser().subportfolio_cd+"'",
                LineNo: 0,
                PageLevel: 1,
                TabIndex: 1,
                OrderBy: "ContactId asc"
                // ParamView: "'1','2019','001'"
            },
            paragraphs: [true],
            timer: null,
        widthModal :'80%',
        dataModalHeader:[],
        dataModalDetail:[],
		    FormType: "Process",
       
            IEBy: {Input: '', Edit: ''},

            M_CM_ExportLawanTransaksiToEFaktur :{
                fromcontactcd: '',
                tocontactcd: '',
                fromcontactname: '',
                tocontactname:'',                
                delimiter: ','
                    },
            PI_fromcontactcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMContact'    , 
                    ColumnDB: 'ContactId'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  ,
                    OrderBy:'ContactId asc'
                        }, 
                cValidate :'', 
                cName: 'fromcontactcd', 
                cLabel: ' Contact ID From', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 1, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: '' ,
                cDisplayColumn: 'ContactId,Name' ,
            }, 
            PI_tocontactcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMContact'    , 
                    ColumnDB: 'ContactId'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  ,
                    OrderBy:'ContactId asc'
                        }, 
                cValidate :'', 
                cName: 'tocontactcd', 
                cLabel: 'To', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 2, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: '' ,
                cDisplayColumn: 'ContactId,Name' ,
            }, 
            PI_fromcontactname: { 
                cValidate :'', 
                cName: 'fromcontactname', 
                cLabel: 'Contact Name From', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            }, 
            PI_tocontactname: { 
                cValidate :'', 
                cName: 'tocontactname', 
                cLabel: 'to', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            },            
            PI_delimiter: { 
                cValidate :'', 
                cName: 'delimiter', 
                cId: 'rdbdelimiter', 
                cRadioOptions: [{ text: ', (comma)', value: ',' },{ text: '; (semicolon)', value: ';' }], 
                cRadioDefaultOption: '', 
                cLabel:'Delimiter', 
                cLabelSize: 4, 
                cOrder: 5, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            },
            btnText: 'Generate',
            TrxTypeFrom: null,
            TrxTypeTo: null
        }
    },
	computed : {
        inputStatus() {
            if(this.$store.getters.getLevel == 1 && this.$store.getters.getTab == 1){
                return this.$store.getters.getStatus.toUpperCase()
            }
            else {
                return 'VIEW'
            }
        },
        PageLevel () {
            return 1
        },
        TabIndex () {
            return 1
        },
  },
  methods: {     
      OnfromcontactcdChange (data) {
        this.$nextTick(() => {
            this.M_CM_ExportLawanTransaksiToEFaktur.fromcontactcd = data.id
            this.M_CM_ExportLawanTransaksiToEFaktur.fromcontactcdLabel = data.label

            this.M_CM_ExportLawanTransaksiToEFaktur.tocontactcd = data.id
            this.M_CM_ExportLawanTransaksiToEFaktur.tocontactcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{fromcontactcd}
            }
        })
        this.$forceUpdate()
        },
        OntocontactcdChange (data) {
        this.$nextTick(() => {
            this.M_CM_ExportLawanTransaksiToEFaktur.tocontactcd = data.id
            this.M_CM_ExportLawanTransaksiToEFaktur.tocontactcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{tocontactcd}
            }
        })
        this.$forceUpdate()
        },        
        OndelimiterChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{delimiter}
            }
        })
        this.$forceUpdate()
        },
    setToolbarButton (){
        // this.getToolbar().isNew = true
        //     this.getToolbar().statusFunction[0].disabled = true
        //     // this.getToolbar().statusFunction[5].disabled = false
        //    this.getToolbar().statusFunction[7].disabled = true
        //    //this.getToolbar().statusFunction[4].disabled = false

    },
    M_Search(data){
            this.toList().doGetList(data,'eb_getList')
        },
        toList() {
            return this.$children[2]
        },
        rowClicked (record, index) {
            this.getModal(record)
          // alert('aaaa')          
          this.M_BG_ViewBudgetUsage.BudgetCd = record.BudgetCd
          this.M_BG_ViewBudgetUsage.Descs = record.Descs

          this.PI_budgetcd.cValue = record.BudgetCd
          this.PI_budgetcddescs.cValue = record.Descs
        },
        doDoubleClick () {
        
        },
        rowLink (url) {},
        M_PageSize () {},
        M_Pagination () {},
        M_Advance_Filter () {},
        M_Head_Table () {},
        goGenerate() {
            // this.getModal()
        this.propList.ParamView = "'"+this.M_BG_ViewBudgetUsage.Month + "','" + this.M_BG_ViewBudgetUsage.Year + "','"+this.getDataUser().subportfolio_cd+"'"

        this.toList().doGetList('','eb_getList')
        },
        goDownload(){
            var Filter  = "SubPortfoliCd = '"+this.getDataUser().subportfolio_cd+"'" + this.GetFilter()
            // Filter = this.replaceAllString(Filter," ","%20")
            var url = this.getFileEFakturLawanTrans(this.getOptionSeq().OptionSeq, this.M_CM_ExportLawanTransaksiToEFaktur.delimiter,Filter)
            window.location.href = url
            this.$refs.modalExport.hide()

        },
        goPreview(){
            // alert(this.GetFilter())
            this.propList.initialWhere = "SubPortfoliCd = '"+this.getDataUser().subportfolio_cd+"'"+this.GetFilter()
            this.toList().doGetList('','eb_getList')
        },
        GetFilter(){
            var filterString =''
            if(this.M_CM_ExportLawanTransaksiToEFaktur.fromcontactcd !=''){
                if(this.M_CM_ExportLawanTransaksiToEFaktur.tocontactcd !=''){
                    filterString += " AND ( ContactId Between '"+this.M_CM_ExportLawanTransaksiToEFaktur.fromcontactcd+"' AND '"+this.M_CM_ExportLawanTransaksiToEFaktur.tocontactcd+"' ) "
                }else{
                    filterString += " AND ContactId = '"+this.M_CM_ExportLawanTransaksiToEFaktur.fromcontactcd+"' "
                }
            }

            if(this.M_CM_ExportLawanTransaksiToEFaktur.fromcontactname !=''){
                if(this.M_CM_ExportLawanTransaksiToEFaktur.tocontactname !=''){
                    filterString += " AND ( Name Between '"+this.M_CM_ExportLawanTransaksiToEFaktur.fromcontactname+"' AND '"+this.M_CM_ExportLawanTransaksiToEFaktur.tocontactname+"' ) "
                }else{
                    filterString += " AND Name = '"+this.M_CM_ExportLawanTransaksiToEFaktur.fromcontactname+"' "
                }
            }           

            return filterString
        }
    },
    beforeCreate: function () {
    },
    created: function() {
        this.$store.commit('setFormType','Edit')
        this.$store.commit('setStatus', 'new')
        
    },
    beforeMount: function() {
    },
    mounted: function() {      
        this.$store.commit('setLevel', 1)
       this.$store.commit('setTab', 1)  
       this.$store.commit('setListDisable', false)
       this.hideSideBarMenu()
    //     this.getToolbar().doEdit(true)
    //     this.$store.commit('setFormType','Form')

    //     this.getToolbar().FormStatus = 'NEW'
    //     this.hideSideBarMenu()
    //     this.toList().doGetList('','eb_getList')

    // this.getToolbar().doEdit(true)
    //     this.$store.commit('setFormType','Form')

    //     this.getToolbar().FormStatus = 'NEW'

    //     this.getToolbar().ProcessPS()
    //     this.hideSideBarMenu()

        

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

<style scoped>
    table {
    border-collapse: collapse;
    }

    table, td, th {
    border: 1px solid black;
    }
      .size-modal-content {
            padding: 10px;
            font-style: 13px;
        }
        .v--modal-overlay[data-modal="size-modal"] {
            background: rgba(0, 0, 0, 0.5);
        }
        .demo-modal-class {
            border-radius: 5px;
            background: #F7F7F7;
            box-shadow: 5px 5px 30px 0px rgba(46,61,73, 0.6);
        }
</style>


