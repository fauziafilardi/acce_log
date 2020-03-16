<template>
  <div class="dashboard-page-mobile">
    <div class="dashboard-page-mobile__title">
      <b-row>
        <b-col cols="12" style="z-index: 10;position: fixed;">
          <b-row style="margin-left:11px !important;margin-left: 5px !important;margin-right: 5px !important;background-color: white;height: 30px;border-bottom: 1px solid #55b3ff;">
              <b-col md="4" style="width:33%;top:5%;">
                  <font-awesome-icon icon="chevron-left" class="icon-style-1"/>
              </b-col>
              <b-col md="4" style="width:33%;top:5%;text-align:center;">Log Book</b-col>
              <b-col md="4" style="width:33%;top:5%;text-align:right">Save</b-col>
          </b-row>
        </b-col>
      </b-row>
    </div>
    <div class="dashboard-page-mobile__body">      
      <b-row style="margin: 0px !important;">
            <b-col md="12" class="bColMasterForm" style="padding: 5px !important">              
                <div class="card" style="font-size:11px; border:0px !important;">
                    <!-- <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex"> -->
                    <b-form>
                        <b-row style="padding-left:10px;">					
                            <b-col md="6" id="col-left">
                                <b-row>
                                    <b-col  md="6">
                                    <ABSinputDateVuex @input="OnnextscheduledateChange" :prop="PI_nextscheduledate" v-model="M_MK_LogBookD.nextscheduledate"  ref="ref_nextscheduledate" />
                                    </b-col>
                                </b-row>
                                <b-row>
                                    <b-col md="6" v-show="err1">
                                        <b-row v-show="err1">
                                            <b-col offset="4"><label class="lbl-value-view-form" style="color:red"> Date must be greater than today </label></b-col>
                                        </b-row>                                            
                                    </b-col>
                                </b-row>
                                <b-row>
                                    <b-col  md="6">
                                    <ABSInputSelectList @change="OnfollowuptypeChange" :prop="PI_followuptype" :value="M_MK_LogBookD.followuptype" :label="M_MK_LogBookD.followuptypeLabel" ref="ref_followuptype"/>
                                    </b-col>
                                </b-row>                                   
                                <b-row>
                                    <b-col  md="6">
                                    <ABSinputTextVuex :prop="PI_descs" v-model="M_MK_LogBookD.descs"  ref="ref_descs"/>
                                    </b-col>
                                </b-row>
                            </b-col>
                        </b-row>
                    </b-form>
                </div>
            </b-col>
      </b-row>          
          <!-- <div class="fab"> + </div> -->
    </div>    
  </div>
</template>

<script>
export default {
    props: {PageLevel: '', TabIndex: '', data: ''},
    data () {
    return {
        FormType: "Process",
         M_MK_LogBookD: {
                nextscheduledate:'',
                followuptype: '',
                descs: '',
                mk_log_book_h_id:'',
            },
             PI_nextscheduledate: { 
                cValidate :'', 
                cName: 'nextscheduledate', 
                cLabel: 'Next Schedule', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            },

            PI_followuptype: { 
                dataLookUp: { 
                    LookUpCd: 'GetFollowUpType'    , 
                    ColumnDB: 'follow_up_type_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'followuptype', 
                cLabel: 'Follow Up Type', 
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
                cDisplayColumn: 'follow_up_type_cd,descs' ,
            },
            PI_descs: { 
                cValidate :'', 
                cName: 'Description', 
                cLabel: 'descs', 
                cLabelSize: 4, 
                cOrder: 2,  
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_' + 1 + '_' + 1 
            } 
    }
  },
  computed : {
  },
  methods: {
    TestClick(){
      alert('tste')
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
  .card-list {
      box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
      transition: 0.3s;
      width: 100%;
      /* margin:15px; */
  }

  .card-list:hover {
      box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
  }

  .container-list {
      padding: 2px 20px;
  }

  .p-list {
    margin-bottom: 0px !important;
    margin-top: 0px !important;
  }

  .fab {
    z-index: 10;
    width: 30px;
    height: 30px;
    background-color: #55b3ff;
    border-radius: 50%;
    box-shadow: 0 6px 10px 0 #666;
    transition: all 0.1s ease-in-out;
    
    font-size: 20px;
    color: white;
    text-align: center;
    line-height: 26px;
    
    position: fixed;
    right: 20px;
    bottom: 18px;
}
 
.fab:hover {
   box-shadow: 0 6px 14px 0 #666;
   transform: scale(1.05);
}

.list-group-item {
    padding: 5px 10px !important;
}
</style>
