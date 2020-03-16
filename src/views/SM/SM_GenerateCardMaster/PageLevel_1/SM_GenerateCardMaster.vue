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
                                <b-col md="12" id="col-left"> <!-- table open -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_prefix" v-model="M_SM_GenerateCardMaster.prefix"  ref="ref_prefix"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_suffix" v-model="M_SM_GenerateCardMaster.suffix"  ref="ref_suffix"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_startnumber" v-model="M_SM_GenerateCardMaster.startnumber"  ref="ref_startnumber"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_qty" v-model="M_SM_GenerateCardMaster.qty"  ref="ref_qty"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OncardtypeChange" :prop="PI_cardtype" v-model="M_SM_GenerateCardMaster.cardtype"  ref="ref_cardtype" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_SM_GenerateCardMaster.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_price" v-model="M_SM_GenerateCardMaster.price"  ref="ref_price"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnfloorcdChange" :prop="PI_floorcd" :value="M_SM_GenerateCardMaster.floorcd" :label="M_SM_GenerateCardMaster.floorcdLabel" ref="ref_floorcd"/>
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
            FormType: "Form",
			Module:"SM",	
            IEBy: {Input: '', Edit: ''},

            M_SM_GenerateCardMaster :{
                prefix: '',
                suffix: '',
                startnumber: '',
                qty: '',
                cardtype: '',
                descs: '',
                price: '',
                floorcd: '',
                floorcdLabel: ''
            },
            PI_prefix: { 
                cValidate :'required|max:10', 
                cName: 'prefix', 
                cLabel: 'Prefix Prefix', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_suffix: { 
                cValidate :'required|max:10', 
                cName: 'suffix', 
                cLabel: 'Suffix', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_startnumber: { 
                cValidate :'required', 
                cName: 'startnumber', 
                cLabel: 'Start Number', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_qty: { 
                cValidate :'required', 
                cName: 'qty', 
                cLabel: 'Qty', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_cardtype: { 
                cValidate :'', 
                cName: 'cardtype', 
                cId: 'rdbcardtype', 
                cRadioOptions: [{ text: 'Owner', value: 'O' },{ text: 'Public', value: 'P' },], 
                cRadioDefaultOption: '', 
                cLabel:'Card Type', 
                cLabelSize: 4, 
                cOrder: 5, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_descs: { 
                cValidate :'max:60', 
                cName: 'descs', 
                cLabel: 'Descs', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_price: { 
                cValidate :'', 
                cName: 'price', 
                cLabel: 'Price', 
                cLabelSize: 4, 
                cOrder: 7, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_floorcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetFloorCd'    , 
                    ColumnDB: 'FloorCd'   , 
                    InitialWhere: "SubPortfolioCd = '" + this.getDataUser().subportfolio_cd + "'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'floorcd', 
                cLabel: 'Floor Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 8, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: '' ,
                cDisplayColumn: 'FloorCode,Description' ,
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
        OncardtypeChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{cardtype}
            }
        })
        this.$forceUpdate()
        },
        OnfloorcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_GenerateCardMaster.floorcd = data.id
            this.M_SM_GenerateCardMaster.floorcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{floorcd}
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
            this.M_ClearForm()		
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
        M_Post(dt){
        },
        M_Insert() {
            this.M_Update()
        },
        M_Update() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                Prefix: this.M_SM_GenerateCardMaster.prefix,
                Suffix: this.M_SM_GenerateCardMaster.suffix,
                StartNumber: this.M_SM_GenerateCardMaster.startnumber,
                Qty: this.M_SM_GenerateCardMaster.qty,
                CardType: this.M_SM_GenerateCardMaster.cardtype,
                Descs: this.M_SM_GenerateCardMaster.descs,
                Price: this.M_SM_GenerateCardMaster.price ? this.replaceAllString(this.M_SM_GenerateCardMaster.price, ',', '', 'number') : 0,
                FloorCd: this.M_SM_GenerateCardMaster.floorcd == '' || this.M_SM_GenerateCardMaster.floorcd == null ? 'NULL' : this.M_SM_GenerateCardMaster.floorcd,
                UserInput: this.getDataUser().user_id
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return

                this.alertSuccess("Generate Card Master Sucessfully")
                .then(() => {
                    this.M_ClearForm()
                    this.$store.commit('setStatus', 'view')
                    this.$store.commit('setStatus', 'edit')
                    this.getToolbar().doEdit(true)

                    this.FormToMasterPage().ValidasiPage()
                })
            })
        },
		M_ClearForm(){
            this.M_SM_GenerateCardMaster = {
                prefix: '',
                suffix: '',
                startnumber: '',
                qty: '',
                cardtype: '',
                descs: '',
                price: '',
                floorcd: '',
                floorcdLabel: ''
            }	
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
        this.$store.commit('setFormType','Form')
    },
    beforeMount: function() {
    },
    mounted: function() {
        this.getToolbar().doEdit(true)
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
