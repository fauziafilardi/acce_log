<template>
    <div>        
    <ABSListVuex
      :prop = "propList"
      :title = "data.query_name"
      @rowClicked = "$parent.rowClicked"
      @rowDblClicked = "$parent.doDoubleClick"
      @rowLinkClick = "$parent.rowLink"
      @pageSize = "$parent.M_PageSize"
      @pagination = "$parent.M_Pagination"
      @filter = "$parent.M_Advance_Filter"
      @headTable = "$parent.M_Head_Table"
      @refreshColumn = "$parent.refreshColumn"
      @checkboxChecked = "$parent.checkboxChecked"
    />


        <div v-show="$parent.showForm"  :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
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
                                <b-col md="12" id="col-left"> <!-- table open -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_trxtype" v-model="M_SM_TransactionTypeMaster.trxtype"  ref="ref_trxtype"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_SM_TransactionTypeMaster.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_shortdescs" v-model="M_SM_TransactionTypeMaster.shortdescs"  ref="ref_shortdescs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelect2 @change="OntrxclassChange" :prop="PI_trxclass" :value="M_SM_TransactionTypeMaster.trxclass" :label="M_SM_TransactionTypeMaster.trxclassLabel" ref="ref_trxclass"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnrunningcdChange" :prop="PI_runningcd" :value="M_SM_TransactionTypeMaster.runningcd" :label="M_SM_TransactionTypeMaster.runningcdLabel"  ref="ref_runningcd" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_sequenceno" v-model="M_SM_TransactionTypeMaster.sequenceno"  ref="ref_sequenceno"/>
                                      </b-col>
                                    </b-row>
                                </b-col> <!-- table close -->
                  
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
		cInsertKey:'',
		FormType: "List",
		Module:"SM",
            propList: {
                initialWhere: "ModuleCd= 'SM'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_TransactionTypeMaster :{
                allocpriority: '',
                buildingsalesaccountcd: '',
                buildingsalesaccountcddescs: '',
                debtorcreditoraccountcd: '',
                descs: '',
                descs1: '',
                gltrxtype: '',
                gltrxtypedescs: '',
                interestaccountcd: '',
                interestaccountcddescs: '',
                landsalesaccountcd: '',
                landsalesaccountcddescs: '',
                nonrefundableaccountcd: '',
                nonrefundableaccountcddescs: '',
                otheraccountcd: '',
                otheraccountcddescs: '',
                overpaymentaccountcd: '',
                overpaymentaccountcddescs: '',
                refundableaccountcd: '',
                refundableaccountcddescs: '',
                runningcd: '',
                runningcodedescs: '',
                shortdescs: '',
                sequenceno: '9',
                t0: '',
                t1: '',
                t2: '',
                t3: '',
                t4: '',
                t5: '',
                t6: '',
                t7: '',
                t8: '',
                t9: '',
                t10: '',
                t11: '',
                t12: '',
                t13: '',
                t14: '',
                t15: '',
                t16: '',
                t17: '',
                t18: '',
                t19: '',
                t20: '',
                t21: '',
                t22: '',
                t23: '',
                t24: '',
                t25: '',
                t26: '',
                t27: '',
                t28: '',
                t29: '',
                t30: '',
                taxbasepercent: '',
                taxcd: '',
                taxdescs: '',
                trxclass: 'U',
                trxtype: '',
                underpaymentaccountcd: '',
                underpaymentaccountcddescs: '',
                unitaraccountcd: '',
                unitaraccountcddescs: '',
                unitdefferedincomeaccountcd: '',
                unitdefferedincomeaccountcddescs: '',
                useredit: this.getDataUser().user_id,
                userinput: '',
                voaraccountcd: '',
                voaraccountcddescs: '',
                vodefferedincomeaccountcd: '',
                vodefferedincomeaccountcddescs: '',
                vosalesaccountcd: '',
                vosalesaccountcddescs: '',
                lastupdatestamp: 0,
                rowid: 0,
                    }
            ,
            PI_trxtype: { 
                cValidate :'required|max:8', 
                cName: 'trxtype', 
                cLabel: 'Trans. Type', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_descs: { 
                cValidate :'required|max:60', 
                cName: 'descs', 
                cLabel: 'Description', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_shortdescs: { 
                cValidate :'', 
                cName: 'shortdescs', 
                cLabel: 'Short Description', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_trxclass: { 
                dataLookUp: null, 
                cValidate :'', 
                cName: 'trxclass', 
                cLabel: 'Trans. Class', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: true, 
                cOption: [{ label: 'Unit', id: 'U' },{ label: 'Interest', id: 'I' },{ label: 'VO', id: 'V' },{ label: 'Others', id: 'O' }], 
                cMasterUrl: '' ,
                cDisplayColumn: '' ,
            }, 
            PI_runningcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'RunningCd'   , 
                    InitialWhere: "ModuleCd='SM'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'runningcd', 
                cLabel: 'Running Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 5, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: true, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cIsAlwaysShow: false,
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: 'CM/CM_RunningCd' ,
                cDisplayColumn: 'RunningCd,Descs' ,
            }, 
            PI_sequenceno: { 
                cValidate :'required|max:1', 
                cName: 'sequenceno', 
                cLabel: 'Sequence No', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cType: 'numeric',
                cLastLabel: '(1-9) 1 : Highest',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

			PTAnalysis: {
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cPageMasterSeq: this.data.PageMasterSeq,
                cFormPageNo: this.data.PageOrder,
				cProtect: false
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
    },
	DataRow(){
		return this.$store.getters.GetPage1Data
	},
	GetDataBy1(){
		return this.$store.getters.GetPage1GetDataBy
	}
  },
    methods: {		
        OntrxclassChange (data){
        this.$nextTick(() => {
            this.M_SM_TransactionTypeMaster.trxclass = data.id
            this.M_SM_TransactionTypeMaster.trxclassLabel = data.label
            if (this.inputStatus != "VIEW") {
//{trxclass}
            }
        })
        this.$forceUpdate()
        },
        OnrunningcdChange (data){
        this.$nextTick(() => {
            this.M_SM_TransactionTypeMaster.runningcd = data.id
            this.M_SM_TransactionTypeMaster.runningcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{runningcd}
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
		M_CheckboxChecked(data, status, index){

        },		
        M_Post(dt){
        },
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                TrxType: this.M_SM_TransactionTypeMaster.trxtype,
                Descs: this.M_SM_TransactionTypeMaster.descs,
                ShortDescs: this.M_SM_TransactionTypeMaster.shortdescs,
                TrxClass: this.M_SM_TransactionTypeMaster.trxclass,
                RunningCd: this.M_SM_TransactionTypeMaster.runningcd,
                UserInput: this.getDataUser().user_id ,
                SequenceNo: this.M_SM_TransactionTypeMaster.sequenceno                
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
                TrxType: this.M_SM_TransactionTypeMaster.trxtype,
                Descs: this.M_SM_TransactionTypeMaster.descs,
                ShortDescs: this.M_SM_TransactionTypeMaster.shortdescs,
                TrxClass: this.M_SM_TransactionTypeMaster.trxclass,
                RunningCd: this.M_SM_TransactionTypeMaster.runningcd,
                UserEdit: this.getDataUser().user_id ,
                SequenceNo: this.M_SM_TransactionTypeMaster.sequenceno,
                LastUpdateStamp: this.M_SM_TransactionTypeMaster.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_TransactionTypeMaster = {
                allocpriority: '',
                buildingsalesaccountcd: '',
                buildingsalesaccountcddescs: '',
                debtorcreditoraccountcd: '',
                descs: '',
                descs1: '',
                gltrxtype: '',
                gltrxtypedescs: '',
                interestaccountcd: '',
                interestaccountcddescs: '',
                landsalesaccountcd: '',
                landsalesaccountcddescs: '',
                nonrefundableaccountcd: '',
                nonrefundableaccountcddescs: '',
                otheraccountcd: '',
                otheraccountcddescs: '',
                overpaymentaccountcd: '',
                overpaymentaccountcddescs: '',
                refundableaccountcd: '',
                refundableaccountcddescs: '',
                runningcd: '',
                runningcodedescs: '',
                shortdescs: '',
                sequenceno: '9',
                t0: '',
                t1: '',
                t2: '',
                t3: '',
                t4: '',
                t5: '',
                t6: '',
                t7: '',
                t8: '',
                t9: '',
                t10: '',
                t11: '',
                t12: '',
                t13: '',
                t14: '',
                t15: '',
                t16: '',
                t17: '',
                t18: '',
                t19: '',
                t20: '',
                t21: '',
                t22: '',
                t23: '',
                t24: '',
                t25: '',
                t26: '',
                t27: '',
                t28: '',
                t29: '',
                t30: '',
                taxbasepercent: '',
                taxcd: '',
                taxdescs: '',
                trxclass: 'U',
                trxtype: '',
                underpaymentaccountcd: '',
                underpaymentaccountcddescs: '',
                unitaraccountcd: '',
                unitaraccountcddescs: '',
                unitdefferedincomeaccountcd: '',
                unitdefferedincomeaccountcddescs: '',
                useredit: this.getDataUser().user_id,
                userinput: '',
                voaraccountcd: '',
                voaraccountcddescs: '',
                vodefferedincomeaccountcd: '',
                vodefferedincomeaccountcddescs: '',
                vosalesaccountcd: '',
                vosalesaccountcddescs: '',
                lastupdatestamp: 0,
                rowid: 0,
                    }
            	
	
		},
        M_New(){
			this.$refs.ref_trxtype.focus()
        },
        M_Edit(){
            this.$refs.ref_descs.focus()
        },
        M_Delete(dt){       
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {
                console.log(value)
				
				dataDelete.push({
					_Message_:'',
                    TrxType: value.TrxType,
                    LastUpdateStamp: value.LastUpdateStamp,


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
        getDataBy (record) {
            console.log(record)
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,                trxtype: record.TrxType
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                console.log(data)
this.M_SM_TransactionTypeMaster = {
            allocpriority: data.allocpriority,
            buildingsalesaccountcd: data.buildingsalesaccountcd,
            buildingsalesaccountcddescs: data.buildingsalesaccountcddescs,
            debtorcreditoraccountcd: data.debtorcreditoraccountcd,
            descs: data.descs,
            descs1: data.descs1,
            gltrxtype: data.gltrxtype,
            gltrxtypedescs: data.gltrxtypedescs,
            interestaccountcd: data.interestaccountcd,
            interestaccountcddescs: data.interestaccountcddescs,
            landsalesaccountcd: data.landsalesaccountcd,
            landsalesaccountcddescs: data.landsalesaccountcddescs,
            nonrefundableaccountcd: data.nonrefundableaccountcd,
            nonrefundableaccountcddescs: data.nonrefundableaccountcddescs,
            otheraccountcd: data.otheraccountcd,
            otheraccountcddescs: data.otheraccountcddescs,
            overpaymentaccountcd: data.overpaymentaccountcd,
            overpaymentaccountcddescs: data.overpaymentaccountcddescs,
            refundableaccountcd: data.refundableaccountcd,
            refundableaccountcddescs: data.refundableaccountcddescs,
            runningcd: data.runningcd,
            runningcodedescs: data.runningcodedescs,
            shortdescs: data.shortdescs,
            t0: data.t0,
            t1: data.t1,
            t2: data.t2,
            t3: data.t3,
            t4: data.t4,
            t5: data.t5,
            t6: data.t6,
            t7: data.t7,
            t8: data.t8,
            t9: data.t9,
            t10: data.t10,
            t11: data.t11,
            t12: data.t12,
            t13: data.t13,
            t14: data.t14,
            t15: data.t15,
            t16: data.t16,
            t17: data.t17,
            t18: data.t18,
            t19: data.t19,
            t20: data.t20,
            t21: data.t21,
            t22: data.t22,
            t23: data.t23,
            t24: data.t24,
            t25: data.t25,
            t26: data.t26,
            t27: data.t27,
            t28: data.t28,
            t29: data.t29,
            t30: data.t30,
            taxbasepercent: data.taxbasepercent,
            taxcd: data.taxcd,
            taxdescs: data.taxdescs,
            trxclass: data.trxclass,
            trxtype: data.trxtype,
            underpaymentaccountcd: data.underpaymentaccountcd,
            underpaymentaccountcddescs: data.underpaymentaccountcddescs,
            unitaraccountcd: data.unitaraccountcd,
            unitaraccountcddescs: data.unitaraccountcddescs,
            unitdefferedincomeaccountcd: data.unitdefferedincomeaccountcd,
            unitdefferedincomeaccountcddescs: data.unitdefferedincomeaccountcddescs,
            useredit: data.useredit,
            userinput: data.userinput,
            voaraccountcd: data.voaraccountcd,
            voaraccountcddescs: data.voaraccountcddescs,
            vodefferedincomeaccountcd: data.vodefferedincomeaccountcd,
            vodefferedincomeaccountcddescs: data.vodefferedincomeaccountcddescs,
            vosalesaccountcd: data.vosalesaccountcd,
            vosalesaccountcddescs: data.vosalesaccountcddescs,
            lastupdatestamp: 0,
            rowid: 0,   
                    }
                 
                this.M_SM_TransactionTypeMaster.runningcdLabel = this.M_SM_TransactionTypeMaster.runningcd != null && this.M_SM_TransactionTypeMaster.runningcd != "" ? data.runningcd + this.separator + data.runningcodedescs :'' 


                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

            })
        }

    },
    beforeCreate: function () {
    },
    created: function() {
	this.$store.commit('setFormType','List')
    this.getToolbar().ProcessPS()
    },
    beforeMount: function() {
    },
    mounted: function() {
        this.hideSideBarMenu()
        this.FormToABSList().doGetList('','eb_getList')

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

