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
                                        <ABSinputTextVuex @input="OnportfoliocdChange" :prop="PI_portfoliocd" v-model="M_CM_Portfolio.portfoliocd"  ref="ref_portfoliocd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnnameChange" :prop="PI_name" v-model="M_CM_Portfolio.name"  ref="ref_name"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnreferencenoChange" :prop="PI_referenceno" v-model="M_CM_Portfolio.referenceno"  ref="ref_referenceno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="Onaddress1Change" :prop="PI_address1" v-model="M_CM_Portfolio.address1"  ref="ref_address1"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="Onaddress2Change" :prop="PI_address2" v-model="M_CM_Portfolio.address2"  ref="ref_address2"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="Onaddress3Change" :prop="PI_address3" v-model="M_CM_Portfolio.address3"  ref="ref_address3"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="Onaddress4Change" :prop="PI_address4" v-model="M_CM_Portfolio.address4"  ref="ref_address4"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnzipcodeChange" :prop="PI_zipcode" v-model="M_CM_Portfolio.zipcode"  ref="ref_zipcode"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncitycdChange" :prop="PI_citycd" :value="M_CM_Portfolio.citycd" :label="M_CM_Portfolio.citycdLabel" ref="ref_citycd" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSCompute :prop="PI_citydescs" v-model="M_CM_Portfolio.citydescs"  ref="ref_citydescs" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnwebsiteChange" :prop="PI_website" v-model="M_CM_Portfolio.website"  ref="ref_website"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnphonenoChange" :prop="PI_phoneno" v-model="M_CM_Portfolio.phoneno"  ref="ref_phoneno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnfaxnoChange" :prop="PI_faxno" v-model="M_CM_Portfolio.faxno"  ref="ref_faxno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnsirprefixChange" :prop="PI_sirprefix" v-model="M_CM_Portfolio.sirprefix"  ref="ref_sirprefix"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OncbuniquepaymentnoChange" :prop="PI_cbuniquepaymentno" v-model="M_CM_Portfolio.cbuniquepaymentno"  ref="ref_cbuniquepaymentno" />
                                      </b-col>
                                    </b-row>
                                    <!-- <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="Onxxx8325Change" :prop="PI_xxx8325" v-model="M_CM_Portfolio.xxx8325"  ref="ref_xxx8325" />
                                      </b-col>
                                    </b-row> -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_CM_Portfolio.remarks"  ref="ref_remarks" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_referencefilename" v-model="M_CM_Portfolio.referencefilename"  ref="ref_referencefilename" />
                                      </b-col>
                                    </b-row>
                                    <!-- <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_xxx8349" v-model="M_CM_Portfolio.xxx8349"  ref="ref_xxx8349" />
                                      </b-col>
                                    </b-row> -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnminpasswordlengthChange" :prop="PI_minpasswordlength" v-model="M_CM_Portfolio.minpasswordlength"  ref="ref_minpasswordlength"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnmaxpasswordliveChange" :prop="PI_maxpasswordlive" v-model="M_CM_Portfolio.maxpasswordlive"  ref="ref_maxpasswordlive"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnpasswordstrengthChange" :prop="PI_passwordstrength" v-model="M_CM_Portfolio.passwordstrength"  ref="ref_passwordstrength" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnmaxloginfailedattemptChange" :prop="PI_maxloginfailedattempt" v-model="M_CM_Portfolio.maxloginfailedattempt"  ref="ref_maxloginfailedattempt"/>
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
            FormType: "Form",
			Module:"CM",

            M_CM_Portfolio :{
                portfoliocd: this.getDataUser().portfolio_cd,
                name: '',
                referenceno: '',
                baseontaxhandling: '',
                address1: '',
                address2: '',
                address3: '',
                address4: '',
                referencefilename: '',
                picturefilename: '',
                citycd: '',
                citydescs: '',
                city: '',
                zipcode: '',
                phoneno: '',
                faxno: '',
                website: '',
                sirnextno: 0,
                sirprefix: '',
                cbuniquepaymentno: '',
                remarks: '',
                lastupdatestamp: 0,
                userinput: '',
                useredit: this.getDataUser().user_id,
                minpasswordlength: '0',
                maxpasswordlive: '0',
                passwordstrength: '',
                maxloginfailedattempt: '0',
                roundingfactor: 0,
                rowid: 0
                    }
            ,			
            IEBy: {Input: '', Edit: ''},
            PI_portfoliocd: { 
                cValidate :'required|max:2', 
                cName: 'portfoliocd', 
                cLabel: 'Portfolio Code', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_name: { 
                cValidate :'required|max:50', 
                cName: 'name', 
                cLabel: 'Name', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_referenceno: { 
                cValidate :'', 
                cName: 'referenceno', 
                cLabel: 'Reference No', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_address1: { 
                cValidate :'required|max:50', 
                cName: 'address1', 
                cLabel: 'Address', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_address2: { 
                cValidate :'', 
                cName: 'address2', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_address3: { 
                cValidate :'', 
                cName: 'address3', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_address4: { 
                cValidate :'', 
                cName: 'address4', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_zipcode: { 
                cValidate :'', 
                cName: 'zipcode', 
                cLabel: 'Zip Code', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_citycd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMCity'    , 
                    ColumnDB: 'city_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'citycd', 
                cLabel: 'City', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 0, 
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
                cMasterUrl: 'CM/CM_CountryCity' ,
                cDisplayColumn: 'city_cd,descs' ,
            }, 
            PI_citydescs: { 
                cLabel: '', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_website: { 
                cValidate :'', 
                cName: 'website', 
                cLabel: 'Website', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_phoneno: { 
                cValidate :'', 
                cName: 'phoneno', 
                cLabel: 'Telephone', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_faxno: { 
                cValidate :'', 
                cName: 'faxno', 
                cLabel: 'Fax', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_sirprefix: { 
                cValidate :'', 
                cName: 'sirprefix', 
                cLabel: 'SIR Prefix', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_cbuniquepaymentno: { 
                cValidate :'', 
                cName: 'cbuniquepaymentno', 
                cId: 'rdbcbuniquepaymentno', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' },{ text: 'No', value: 'N' },], 
                cRadioDefaultOption: '', 
                cLabel:'Cash Book Unique Payment No', 
                cLabelSize: 4, 
                cOrder: 0, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_xxx8325: { 
                cValidate :'', 
                cName: 'xxx8325', 
                cId: 'rdbxxx8325', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' },{ text: 'No', value: 'N' },, { text: 'Portfolio', value: 'P' }, { text: 'Subportfolio', value: 'S' }], 
                cRadioDefaultOption: '', 
                cLabel:'', 
                cLabelSize: 4, 
                cOrder: 0, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Remarks', 
                cLabelSize: 4, 
                cOrder:0, 
                cKey: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible: true, 
                cResize: false, 
                cReadOnly: false, 
                cRows: 3, 
                cMaxRows: 3, 
                cSize: 'md', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
            }, 
            PI_referencefilename: { 
                cLabel: 'Picture File', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_xxx8349: { 
                cLabel: 'DB Connection String (encrypted)', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_minpasswordlength: { 
                cValidate :'required|max:10', 
                cName: 'minpasswordlength', 
                cLabel: 'Minimum Password Length', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_maxpasswordlive: { 
                cValidate :'required|max:10', 
                cName: 'maxpasswordlive', 
                cLabel: 'Maximum Password Live', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_passwordstrength: { 
                cValidate :'', 
                cName: 'passwordstrength', 
                cId: 'rdbpasswordstrength', 
                cRadioOptions: [{ text: 'No control', value: 'N' },{ text: 'Combination Alpha Numeric', value: 'A' },], 
                cRadioDefaultOption: '', 
                cLabel:'Password Strength', 
                cLabelSize: 4, 
                cOrder: 0, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_maxloginfailedattempt: { 
                cValidate :'required|max:10', 
                cName: 'maxloginfailedattempt', 
                cLabel: 'Max Login Failed Attempt', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'numeric',
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
        OnportfoliocdChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{portfoliocd}
            }
        })
        this.$forceUpdate()
        },
        OnnameChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{name}
            }
        })
        this.$forceUpdate()
        },
        OnreferencenoChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{referenceno}
            }
        })
        this.$forceUpdate()
        },
        Onaddress1Change (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{address1}
            }
        })
        this.$forceUpdate()
        },
        Onaddress2Change (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{address2}
            }
        })
        this.$forceUpdate()
        },
        Onaddress3Change (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{address3}
            }
        })
        this.$forceUpdate()
        },
        Onaddress4Change (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{address4}
            }
        })
        this.$forceUpdate()
        },
        OnzipcodeChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{zipcode}
            }
        })
        this.$forceUpdate()
        },
        OncitycdChange (data) {
        this.$nextTick(() => {
            this.M_CM_Portfolio.citycd = data.id
            this.M_CM_Portfolio.citycdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{citycd}
            }
        })
        this.$forceUpdate()
        },
        OnwebsiteChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{website}
            }
        })
        this.$forceUpdate()
        },
        OnphonenoChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{phoneno}
            }
        })
        this.$forceUpdate()
        },
        OnfaxnoChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{faxno}
            }
        })
        this.$forceUpdate()
        },
        OnsirprefixChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{sirprefix}
            }
        })
        this.$forceUpdate()
        },
        OncbuniquepaymentnoChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{cbuniquepaymentno}
            }
        })
        this.$forceUpdate()
        },
        Onxxx8325Change (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{xxx8325}
            }
        })
        this.$forceUpdate()
        },
        OnremarksChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{remarks}
            }
        })
        this.$forceUpdate()
        },
        OnminpasswordlengthChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{minpasswordlength}
            }
        })
        this.$forceUpdate()
        },
        OnmaxpasswordliveChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{maxpasswordlive}
            }
        })
        this.$forceUpdate()
        },
        OnpasswordstrengthChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{passwordstrength}
            }
        })
        this.$forceUpdate()
        },
        OnmaxloginfailedattemptChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{maxloginfailedattempt}
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
        M_Post(){
        },
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                portfolio_cd: this.getDataUser().portfolio_cd ,
                name: this.M_CM_Portfolio.name,
                reference_no: this.M_CM_Portfolio.referenceno,
                address1: this.M_CM_Portfolio.address1,
                address2: this.M_CM_Portfolio.address2,
                address3: this.M_CM_Portfolio.address3,
                base_on_tax_handling: this.M_CM_Portfolio.baseontaxhandling,
                address4: this.M_CM_Portfolio.address4,
                city_cd: this.M_CM_Portfolio.citycd == '' || this.M_CM_Portfolio.citycd == null ? 'NULL' : this.M_CM_Portfolio.citycd ,
                zip_code: this.M_CM_Portfolio.zipcode,
                phone_no: this.M_CM_Portfolio.phoneno,
                fax_no: this.M_CM_Portfolio.faxno,
                website: this.M_CM_Portfolio.website,
                remarks: this.M_CM_Portfolio.remarks,
                picture_file_name: this.M_CM_Portfolio.picturefilename,
                reference_file_name: this.M_CM_Portfolio.referencefilename,
                user_input: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CM_Portfolio.lastupdatestamp,
                min_password_length: this.M_CM_Portfolio.minpasswordlength,
                max_password_live: this.M_CM_Portfolio.maxpasswordlive,
                password_strength: this.M_CM_Portfolio.passwordstrength,
                max_login_failed_attempt: this.M_CM_Portfolio.maxloginfailedattempt                
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
                
                this.alertSuccess(response.Message)
                .then(() => {
                    this.getToolbar().FormStatus = 'EDIT'
                    this.getToolbar().ProcessPS()
                    this.$store.commit('setStatus', 'view')
					this.$store.commit('setEventStatus', 'Save')

                    this.FormToMasterPage().ValidasiPage()
										
					
                })
            })
        },
        M_Update() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                portfolio_cd: this.getDataUser().portfolio_cd ,
                name: this.M_CM_Portfolio.name,
                reference_no: this.M_CM_Portfolio.referenceno,
                address1: this.M_CM_Portfolio.address1,
                address2: this.M_CM_Portfolio.address2,
                address3: this.M_CM_Portfolio.address3,
                address4: this.M_CM_Portfolio.address4,
                base_on_tax_handling: this.M_CM_Portfolio.baseontaxhandling,
                city_cd: this.M_CM_Portfolio.citycd == '' || this.M_CM_Portfolio.citycd == null ? 'NULL' : this.M_CM_Portfolio.citycd ,
                zip_code: this.M_CM_Portfolio.zipcode,
                phone_no: this.M_CM_Portfolio.phoneno,
                fax_no: this.M_CM_Portfolio.faxno,
                website: this.M_CM_Portfolio.website,
                sir_prefix: this.M_CM_Portfolio.sirprefix,
                cb_unique_payment_no: this.M_CM_Portfolio.cbuniquepaymentno,
                remarks: this.M_CM_Portfolio.remarks,
                picture_file_name: this.M_CM_Portfolio.picturefilename,
                reference_file_name: this.M_CM_Portfolio.referencefilename,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CM_Portfolio.lastupdatestamp,
                min_password_length: this.M_CM_Portfolio.minpasswordlength,
                max_password_live: this.M_CM_Portfolio.maxpasswordlive,
                password_strength: this.M_CM_Portfolio.passwordstrength,
                max_login_failed_attempt: this.M_CM_Portfolio.maxloginfailedattempt                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                this.alertSuccess(response.Message)
                .then(() => {
                    this.getToolbar().setButton(false)
                    this.$store.commit('setStatus', 'view')

                    this.FormToMasterPage().ValidasiPage()
					
                })
            })
        },
		M_ClearForm(){
            this.M_CM_Portfolio = {
                portfoliocd: this.getDataUser().portfolio_cd,
                name: '',
                referenceno: '',
                baseontaxhandling: '',
                address1: '',
                address2: '',
                address3: '',
                address4: '',
                referencefilename: '',
                picturefilename: '',
                citycd: '',
                citydescs: '',
                city: '',
                zipcode: '',
                phoneno: '',
                faxno: '',
                website: '',
                sirnextno: 0,
                sirprefix: '',
                cbuniquepaymentno: '',
                remarks: '',
                lastupdatestamp: 0,
                userinput: '',
                useredit: this.getDataUser().user_id,
                minpasswordlength: '0',
                maxpasswordlive: '0',
                passwordstrength: '',
                maxloginfailedattempt: '0',
                roundingfactor: 0,
                rowid: 0
                    }
            		
		},
        M_New(){
			
        },
        M_Edit(){
        },
        M_Delete(dt){       

            var data = this.FormToABSList().getRowSelected()
            var dataDelete = []

            data.forEach((value) => {
                dataDelete.push({
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
                  if(response.Data.length > 0){
                  // this.$store.commit('setStatus', 'EDIT')
                  this.getToolbar().FormStatus = 'EDIT'
                  this.getToolbar().ProcessPS()
this.M_CM_Portfolio = {
                portfoliocd: data.portfolio_cd,
                name: data.name,
                referenceno: data.reference_no,
                baseontaxhandling: data.base_on_tax_handling,
                address1: data.address1,
                address2: data.address2,
                address3: data.address3,
                address4: data.address4,
                referencefilename: data.reference_file_name,
                picturefilename: data.picture_file_name,
                citycd: data.city_cd,
                citycdLabel: data.city_cd && data.city_cd != '' ? data.city_cd + this.separator + data.city_descs : '',
                citydescs: data.city_descs,
                city: data.city,
                zipcode: data.zip_code,
                phoneno: data.phone_no,
                faxno: data.fax_no,
                website: data.website,
                sirnextno: data.sir_next_no,
                sirprefix: data.sir_prefix,
                cbuniquepaymentno: data.cb_unique_payment_no,
                remarks: data.remarks,
                lastupdatestamp: data.lastupdatestamp,
                userinput: data.user_input,
                useredit: data.user_edit,
                minpasswordlength: data.min_password_length,
                maxpasswordlive: data.max_password_live,
                passwordstrength: data.password_strength,
                maxloginfailedattempt: data.max_login_failed_attempt,
                roundingfactor: data.rounding_factor,
                rowid: data.row_id
                    }
                 

         

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit
                }
                else {
                    // this.$store.commit('setStatus', 'NEW')
                    this.getToolbar().FormStatus = 'NEW'
                    this.getToolbar().ProcessPS()
                }

            })
        }
		
    },
    beforeCreate: function () {
    },
    created: function() {
        this.$store.commit('setFormType','Form')
        // this.isDetail = true
    },
    beforeMount: function() {
    },
    mounted: function() {
        this.getDataBy()
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
