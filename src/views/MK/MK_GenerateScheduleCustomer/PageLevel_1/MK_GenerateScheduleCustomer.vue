<template>
    <div class="height--full">
        <HeaderFormListVuex2 :isProcess = "true" />        
        <div class="content-app-form__body form-process">
            <div class="tab-form-process">
            <div :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
                <b-collapse id="collapse1" :visible="true">
                    <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">     
                        <b-col md="12" id="col-left" class="bColMasterForm">	
                            <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                                <b-row style="padding-left:10px;">					
                                    <b-col md="12" id="col-left"> <!-- table open -->
                                        <!-- <b-row>
                                            <b-col  md="6">
                                                <ABSInputSelectList @change="OnfromrevtrxtypeChange" :prop="PI_fromrevtrxtype" :value="M_MK_Generate_ScheduleCustomer.fromrevtrxtype" :label="M_MK_Generate_ScheduleCustomer.fromrevtrxtypeLabel" ref="ref_fromrevtrxtype"/>
                                            </b-col>
                                            <b-col md="6">
                                                <ABSInputSelectList @change="OntorevtrxtypeChange" :prop="PI_torevtrxtype" :value="M_MK_Generate_ScheduleCustomer.torevtrxtype" :label="M_MK_Generate_ScheduleCustomer.torevtrxtypeLabel" ref="ref_torevtrxtype"/>
                                            </b-col>
                                        </b-row> -->
                                        <b-row>
                                            <b-col  md="6">
                                                <ABSinputTextVuex @input="OnmonthChange" :prop="PI_month" v-model="M_MK_Generate_ScheduleCustomer.month"  ref="ref_month" />
                                            </b-col>
                                            <b-col md="6">
                                                <ABSinputTextVuex @input="OnyearChange" :prop="PI_year" v-model="M_MK_Generate_ScheduleCustomer.year"  ref="ref_year" />
                                            </b-col>
                                        </b-row>
                                        <!-- <b-row>
                                            <b-col  md="6">
                                                <ABSinputRadioButtonVuex @input="OnstatusChange" :prop="PI_status" v-model="M_MK_Generate_ScheduleCustomer.status"  ref="ref_status" />
                                            </b-col>
                                        </b-row> -->
                                        <!-- <ABSTAnalysisFromTo :prop="PTAnalysis" v-model="M_GL_AccountInquiryTAnalysis" /> -->
                                        <b-row style="padding-top:10px;">
                                            <b-col offset="6">
                                                <b-button style="font-size: 10px;padding-top: 3px;padding-bottom: 3px;" @click="doGenerate"><font-awesome-icon icon="list" class="icon-style-1"/> Generate Inquiry</b-button>
                                            </b-col>
                                        </b-row>

                                        <b-row style="padding-top:10px;">
                                            <b-col offset="6">
                                                <b-button style="font-size: 10px;padding-top: 3px;padding-bottom: 3px;" @click="doPrint"><font-awesome-icon icon="list" class="icon-style-1"/> Print</b-button>
                                            </b-col>
                                        </b-row>
                                    </b-col> <!-- table close -->
                                </b-row>
                                <!-- <ABSTAnalysis :prop="PTAnalysis" /> -->
                            </b-form>
                            <div :style="'margin-top:25px;'">
                                <hr :style="'padding-top: 12px'">
                            </div>
                            <!-- <div id="DivPrint">
                                <h1>test print</h1>
                            </div> -->
                        </b-col>
                    </b-row>
                </b-collapse>
            </div>
            <b-row style="padding-left: 25px !important;">
                <b-col md="2" style="width:33% !important; padding-bottom:15px !important; padding-left: 0px !important; padding-right:0px !important;">
                    <div @click="TestClick" class="card" :style="truckStyle">
                        <img :src="require('@/assets/doubleEngkle.png')" alt="Avatar" style="width:100%">
                        <div class="container">
                            <b-progress :max="max" show-progress animated style="height:10px !important;margin-bottom:5px !important;">
                                <b-progress-bar :value="value" style="color:black !important;font-size:10px !important">
                                    {{value}} M3 
                                </b-progress-bar>
                            </b-progress>
                            <b-progress :max="max" show-progress animated style="height:10px !important;margin-bottom:5px !important;">
                                <b-progress-bar :value="value" style="color:black !important;font-size:10px !important">
                                    {{value}} KG 
                                </b-progress-bar>
                            </b-progress>   
                        </div>
                    </div>
                </b-col>
                <b-col md="2" style="width:33% !important; padding-bottom:15px !important; padding-left: 0px !important; padding-right:0px !important;">
                    <div @click="TestClick" class="card" :style="truckStyle">
                        <img :src="require('@/assets/doubleEngkle.png')" alt="Avatar" style="width:100%">
                        <div class="container">
                            <b-progress :max="max" show-progress animated style="height:10px !important;margin-bottom:5px !important;">
                                <b-progress-bar :value="value" style="color:black !important;font-size:10px !important">
                                    {{value}} M3 
                                </b-progress-bar>
                            </b-progress>
                            <b-progress :max="max" show-progress animated style="height:10px !important;margin-bottom:5px !important;">
                                <b-progress-bar :value="value" style="color:black !important;font-size:10px !important">
                                    {{value}} KG 
                                </b-progress-bar>
                            </b-progress>   
                        </div>
                    </div>
                </b-col>
                <b-col md="2" style="width:33% !important; padding-bottom:15px !important; padding-left: 0px !important; padding-right:0px !important;">
                    <div @click="TestClick" class="card" :style="truckStyle">
                        <img :src="require('@/assets/doubleEngkle.png')" alt="Avatar" style="width:100%">
                        <div class="container">
                            <b-progress :max="max" show-progress animated style="height:10px !important;margin-bottom:5px !important;">
                                <b-progress-bar :value="value" style="color:black !important;font-size:10px !important">
                                    {{value}} M3 
                                </b-progress-bar>
                            </b-progress>
                            <b-progress :max="max" show-progress animated style="height:10px !important;margin-bottom:5px !important;">
                                <b-progress-bar :value="value" style="color:black !important;font-size:10px !important">
                                    {{value}} KG 
                                </b-progress-bar>
                            </b-progress>   
                        </div>
                    </div>
                </b-col>
                <b-col md="2" style="width:33% !important; padding-bottom:15px !important; padding-left: 0px !important; padding-right:0px !important;">
                    <div @click="TestClick" class="card" :style="truckStyle">
                        <img :src="require('@/assets/doubleEngkle.png')" alt="Avatar" style="width:100%">
                        <div class="container">
                            <b-progress :max="max" show-progress animated style="height:10px !important;margin-bottom:5px !important;">
                                <b-progress-bar :value="value" style="color:black !important;font-size:10px !important">
                                    {{value}} M3 
                                </b-progress-bar>
                            </b-progress>
                            <b-progress :max="max" show-progress animated style="height:10px !important;margin-bottom:5px !important;">
                                <b-progress-bar :value="value" style="color:black !important;font-size:10px !important">
                                    {{value}} KG 
                                </b-progress-bar>
                            </b-progress>   
                        </div>
                    </div>
                </b-col>
                <b-col md="2" style="width:33% !important; padding-bottom:15px !important; padding-left: 0px !important; padding-right:0px !important;">
                    <div @click="TestClick" class="card" :style="truckStyle">
                        <img :src="require('@/assets/doubleEngkle.png')" alt="Avatar" style="width:100%">
                        <div class="container">
                            <b-progress :max="max" show-progress animated style="height:10px !important;margin-bottom:5px !important;">
                                <b-progress-bar :value="value" style="color:black !important;font-size:10px !important">
                                    {{value}} M3 
                                </b-progress-bar>
                            </b-progress>
                            <b-progress :max="max" show-progress animated style="height:10px !important;margin-bottom:5px !important;">
                                <b-progress-bar :value="value" style="color:black !important;font-size:10px !important">
                                    {{value}} KG 
                                </b-progress-bar>
                            </b-progress>   
                        </div>
                    </div>
                </b-col>
                <b-col md="2" style="width:33% !important; padding-bottom:15px !important; padding-left: 0px !important; padding-right:0px !important;">
                    <div @click="TestClick" class="card" :style="truckStyle">
                        <img :src="require('@/assets/doubleEngkle.png')" alt="Avatar" style="width:100%">
                        <div class="container">
                            <b-progress :max="max" show-progress animated style="height:10px !important;margin-bottom:5px !important;">
                                <b-progress-bar :value="value" style="color:black !important;font-size:10px !important">
                                    {{value}} M3 
                                </b-progress-bar>
                            </b-progress>
                            <b-progress :max="max" show-progress animated style="height:10px !important;margin-bottom:5px !important;">
                                <b-progress-bar :value="value" style="color:black !important;font-size:10px !important">
                                    {{value}} KG 
                                </b-progress-bar>
                            </b-progress>   
                        </div>
                    </div>
                </b-col>
                <!-- <b-col md="2" style="width:33% !important; padding-bottom:15px !important;">
                    <div @click="TestClick" class="card">
                        <img :src="require('@/assets/engkleBox.png')" alt="Avatar" style="width:100%">
                        <div class="container">
                            <p><b>John Doe</b> </p>
                            <p>Architect & Engineer</p> 
                        </div>
                    </div>
                </b-col>
                <b-col md="2" style="width:33% !important;">
                    <div @click="TestClick" class="card">
                        <img :src="require('@/assets/pickUp.png')" alt="Avatar" style="width:100%">
                        <div class="container">
                            <p><b>John Doe</b> </p>
                            <p>Architect & Engineer</p> 
                        </div>
                    </div>
                </b-col>
                <b-col md="2" style="width:33% !important;">
                    <div @click="TestClick" class="card">
                        <img :src="require('@/assets/boxKecil.png')" alt="Avatar" style="width:100%">
                        <div class="container">
                            <p><b>John Doe</b> </p>
                            <p>Architect & Engineer</p> 
                        </div>
                    </div>
                </b-col>
                <b-col md="2" style="width:33% !important;">
                    <div @click="TestClick" class="card">
                        <img :src="require('@/assets/doubleEngkle.png')" alt="Avatar" style="width:100%">
                        <div class="container">
                            <p><b>John Doe</b> </p>
                            <p>Architect & Engineer</p> 
                        </div>
                    </div>
                </b-col>
                <b-col md="2" style="width:33% !important;">
                    <div @click="TestClick" class="card">
                        <img :src="require('@/assets/doubleEngkle.png')" alt="Avatar" style="width:100%">
                        <div class="container">
                            <p><b>John Doe</b> </p>
                            <p>Architect & Engineer</p> 
                        </div>
                    </div>
                </b-col> -->
            </b-row>
            
            
            <!-- <div>
                <b-tabs content-class="mt-3">
                    <b-tab title="Inquiry Result" active>
                        <ABSListVuex
                            :prop = "propList"
                            :title = "'Schedule Customer'"
                            :isProcess = "false"
                            @rowClicked = "rowClicked"
                            @rowDblClicked = "doDoubleClick"
                            @rowLinkClick = "rowLink"
                            @pageSize = "M_PageSize"    
                            @pagination = "M_Pagination"
                            @filter = "M_Advance_Filter"
                            @ref= "ref_abslist"
                        />
                    </b-tab>                    
                </b-tabs>
            </div> -->
            
            
            </div>
        </div>
        
    </div>
</template>

<script>

export default {
    data() {
        return {
		cInsertKey:'',
		FormType: "Process",
        Module:"GL",
        truckStyle: '',
        clickStatus: false,
        value: 50,
        max: 100,
            propList: {
                initialWhere: "SubPortfolioCd = '" + this.getDataUser().subportfolio_cd + "' AND StatusCd = 'N'",
                LineNo: 0,
                PageLevel: 1,
                TabIndex: 1,
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_MK_Generate_ScheduleCustomer :{
                fromrevtrxtype: '',
                torevtrxtype: '',
                month: '',
                year: '',
                status: ''
                    }
            ,
            PI_fromrevtrxtype: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTransTypeMaster'    , 
                    ColumnDB: 'TrxType'   , 
                    InitialWhere: "ModuleCd = 'GL'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'fromrevtrxtype', 
                cLabel: 'From Revaluation TrxType ', 
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
                cDisplayColumn: 'TrxType,Descs' ,
            }, 
            PI_torevtrxtype: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTransTypeMaster',
                    ColumnDB: 'TrxType'   , 
                    InitialWhere: "ModuleCd = 'GL'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'torevtrxtype', 
                cLabel: 'To Revaluation Trx Type', 
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
                cDisplayColumn: 'TrxType,Descs' ,
            }, 
            PI_month: { 
                cValidate :'', 
                cName: 'month', 
                cLabel: 'Month', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            }, 
            PI_year: { 
                cValidate :'', 
                cName: 'year', 
                cLabel: 'Year', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1
            }, 
            PI_status: { 
                cValidate :'', 
                cName: 'status', 
                cId: 'rdbstatus',
                cRadioOptions: [{ text: 'New', value: 'N' },{ text: 'Posted', value: 'P' },{ text: 'All', value: 'All' },], 
                cRadioDefaultOption: '', 
                cLabel:'Status ', 
                cLabelSize: 4, 
                cOrder: 5, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            }, 

			// PTAnalysis: {
            //     cPageLevel: 1,
            //     cTabIndex: 1,
            //     cPageMasterSeq: this.data.PageMasterSeq,
            //     cFormPageNo: this.data.PageOrder
            // }
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
        TestClick (){
            alert(this.clickStatus)
            if(this.clickStatus == false){
                this.truckStyle = 'background-color:grey !important;'
                this.clickStatus = true
            }else{
                this.truckStyle = 'background-color:white !important;'
                this.clickStatus = false
            }
            
        },
        doPrint() {

            $('#DivPrint').printThis();
            
            // //start print
            // var mywindow = window.open('', 'PRINT', 'height=700,width=900');

            // // mywindow.document.write('<html><head><title>' + document.title  + '</title>');
            // // mywindow.document.write('</head><body >');
            // // mywindow.document.write('<h1>' + document.title  + '</h1>');
            // mywindow.document.write(document.getElementById('DivPrint').innerHTML);
            // // mywindow.document.write('</body></html>');

            // mywindow.document.close(); // necessary for IE >= 10
            // mywindow.focus(); // necessary for IE >= 10*/

            // mywindow.print();
            // // mywindow.close();

            // return true;
            // // end print


            // //Get the HTML of div
            // var divElements = document.getElementById('DivPrint').innerHTML;
            // //Get the HTML of whole page
            // var oldPage = document.body.innerHTML;

            // //Reset the page's HTML with div's HTML only
            // document.body.innerHTML = 
            //   "<html><head><title></title></head><body>" + 
            //   divElements + "</body>";

            // //Print Page
            // window.print();

            // //Restore orignal HTML
            // document.body.innerHTML = oldPage;
        },
        doGenerate() {
            this.propList.initialWhere = "SubPortfolioCd = '" + this.getDataUser().subportfolio_cd + "'"

            if (this.M_MK_Generate_ScheduleCustomer.fromrevtrxtype != '' && this.M_MK_Generate_ScheduleCustomer.torevtrxtype != '') {
                this.propList.initialWhere += " AND RevaluationTrxType BETWEEN '" + this.M_MK_Generate_ScheduleCustomer.fromrevtrxtype + "' AND '" + this.M_MK_Generate_ScheduleCustomer.torevtrxtype + "'" 
            }
            
            if (this.M_MK_Generate_ScheduleCustomer.month != '' && this.M_MK_Generate_ScheduleCustomer.year != '') {
                this.propList.initialWhere += " AND RevaluationDate BETWEEN '" + this.M_MK_Generate_ScheduleCustomer.month + "' AND '" + this.M_MK_Generate_ScheduleCustomer.year + "'" 
            }

            if (this.M_MK_Generate_ScheduleCustomer.status != 'All') {
                this.propList.initialWhere += " AND StatusCd = '" + this.M_MK_Generate_ScheduleCustomer.status + "'"
            }

            this.toList().doGetList('','eb_getList')
        },
        toList() {
            return this.$children[2].$children[0].$children[0]
            // return this.$refs.ref_abslist
        },
        OnfromrevtrxtypeChange (data) {
        this.$nextTick(() => {
            this.M_MK_Generate_ScheduleCustomer.fromrevtrxtype = data.id
            this.M_MK_Generate_ScheduleCustomer.fromrevtrxtypeLabel = data.label

            this.M_MK_Generate_ScheduleCustomer.torevtrxtype = data.id
            this.M_MK_Generate_ScheduleCustomer.torevtrxtypeLabel = data.label
            
            if (this.inputStatus != "VIEW") {
//{fromrevtrxtype}
            }
        })
        this.$forceUpdate()
        },
        OntorevtrxtypeChange (data) {
        this.$nextTick(() => {
            this.M_MK_Generate_ScheduleCustomer.torevtrxtype = data.id
            this.M_MK_Generate_ScheduleCustomer.torevtrxtypeLabel = data.label
            if (this.inputStatus != "VIEW") {
//{torevtrxtype}
            }
        })
        this.$forceUpdate()
        },
        OnmonthChange (data) {
        this.$nextTick(() => {
            // this.M_MK_Generate_ScheduleCustomer.year = data
            if (this.inputStatus != "VIEW") {
//{month}
            }
        })
        this.$forceUpdate()
        },
        OnyearChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{year}
            }
        })
        this.$forceUpdate()
        },
        OnstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{status}
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
            this.toList().doGetList(data,'eb_getList')
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
                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_MK_Generate_ScheduleCustomer = {
                fromrevtrxtype: '',
                torevtrxtype: '',
                month: '',
                year: '',
                status: ''
                    }
            		
		},
        M_New(){
			this.$refs.ref_fromrevtrxtype.focus()
        },
        M_Edit(){
            this.$refs.ref_fromrevtrxtype.focus()
        },
        M_Delete(dt){       

         //nothing
        },        
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order

            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
this.M_MK_Generate_ScheduleCustomer = {
                fromrevtrxtype: data.fromrevtrxtype,
                torevtrxtype: data.torevtrxtype,
                month: data.month,
                year: data.year,
                status: data.status
                    }
                 

                this.M_MK_Generate_ScheduleCustomer.fromrevtrxtypeLabel = this.M_MK_Generate_ScheduleCustomer.fromrevtrxtype != null ? data.fromrevtrxtype + this.separator  :'' 
                this.M_MK_Generate_ScheduleCustomer.torevtrxtypeLabel = this.M_MK_Generate_ScheduleCustomer.torevtrxtype != null ? data.torevtrxtype + this.separator  :'' 
         

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

            })
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
        // this.hideSideBarMenu('inquiry')
        // this.$store.commit('setLevel', 1)
        // this.$store.commit('setTab', 1)
        // this.$store.commit('setListDisable', false)
        // this.M_ClearForm()
        // this.M_MK_Generate_ScheduleCustomer.status = 'N' 
        // this.toList().doGetList('','eb_getList')
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

<style scope>
    /* .card {
        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
        transition: 0.3s;
        width: 90%;
        margin:15px;
    }

    .card:hover {
        box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
    }

    .container {
        padding: 2px 5px;
    }
    p{
        margin-bottom:5px;
    } */
</style>

