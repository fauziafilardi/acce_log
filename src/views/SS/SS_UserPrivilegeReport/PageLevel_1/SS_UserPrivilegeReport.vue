<template>
    <div class="height--full">
        <!-- <HeaderFormListVuex2 :isProcess = "true" />         -->
        <div class="content-app-form-report__body form-report" style="margin-top:10px !important;height:99%;">
            <!-- <div> -->
            <div class="tab-form-process">
            <div :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
                <div @click="height1" class="div-collapse" v-b-toggle.collapse1>
                    <span class="master-span">
                        <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                    </span>
                </div>
                
                    <b-collapse id="collapse1" :visible="collapseVisible">
                        <b-row  style="padding-left: 10px;">     
                            <b-col md="12" id="col-left" class="bColMasterForm">	
                                <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                                    <b-row style="padding-left:10px;">					
                                        <b-col md="12" id="col-left"> <!-- table open -->
                                            <b-row>
                                                <b-col  md="6">
                                                    <ABSInputSelectList @change="OnuserChange" :prop="PI_user" :value="M_SS_UserPrivilegeReport.user" :label="M_SS_UserPrivilegeReport.userLabel" ref="ref_user"/>
                                                </b-col>
                                            </b-row>                                        
                                            <b-row style="padding-top:10px;">
                                                <b-col offset="6">
                                                    <b-button style="font-size: 10px;padding-top: 3px;padding-bottom: 3px;" @click="doGenerate"><font-awesome-icon icon="list" class="icon-style-1"/> Generate Report</b-button>
                                                </b-col>
                                            </b-row>                                        
                                        </b-col> <!-- table close -->
                                    </b-row>                                
                                </b-form>
                                <div>
                                    <hr style="margin-top:15px;">
                                </div>
                            </b-col>
                        </b-row>
                    </b-collapse>
                             
            </div>
            <div>
                <b-row class="header-toolbar" style="margin-left:20px !important;">
                    <b-col lg="12" md="12" sm="12">
                        <ABSButton
                            text="Print"
                            icon="print"
                            classButton="button button--new"
                            classIcon="icon-style-1"
                            @click="doPrint"
                            :disabled="disabled"
                        />

                        <ABSButton
                            text="Excel"
                            icon="file-excel"
                            classButton="button button--save"
                            classIcon="icon-style-1"
                            @click="doExcel"
                            :disabled="disabled"
                        />

                        <ABSButton
                            text="PDF"
                            icon="file-pdf"
                            classButton="button button--delete"
                            classIcon="icon-style-1"
                            @click="doDelete"
                            :disabled="disabled"
                        />

                        <!-- <b-button :disabled="disabled" class="button button--new" @click="doPrint"><font-awesome-icon icon="print" class="icon-style-1"/> Print</b-button>
                        <b-button :disabled="disabled" class="button button--new" @click="doExcel"><font-awesome-icon icon="file-excel" class="icon-style-1"/> Exel</b-button>
                        <b-button :disabled="disabled" class="button button--new" @click="doPDF"><font-awesome-icon icon="file-pdf" class="icon-style-1"/> PDF</b-button> -->
                    </b-col>
                </b-row>
            </div>
            <hr style="margin-top: 8px;">
            <div :v-show="false"  :style="styleReport">
                <div id="DivPrint">
                    <b-row>
                        <b-col md="12" style="text-align:center;">
                        <h3>User Privilege Report</h3> 
                        </b-col>                    
                    </b-row>
                    <b-row>                    
                        <label style="margin-left:20px;" for="usernamelabel">Username : {{userlabel}} </label>
                    </b-row>
                    <b-row>                    
                        <label style="margin-left:20px;" for="usernamelabel">User ID : {{useridlabel}} </label>
                    </b-row>
                    <b-row>
                        <b-col md="12">
                            <!-- <table style="width:96%;margin-left:20px;margin-right:20px; border: 1px solid;"> -->
                            <table id="UserPriviledge" class="display nowrap" style="width:96%;margin-left:20px;margin-right:20px;">
                                <thead>
                                    <!-- <tr>
                                        <th colspan="3" class="th-custom-header"><h3>User Privilege Report</h3></th>
                                    </tr>
                                    <tr>
                                        <th colspan="3" class="th-custom">
                                            Username : {{userlabel}}
                                        </th>
                                    </tr>
                                    <tr>
                                        <th colspan="3" class="th-custom">
                                            User ID : {{useridlabel}}
                                        </th>
                                    </tr> -->
                                    <tr>
                                        <th>Module</th>
                                        <th>Event</th>
                                        <th>Option</th>
                                    </tr>
                                </thead>
                                <!-- <tbody v-for="(useraccess,index) in UserAccess" :key="index"> -->
                                <!-- <tbody>
                                    <tr  v-for="(useraccess,index) in UserAccess" :key="index">
                                        <td>{{useraccess.module}}</td>
                                        <td>{{useraccess.event}}</td>
                                        <td>{{useraccess.menu_name}}</td>
                                    </tr>
                                </tbody> -->
                            </table>
                        </b-col>                    
                    </b-row>  
                </div>                              
            </div>
            </div>
        </div>
        <ABSLoader />
    </div>
</template>

<script>

export default {
    data() {
        return {
            cInsertKey:'',
            FormType: "Process",
            Module:"SS",
            UserAccess:[],
            ForDataTable:[],
            hideTable: false,
            collapseVisible: true,
            IEBy: {Input: '', Edit: ''},
            userlabel: '',   			
            useridlabel: '',
            disabled: true,
            dataTable: null, 
            heightStatus: true,
            styleReport:'padding-bottom:20px;overflow-y:auto;height:355px;',
            // styleReport: '',

            M_SS_UserPrivilegeReport :{
                user: '',
                username:''
            },
            PI_user: { 
                dataLookUp: { 
                    LookUpCd: 'GetUser'    , 
                    ColumnDB: 'user_id'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'user', 
                cLabel: 'User', 
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
                cDisplayColumn: 'user_id,user_name' ,
            },
            PI_username: { 
                cValidate :'max:6|max_value:100', 
                cName: 'username', 
                cLabel: '1', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
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
	DataRow(){
		return this.$store.getters.GetPage1Data
	}
  },
    methods: {
        height1(){            

            if(this.heightStatus == true){
                this.styleReport = 'padding-bottom:20px;overflow-y:auto;height:450px;'
                this.heightStatus = false
                this.collapseVisible = false
            }else{
                this.styleReport = 'padding-bottom:20px;overflow-y:auto;height:355px;'
                this.heightStatus = true
                this.collapseVisible = true
            }

            console.log(this.heightStatus)

        },
        doPrint() {
            $('#DivPrint').printThis({
                // debug: true,               // show the iframe for debugging
                // importCSS: true,           // import parent page css
                // importStyle: true,          // import style tags
                // printContainer: true,       // print outer container/$.selector
                // loadCSS: "../../../../../public/printthis/print.css",                // path to additional css file - use an array [] for multiple
                // pageTitle: "",              // add title to print page
                // removeInline: false,        // remove inline styles from print elements
                // removeInlineSelector: "*",  // custom selectors to filter inline styles. removeInline must be true
                // printDelay: 333,            // variable print delay
                // header: null,               // prefix to html
                // footer: null,               // postfix to html
                // base: false,                // preserve the BASE tag or accept a string for the URL
                // formValues: true,           // preserve input/form values
                // canvas: false,              // copy canvas content
                // doctypeString: '...',       // enter a different doctype for older markup
                // removeScripts: false,       // remove script tags from print content
                // copyTagClasses: false,      // copy classes from the html & body tag
                // beforePrintEvent: null,     // function for printEvent in iframe
                // beforePrint: null,          // function called before iframe is filled
                // afterPrint: null            // function called before iframe is removed

            });
        },
        doExcel(){
            alert('Will recoverd soon')
        },
        doPDF(){
            alert('Will recoverd soon')
        },
        doGenerate() {
            this.$store.commit('setStatusLoader', true)
            
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                user_id: this.getDataUser().user_id,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                LineNo: '0',                
                InitialWhere: "",
                ParamView:"'"+ this.getDataUser().subportfolio_cd +"','"+this.M_SS_UserPrivilegeReport.user+"'",        
                SortField: ''
            }
             this.postJSON( this.getUrlDataList(), param )
                  .then( response => {
                      if(response.Data.length > 0){
                        this.userlabel = response.Data[0].user_name
                        this.useridlabel = response.Data[0].user_id
                      }else{
                            this.userlabel = ''
                            this.useridlabel = ''
                      }
                      console.log(response.Data.length)
                    if(response == null) return
                        // this.UserAccess = response.Data
                        this.hideTable = true                        
                        this.disabled = false

                        // this.getJSON(this.getUrlAuthDecrypt() + this.getDataUser().user_id)
                        // .then((response) => {
                        //     this.userlabel = this.getDataUser().user_name
                        //     this.useridlabel = response.Data                                      
                        // })

                        // this.userlabel = response.Data[0].user_name
                        // this.useridlabel = response.Data[0].user_id

                        // this.dataTable.rows().clear().draw()
                        this.dataTable.rows().clear().draw()
                        
                        response.Data.forEach((value)=>{
                            // this.ForDataTable.push([value.module,value.event,value.menu_name])
                            this.dataTable.row.add( [
                                value.module,
                                value.event,
                                value.menu_name
                            ]).draw(false)
                        })
                        
                        // console.log(this.ForDataTable)
                        // this.dataTable.draw();
                        // this.dataTable.row.add(response.Data).draw(false)
                        // var table = $('#UserPriviledge').DataTable();
 
                        // table.fixedHeader.adjust();
                        // console.log(this.heightStatus)
                        // console.log(this.collapseVisible)
                        if(this.heightStatus == true){
                            // console.log('masuk')
                            this.styleReport = 'padding-bottom:20px;overflow-y:auto;height:450px;'
                            this.heightStatus = false
                            this.collapseVisible = false
                        }else{
                            this.styleReport = 'padding-bottom:20px;overflow-y:auto;height:355px;'
                            this.heightStatus = true
                            this.collapseVisible = true
                        }
                        this.$store.commit('setStatusLoader', false)
                  })            
        },
        toList() {
            // return this.$children[2].$children[0].$children[0]
            // return this.$refs.ref_abslist
        },
        OnuserChange (data) {
            this.$nextTick(() => {
                this.M_SS_UserPrivilegeReport.user = data.id
                this.M_SS_UserPrivilegeReport.userLabel = data.label
                
                if (this.inputStatus != "VIEW") {
    
                }
            })
            this.$forceUpdate()
        },

        DataTable () {
            this.dataTable = $('#UserPriviledge').DataTable({
                paging: false,
                info: false,
                searching: false,
                // fixedHeader: true,
                responsive: true,
                // "scrollY": 315,
                // "scrollX": true
            });

            new $.fn.dataTable.FixedHeader( this.dataTable, {
                alwaysCloneTop: true
            });

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
            // this.toList().doGetList(data,'eb_getList')
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
        },
        M_Update() {
        },
		M_ClearForm(){
		},
        M_New(){
        },
        M_Edit(){
        },
        M_Delete(dt){ 
        },        
        getDataBy (record) {
        }

    },
    beforeCreate: function () {
    },
    created: function() {
        this.$store.commit('setFormType','View')
        this.$store.commit('setStatus', 'new')
    },
    beforeMount: function() {
    },
    mounted: function() {
        this.DataTable()

        // this.dataTable = $('#UserPriviledge').DataTable({
        //     paging: false,
        //     info: false,
        //     searching: false,
        //     fixedHeader: true,
        //     responsive: true
        // });

        // this.dataTable.row.add(this.ForDataTable).draw(false)
        // this.dataTable = $('#UserPriviledge').DataTable();
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
    /* table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
        padding: 5px;
    } */
    /* table {
        border:solid #000 !important;
        border-width:1px 0 0 1px !important;
        width:96%;
        margin-left:20px;
        margin-right:20px;
    }
    th, td {
        border:solid #000 !important;
        border-width:0 1px 1px 0 !important;
        padding: 5px;
    } */
    div.container { max-width: 200px }
    /* th {
    border-top: 1px solid #dddddd;
    border-bottom: 1px solid #dddddd;
    border-right: 1px solid #dddddd;
    }
    
    th:first-child {
    border-left: 1px solid #dddddd;
    } */

    /* .th-custom-header {
        padding: 0px 18px !important;
        border-bottom: 0px solid #1110 !important;
        text-align:center;
    }

    .th-custom {
        padding: 0px 18px !important;
        border-bottom: 0px solid #1110 !important;
    } */
</style>

