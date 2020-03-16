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
                                    <b-col md="12" id="col-left">
                                        <b-row>
                                            <!-- <b-col md="1"></b-col> -->
                                            <b-col md="3" offset="1">
                                                <ABSinputTextVuex
                                                  :prop="PI_Month"
                                                  v-model="M_BG_ViewBudgetUsage.Month"
                                                />
                                            </b-col>
                                        </b-row>
                                        <b-row>
                                            <!-- <b-col md="1"></b-col> -->
                                            <b-col md="3" offset="1">
                                              <ABSinputTextVuex :prop="PI_Year" v-model="M_BG_ViewBudgetUsage.Year"/>
                                            </b-col>
                                             <b-col offset="1">
                                                  <!-- <ABSButton
                                              :text="btnText"
                                              classButton="button button--new"
                                              classIcon="icon-style-1"
                                              @click="goGenerate"
                                            /> -->
                                            <b-button style="font-size: 10px;padding-top: 3px;padding-bottom: 3px;" @click="goGenerate"><font-awesome-icon icon="list" class="icon-style-1"/> Generate Inquiry</b-button>
                                            <!-- <ABSButton style="width: 125px !important; font-size:10px !important: background-color:red !important;" icon="list" text="Generate Inquiry" classButton="" classIcon="icon-style-1" @click="goGenerate"/> -->
                                              </b-col>
                                        </b-row>
                                    </b-col>
                                </b-row>
                            </b-form>
                            
                        </b-col>
                    </b-row>
                </b-collapse>
            </div>

            <ABSListVuex
                :prop = "propList"
                :title = "'ViewBudgetList'"
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
  <!-- <modal>
    <modals-container/>
</modal> -->
<!-- <modals-container/> -->

    </div>
</template>

<script>
import MyModal from'./BG_viewModal.vue'
export default {
    data() {
        return {
            propList: {
                initialWhere: "SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"'",
                LineNo: 0,
                PageLevel: 1,
                TabIndex: 1,
                OrderBy: "BudgetCd ASC",
                ParamView: "'1','2019','001'"
            },
            paragraphs: [true],
            timer: null,
        widthModal :'80%',
        dataModalHeader:[],
        dataModalDetail:[],
		    FormType: "Process",
       
            IEBy: {Input: '', Edit: ''},

            M_BG_ViewBudgetUsage: {
              Month: "",
              Year: "",
              BudgetCd:"",
              Descs:"",
              Userinput: "",
              UserEdit: this.getDataUser().user_id,
              TimeInput: "",
              TimeEdit: "",
              LastUpdateStamp: 0,
              RowId: 0
            },
            PI_Month: {
              cValidate: "required|max:2|max_value:12",
              cName: "Month",
              cLabel: "Month",
              cOrder: 0,
              cKey: true,
              cPageLevel: 1,
              cTabIndex: 1,
              cParentForm: "FormScope_1_1",
              cType: 'numeric'
            },
            PI_Year: {
              cValidate: "required|max:4",
              cName: "Year",
              cLabel: "Year",
              cOrder: 0,
              cKey: false,
              cPageLevel: 1,
              cTabIndex: 1,
              cParentForm: "FormScope_1_1",
              cType: 'numeric'
            },
            PI_budgetcd: { 
                cLabel:'Budget Code', 
                cValue:'', 
                cPageLevel: 1, 
                cTabIndex: 1, 
            }, 
            PI_budgetcddescs: { 
                cLabel:'Description ', 
                cValue:'', 
                cPageLevel: 1, 
                cTabIndex: 1, 
            }, 
            btnText: 'Generate',
            TrxTypeFrom: null,
            TrxTypeTo: null
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
        PageLevel () {
            return 1
        },
        TabIndex () {
            return 1
        },
  },
  methods: {     
    setToolbarButton (){

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
        getDataModalH(record){
          var param = {
                OptionSeq:this.getOptionSeq().OptionSeq,
                UserId:this.getDataUser().user_id,
                PortfolioCd:this.getDataUser().portfolio_cd,              
                SubPortfolioCd:this.getDataUser().subportfolio_cd,
                LineNo:1,
                InitialWhere:"SubportfolioCd = '"+this.getDataUser().subportfolio_cd+"' and BudgetCd = '"+record.BudgetCd+"'",
                SortField:'',
                ParamView: ""
            }
              this.postEncode(this.getUrlDataList(), param).then(response => {
                  // response from API
                  if (response == null) return
                  this.dataModalHeader = response.Data
              })
        },
        getDataModalD(record){
          var param = {
               OptionSeq:this.getOptionSeq().OptionSeq,
                UserId:this.getDataUser().user_id,
                PortfolioCd:this.getDataUser().portfolio_cd,              
                SubPortfolioCd:this.getDataUser().subportfolio_cd,
                LineNo:2,
                InitialWhere:"SubportfolioCd = '"+this.getDataUser().subportfolio_cd+"' and BudgetCd = '"+record.BudgetCd+"'",
                SortField:'',
                ParamView: ""

            }
            this.postEncode(this.getUrlDataList(), param).then(response => {
                // response from API
                if (response == null) return
                this.dataModalDetail = response.Data
            })
        },
        getModal(data){
            console.log(JSON.stringify(data,null,2))
            this.$modal.show(MyModal, 
                { //Props passing data
                    dataModal:data
                },
                {//Property
                    height: '90%',
                    width : '80%',
                    minWidth: "300",
                    minHeight: "300",
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
        this.$store.commit('setLevel', 1)
       this.$store.commit('setTab', 1)  
       this.$store.commit('setListDisable', false)
        var dt = new Date()
        var month = dt.getMonth()+1
        var year = dt.getFullYear()
        this.M_BG_ViewBudgetUsage.Month = month
        this.M_BG_ViewBudgetUsage.Year = year
        this.hideSideBarMenu()
        this.toList().doGetList('','eb_getList')

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


