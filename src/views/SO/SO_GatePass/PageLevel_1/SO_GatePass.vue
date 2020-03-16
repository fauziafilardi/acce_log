<template>
    <div class="height--full">
        <!-- <HeaderFormListVuex2 :isProcess = "true" />         -->
        <div class="content-app-form-report__body form-report" style="margin-top:10px !important;height:99%;">
            <!-- <div> -->
            <div class="tab-form-process">
            <div :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
                <div class="div-collapse" v-b-toggle.collapse1>
                    <span class="master-span">
                        <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                    </span>
                </div>
                
                    <b-collapse id="collapse1">
                        <b-row  style="padding-left: 10px;">     
                            <b-col md="12" id="col-left" class="bColMasterForm">	
                                <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                                    <b-row style="padding-left:10px;">					
                                        <b-col md="12" id="col-left"> <!-- table open -->
                                            <b-row>
                                                <b-col  md="6">
                                                    <ABSInputSelectList @change="OnfleettypeChange" :prop="PI_fleettype" :value="M_SO_GatePass.fleettype" :label="M_SO_GatePass.fleettypeLabel" ref="ref_fleettype"/>
                                                </b-col>
                                                <b-col md="6">
                                                    <ABSinputDateRangeVuex :prop="PI_deliverydate" :valueFrom="M_SO_GatePass.startdate" :valueTo="M_SO_GatePass.enddate" @from="Onstartdate" @to="Onenddate" />
                                                </b-col>
                                            </b-row>
                                            <b-row>
                                                <b-col  md="6">
                                                    <ABSInputSelectList @change="OnpoolChange" :prop="PI_pool" :value="M_SO_GatePass.pool" :label="M_SO_GatePass.poolLabel" ref="ref_pool"/>
                                                </b-col>
                                            </b-row>                                        
                                            <b-row style="padding-top:10px;">
                                                <b-col offset="6">
                                                    <b-button style="font-size: 10px;padding-top: 3px;padding-bottom: 3px;"><font-awesome-icon icon="list" class="icon-style-1"/> Proccess</b-button>
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
            <!-- <div>
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
                    </b-col>
                </b-row>
            </div> -->
            <b-row>
                <b-row>
                    <b-col md="12">
                        <div>
                            <h3>Pool Name</h3>
                        </div>
                    </b-col>
                </b-row>
                <b-row style="padding-left: 25px !important;">
                    <b-col md="2" style="width:33% !important; padding-bottom:15px !important; padding-left: 0px !important; padding-right:0px !important;">
                        <div @click="TestClick" class="card" :style="truckStyle">
                            <img :src="require('@/assets/doubleEngkle.png')" alt="Avatar" style="width:100%">
                            <div class="container">
                                <b-progress :max="max" show-progress animated style="height:10px !important;margin-bottom:5px !important; margin-top:5px !important;">
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
                                <b-progress :max="max" show-progress animated style="height:10px !important;margin-bottom:5px !important; margin-top:5px !important;">
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
                                <b-progress :max="max" show-progress animated style="height:10px !important;margin-bottom:5px !important; margin-top:5px !important;">
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
                                <b-progress :max="max" show-progress animated style="height:10px !important;margin-bottom:5px !important; margin-top:5px !important;">
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
                                <b-progress :max="max" show-progress animated style="height:10px !important;margin-bottom:5px !important; margin-top:5px !important;">
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
                                <b-progress :max="max" show-progress animated style="height:10px !important;margin-bottom:5px !important; margin-top:5px !important;">
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
                </b-row>                
            </b-row>
            
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
            truckStyle: '',
            clickStatus: false,
            value: 50,
            max: 100,
            IEBy: {Input: '', Edit: ''},

            M_SO_GatePass :{
                fleettype: '',
                pool:'',
                deliverydate:''
            },
            PI_fleettype: { 
                dataLookUp: { 
                    LookUpCd: 'GetFleetType'    , 
                    ColumnDB: 'fleettype_id'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'fleettype', 
                cLabel: 'Fleet Type', 
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
                cDisplayColumn: 'fleettype_id,fleettype_name' ,
            },
            PI_pool: { 
                dataLookUp: { 
                    LookUpCd: 'GetPool'    , 
                    ColumnDB: 'pool_id'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'pool', 
                cLabel: 'Pool', 
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
                cDisplayColumn: 'fleettype_id,fleettype_name' ,
            },
            PI_deliverydate: {
                cValidate :'required', 
                cName:'PeriodDate', 
                cLabel:'Delivery Date', 
                cOrder:30, 
                cKey:false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
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
        TestClick (){
            // alert(this.clickStatus)
            if(this.clickStatus == false){
                // alert('masuk grey')
                this.truckStyle = 'background-color:#ededed !important;'
                this.clickStatus = true
            }else{
                // alert('masuk white')
                this.truckStyle = 'background-color:white !important;'
                this.clickStatus = false
            }
            
        },
        OnfleettypeChange (data) {
            this.$nextTick(() => {
                this.M_SO_GatePass.fleettype = data.id
                this.M_SO_GatePass.fleettypeLabel = data.label
                
                if (this.inputStatus != "VIEW") {
    
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

