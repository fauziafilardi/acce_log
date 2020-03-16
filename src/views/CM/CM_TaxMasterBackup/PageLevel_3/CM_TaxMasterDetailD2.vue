<template>
    <div>        
        <ABSListVuex
            :prop = "propList"
            :title = "data.query_name"
            @rowClicked = "rowClicked"
            @rowDblClicked = "doDoubleClick"
            @rowLinkClick = "rowLink"
            @pageSize = "M_PageSize"
            @pagination = "M_Pagination"
            @filter = "M_Advance_Filter"
            @headTable = "M_Head_Table"
        />

        <div v-show="$parent.isDetail"  :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
            <div class="div-collapse" v-b-toggle.collapse1>
                <span class="master-span" v-show="IEBy.Input && IEBy.Edit">
                    Input By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}} <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                </span>
            </div>
            <b-collapse id="collapse1" :visible="true">
                <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">     
					<b-col md="12" id="col-left" class="bColMasterForm">	
						<b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                            <b-row style="padding-left:10px;">
                                <b-col md="12" id="col-left">
                                    <b-row>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_TaxCd" v-model="M_CM_TaxMasterDetailD2.TaxCd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_TaxType" v-model="M_CM_TaxMasterDetailD2.TaxType"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_StartAmt" v-model="M_CM_TaxMasterDetailD2.StartAmt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_TaxRate" v-model="M_CM_TaxMasterDetailD2.TaxRate"/>
                                      </b-col>
                                    </b-row>                                    
                                </b-col>                  
							</b-row>
						</b-form>
					</b-col>
                </b-row>
            </b-collapse>
        </div>
    </div>
</template>

<script>
import {EventBus} from '../../../../main'
export default {
    props: {PageLevel:'', TabIndex: '', data: ''},
    data() {
        return {
			ValKey:null,
            FormType: "List",
            Module:"CM",
            propList: {
                initialWhere:"TaxCd = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_CM_TaxMasterDetailD2 :{
                TaxCd: '',
                TaxType: '',
                SequenceNo: '',
                StartAmt: '',                
                TaxRate: '',
                UserInput: '',
                UserEdit: this.getDataUser().user_id,
                TimeInput: '',
                TimeEdit: '',
                LastUpdateStamp: 0,
                ControlSequenceNo: 0,
                RowId: 0
                    }
            ,
            PI_TaxCd: { 
                cValidate :'', 
                cName:'TaxCd', 
                cLabel:'Tax Code', 
                cOrder:1, 
                cKey:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cProtect: true
            },
            PI_TaxType: { 
                cValidate :'', 
                cName:'TaxType', 
                cLabel:'Tax Type', 
                cOrder:1, 
                cKey:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cProtect: true
            },
            PI_StartAmt: { 
                cValidate :'required', 
                cName:'EndAmount', 
                cLabel:'End Amount', 
                cOrder:1, 
                cKey:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cType: 'decimal'
            },
            PI_TaxRate: { 
                cValidate :'required', 
                cName:'TaxRate', 
                cLabel:'Tax Rate', 
                cOrder:1, 
                cKey:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                cType: 'decimal'
            },            
			PTAnalysis: {
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cPageMasterSeq: this.data.PageMasterSeq,
                cFormPageNo: this.data.PageOrder
            }         
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
    }
  },
    methods: {
	
		setToolbarButton () {
           //this.getToolbar().statusFunction[4].disabled = false
		},		
        M_Head_Table () {
            this.$store.commit('setEventStatus', 'HEADTABLE')
            this.$store.commit('setLevel',this.PageLevel)
            this.$parent.isDetail = false
            this.FormToMasterPage().ValidasiPage()
        },
        M_PageSize(){
			this.$store.commit('setEventStatus', 'PAGESIZE')
            this.$store.commit('setLevel',this.PageLevel)
            this.$parent.isDetail = false
            this.FormToMasterPage().ValidasiPage()
        },
        M_TabClick(){
        },
        M_Pagination(){
			this.$store.commit('setEventStatus', 'PAGINATION')
            this.$store.commit('setLevel',this.PageLevel)
            this.$parent.isDetail = false
            this.FormToMasterPage().ValidasiPage()
        },
        M_Advance_Filter(){
        },
        M_Refresh(){
            this.$parent.isDetail = false
            this.FormToABSList().doGetList('','refresh')
        },
        SaveData () {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                TaxCd: this.M_CM_TaxMasterDetailD2.TaxCd,
                TaxType: this.M_CM_TaxMasterDetailD2.TaxType,
                StartAmt: this.M_CM_TaxMasterDetailD2.StartAmt ? this.replaceAllString(this.M_CM_TaxMasterDetailD2.StartAmt, ",", "","number") : 0,                
                TaxRate: this.M_CM_TaxMasterDetailD2.TaxRate ? this.replaceAllString(this.M_CM_TaxMasterDetailD2.TaxRate, ",", "","number") : 0,
                UserInput: this.getDataUser().user_id                
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
                
                this.FormToABSList().doGetList('','save')

                this.alertSuccess(response.Message)
                .then(() => {
                    this.getToolbar().setButton(false)
                    this.$store.commit('setListDisable', false)
                    this.$store.commit('setStatus', 'view')
					this.$store.commit('setEventStatus', 'Save')
                    this.FormToABSList().doGetList('','eb_getList')
                    this.$parent.isDetail = false

                    this.FormToMasterPage().ValidasiPage()
										
					
                })
            })
        },
        UpdateData () {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                TaxCd: this.M_CM_TaxMasterDetailD2.TaxCd,
                TaxType: this.M_CM_TaxMasterDetailD2.TaxType,
                // StartAmt: this.M_CM_TaxMasterDetailD2.StartAmt ? this.replaceAllString(this.M_CM_TaxMasterDetailD2.StartAmt, ",", "","number") : 0,                
                TaxRate: this.M_CM_TaxMasterDetailD2.TaxRate ? this.replaceAllString(this.M_CM_TaxMasterDetailD2.TaxRate, ",", "","number") : 0,
                // UserEdit: this.getDataUser().user_id,
                SequenceNo: this.M_CM_TaxMasterDetailD2.SequenceNo,
                LastUpdateStamp: this.M_CM_TaxMasterDetailD2.LastUpdateStamp,
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                this.alertSuccess(response.Message)
                .then(() => {
                    this.getToolbar().setButton(false)
                    this.$store.commit('setListDisable', false)
                    this.$store.commit('setStatus', 'view')

                    this.FormToABSList().doGetList('','update')
                    this.$parent.isDetail = false

                    this.FormToMasterPage().ValidasiPage()
					
                })
            })
        },
		m_ClearForm(){
            this.M_CM_TaxMasterDetailD2 ={
                TaxCd: '',
                TaxType: '',
                SequenceNo: '',
                StartAmt: '',                
                TaxRate: '',
                UserInput: '',
                UserEdit: this.getDataUser().user_id,
                TimeInput: '',
                TimeEdit: '',
                LastUpdateStamp: 0,
                ControlSequenceNo: 0,
                RowId: 0
                    }
            		
		},
        M_New(){
            this.$parent.state = 'NEW'
            this.$parent.isDetail = true
			this.m_ClearForm()
			
            let data = this.$store.getters.GetPage2Data
            this.M_CM_TaxMasterDetailD2.TaxCd = data.TaxCd
            this.M_CM_TaxMasterDetailD2.TaxType = data.TaxType
			
            this.FormToMasterPage().ValidasiPage()                      
        },
        M_Edit(){
            
        },
        M_Delete(){
            var data = this.FormToABSList().getRowSelected()
            var dataDelete = []

            data.forEach((value) => {
                dataDelete.push({
                SequenceNo: value.SequenceNo,
                TaxCd: value.TaxCd,
                TaxType: value.TaxType,
                LastUpdateStamp: value.LastUpdateStamp,
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
        M_Save(){
            // if(this.$parent.state !== 'NEW'){
			if(this.inputStatus == 'EDIT')
			{
                this.UpdateData()
            }
            else 
			{
                this.SaveData()
            }
        },
        paramFromParent(){
            this.$parent.isDetail = false
            let data = this.$store.getters.GetPage2Data
            this.M_CM_TaxMasterDetailD2.TaxCd = data.TaxCd 
            this.propList.initialWhere =" TaxCd = '" + data.TaxCd + "'"
            this.FormToABSList().doGetList('','eb_getList')
        },
		M_Cancel() {},		
        rowClicked (record, index) {
            this.$parent.state = 'UPDATE'
            this.$parent.isDetail = true
            
            this.$store.commit('SetPage3Data', record)
            this.$store.commit('setEventStatus', 'rowClick')
            this.$store.commit('setLevel',this.PageLevel)
            this.getDataBy(record)

            //selalu taro paling bawah
            this.FormToMasterPage().ValidasiPage()
        },
        rowLink: function(url){
            this.$refs.modalTest.show()
        },
        getDataBy (record) {
            console.log(record)
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                TaxCd: record.TaxCd,
                TaxType: record.TaxType,
                LastUpdateStamp: record.LastUpdateStamp,
                SequenceNo: record.SequenceNo				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                this.M_CM_TaxMasterDetailD2 ={
                    TaxCd: data.TaxCd,
                    TaxType: data.TaxType,
                    SequenceNo: data.SequenceNo,
                    StartAmt: this.isCurrency(data.StartAmt),                
                    TaxRate: this.isCurrency(data.TaxRate),
                    UserInput: data.UserInput,
                    UserEdit: this.getDataUser().user_id,
                    TimeInput: data.TimeInput,
                    TimeEdit: data.TimeEdit,                
                    LastUpdateStamp: record.LastUpdateStamp,                
                    RowId: data.row_id
                
               
                    }
                 

  

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

            })
        },
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

