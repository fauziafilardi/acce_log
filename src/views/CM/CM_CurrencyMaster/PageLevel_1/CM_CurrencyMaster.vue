<template>
    <div>        
    <ABSListVuex
      :prop = "propList"
      :title = "data.query_name"
      @rowClicked="$parent.rowClicked"
      @rowDblClicked="$parent.doDoubleClick"
      @rowLinkClick="$parent.rowLink"
      @pageSize="$parent.M_PageSize"
      @pagination="$parent.M_Pagination"
      @filter="$parent.M_Advance_Filter"
      @headTable="$parent.M_Head_Table"
      @refreshColumn="$parent.refreshColumn"
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
                                <b-col md="12" id="col-left">
                                    <b-row>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_currency_cd" v-model="M_CM_CurrencyMaster.currency_cd" ref="ref_currency_cd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_CM_CurrencyMaster.descs" ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_currency_sign" v-model="M_CM_CurrencyMaster.currency_sign"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex :prop="PI_operator" v-model="M_CM_CurrencyMaster.operator" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_rate" v-model="M_CM_CurrencyMaster.rate"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_unit_name" v-model="M_CM_CurrencyMaster.unit_name"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_sub_unit_name" v-model="M_CM_CurrencyMaster.sub_unit_name"/>
                                      </b-col>
                                    </b-row>
                                    <!-- <div class="div-collapse">
                                        <span class="master-span-form">
                                            Transaction Analysis
                                        </span>
                                    </div>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_Type" v-model="M_CM_CurrencyMaster.Type"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col md="6">
                                        <ABSInputSelect2 @change="OnTrxAnalysisCdChange" :prop="PI_TrxAnalysisCd" :value="M_CM_CurrencyMaster.TrxAnalysisCd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_FromBank" v-model="M_CM_CurrencyMaster.FromBank"/>
                                      </b-col>
                                    </b-row> -->
                                    <!-- <b-row>
                                        <b-col> -->
                                            <!-- <ABSTAnalysis :prop="PTAnalysis"/> -->
                                        <!-- </b-col>
                                    </b-row> -->
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
export default {
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
          cInsertKey:'id=cm_currency_id,label=currency_cd+|+descs',
		FormType: "List",
		Module:"CM",
            propList: {
                initialWhere: "",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_CM_CurrencyMaster :{
                currency_cd: '',
                descs: '',
                currency_sign: '',
                operator: '*',
                rate: '',
                unit_name: '',
                sub_unit_name: '',
                realize_forex_gain_account_cd: '',
                realize_forex_loss_account_cd: '',
                Unrealize_forex_gain_account_cd: '',
                Unrealize_forex_loss_account_cd: '',
                realize_forex_loss_account_cd: '',
                realize_forex_loss_prefix_cd: '',
                Unrealize_forex_loss_account_cd: '',
                Unrealize_forex_loss_prefix_cd: '',
                gl_forex_gain_account_cd: '',
                gl_forex_loss_account_cd: '',
                user_input: '',
                user_edit: this.getDataUser().user_id,
                time_edit: '',
                
                lastupdatestamp: 0,
                row_id: 0,
                // TrxAnalysisCd: ''
                    }
            ,
            PI_currency_cd: { 
                cValidate :'required|max:4', 
                cName:'currency_cd', 
                cLabel:'Currency Code', 
                cOrder:1, 
                cKey:true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_descs: { 
                cValidate :'required|max:60', 
                cName:'descs', 
                cLabel:'Description', 
                cOrder:2, 
                cKey:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_currency_sign: { 
                cValidate :'max:5', 
                cName:'currency_sign', 
                cLabel:'Currency Sign', 
                cOrder:3, 
                cKey:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_operator: { 
                cValidate :'', 
                cName:'operator', 
                cId:'rdboperator', 
                cRadioOptions: [{ text: 'Multiply (*)', value: '*' }, { text: 'Divide (/)', value: '/' }], 
                cLabel:'operator', 
                cOrder:4, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_rate: { 
                // cValidate :'required|max:12',
                cValidate :'required|max:16|min_value:0.00',
                cName:'rate', 
                cLabel:'rate', 
                cOrder:5, 
                cKey:false, 
                cType: 'decimal',
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_unit_name: { 
                cValidate :'max:15', 
                cName:'unit_name', 
                cLabel:'Unit Name', 
                cOrder:6, 
                cKey:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_sub_unit_name: { 
                cValidate :'max:10', 
                cName:'sub_unit_name', 
                cLabel:'Sub Unit Name', 
                cOrder:7, 
                cKey:false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }
            //,
            // PI_FromBank: { 
            //     cValidate :'', 
            //     cName:'FromBank', 
            //     cLabel:'From Bank',
            //     cOrder:7, 
            //     cKey:true, 
            //     cPageLevel: this.PageLevel, 
            //     cTabIndex: this.TabIndex, 
            //     cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
            //     cProtect: true 
            // },
            // PI_Type: { 
            //     cValidate :'', 
            //     cName:'Type', 
            //     cLabel:'Type',
            //     cOrder:7, 
            //     cKey:true, 
            //     cPageLevel: this.PageLevel, 
            //     cTabIndex: this.TabIndex, 
            //     cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
            //     cProtect: true 
            // },
            // PI_TrxAnalysisCd: { 
            //     dataLookUp: { 
            //         LookUpCd: 'GetLookupDepartment'    , 
            //         ColumnDB: 'TrxAnalysisCd'   , 
            //         InitialWhere: "SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"'"   , 
            //         ParamWhere: ''  
            //             }, 
            //     cValidate :'', 
            //     cName:'TrxAnalysisCd', 
            //     cLabel:'Department', 
            //     cOrder:1, 
            //     cPageLevel: this.PageLevel, 
            //     cTabIndex: this.TabIndex, 
            //     cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex                
            // },
			// PTAnalysis: {
      //           cPageLevel: this.PageLevel,
      //           cTabIndex: this.TabIndex,
      //           cPageMasterSeq: this.data.PageMasterSeq,
      //           cFormPageNo: this.data.PageOrder
      //       }
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
        // OnTrxAnalysisCdChange (data) {
        //     this.M_CM_CurrencyMaster.TrxAnalysisCd = data.id
        //     this.M_CM_CurrencyMaster.TrxAnalysisCdLabel = data.label

        //     this.$forceUpdate()
        // },
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
        M_Post(){
        },
        M_Refresh(){
        },
        M_ClearForm(){
            this.M_CM_CurrencyMaster ={
                currency_cd: '',
                descs: '',
                currency_sign: '',
                operator: '*',
                rate: '',
                unit_name: '',
                sub_unit_name: '',
                realize_forex_gain_account_cd: '',
                realize_forex_loss_account_cd: '',
                Unrealize_forex_gain_account_cd: '',
                Unrealize_forex_loss_account_cd: '',
                realize_forex_loss_account_cd: '',
                realize_forex_loss_prefix_cd: '',
                Unrealize_forex_loss_account_cd: '',
                Unrealize_forex_loss_prefix_cd: '',
                gl_forex_gain_account_cd: '',
                gl_forex_loss_account_cd: '',
                user_input: '',
                user_edit: this.getDataUser().user_id,
                time_edit: '',
                
                lastupdatestamp: 0,
                row_id: 0,
                // TrxAnalysisCd: ''
            }
            		
        },
        M_New(){
          this.$refs.ref_currency_cd.focus()
            //this.$nextTick().then(() => document.getElementById("currency_cd").focus())
        },
        M_Edit(){
          this.$refs.ref_descs.focus()
            //this.$nextTick().then(() => document.getElementById("???").focus())
        },
        M_Delete(dt){
            var data = this.FormToABSList().getRowSelected()  
            var dataDelete = []

            
            data.forEach((value) => {
            dataDelete.push({
                currency_cd: value.currency_cd,
                lastupdatestamp: value.lastupdatestamp,
                _Message_: ""
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
                currency_cd: this.M_CM_CurrencyMaster.currency_cd,
                descs: this.M_CM_CurrencyMaster.descs,
                currency_sign: this.M_CM_CurrencyMaster.currency_sign,
                operator: this.M_CM_CurrencyMaster.operator,
                rate: this.M_CM_CurrencyMaster.rate ? this.replaceAllString(this.M_CM_CurrencyMaster.rate, ",", "") : 0 ,
                unit_name: this.M_CM_CurrencyMaster.unit_name,
                sub_unit_name: this.M_CM_CurrencyMaster.sub_unit_name,
                user_input: this.getDataUser().user_id                 
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
                currency_cd: this.M_CM_CurrencyMaster.currency_cd,
                descs: this.M_CM_CurrencyMaster.descs,
                currency_sign: this.M_CM_CurrencyMaster.currency_sign,
                operator: this.M_CM_CurrencyMaster.operator,
                rate: this.M_CM_CurrencyMaster.rate ? this.replaceAllString(this.M_CM_CurrencyMaster.rate, ",", "") : 0 ,
                unit_name: this.M_CM_CurrencyMaster.unit_name,
                sub_unit_name: this.M_CM_CurrencyMaster.sub_unit_name,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CM_CurrencyMaster.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return
                this.$parent.resultUpdate(response.Message)                
            })

        },
        M_Cancel() {},
        paramFromParent(){
        },		
        rowClicked (record, index) {
        },        
		doDoubleClick(){
        }, 
        rowLink: function(url){            
        },
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                currency_cd: record.currency_cd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                this.M_CM_CurrencyMaster ={
                    currency_cd: data.currency_cd,
                    descs: data.descs,
                    currency_sign: data.currency_sign,
                    operator: data.operator,
                    rate: this.isCurrency(data.rate, this.decimal),
                    unit_name: data.unit_name,
                    sub_unit_name: data.sub_unit_name,
                    realize_forex_gain_account_cd: data.realize_forex_gain_account_cd,
                    realize_forex_loss_account_cd: data.realize_forex_loss_account_cd,
                    Unrealize_forex_gain_account_cd: data.unrealize_forex_gain_account_cd,
                    Unrealize_forex_loss_account_cd: data.unrealize_forex_loss_account_cd,
                    realize_forex_loss_account_cd: data.realize_forex_loss_account_cd,
                    realize_forex_loss_prefix_cd: data.realize_forex_loss_prefix_cd,
                    Unrealize_forex_loss_account_cd: data.unrealize_forex_loss_account_cd,
                    Unrealize_forex_loss_prefix_cd: data.unrealize_forex_loss_prefix_cd,
                    gl_forex_gain_account_cd: data.gl_forex_gain_account_cd,
                    gl_forex_loss_account_cd: data.gl_forex_loss_account_cd,
                    user_input: data.user_input,
                    user_edit: data.user_edit,
                    time_edit: data.time_edit,
                   
                    lastupdatestamp: record.lastupdatestamp,
                    row_id: data.row_id
                    // ,
                    // TrxAnalysisCd: data.currency_cd                
                }
                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit
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

