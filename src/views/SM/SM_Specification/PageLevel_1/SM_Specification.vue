<template>
    <div>
        <div :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
            <div class="div-collapse" v-b-toggle.collapse1>
                <span>
                <span style="float:Left; color: #81b3e9 !important;letter-spacing: 1px;margin-top: 2px;margin-left: 3px" >
                    Sales Specification <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                </span>
                <span class="master-span" v-show="IEBy.Input && IEBy.Edit">
                    Input By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}} <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                </span>
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
                                        <ABSInputSelectList @change="OncurrencycdChange" :prop="PI_currencycd" :value="M_SM_Specification.currencycd" :label="M_SM_Specification.currencycdLabel" ref="ref_currencycd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnroundingtypeChange" :prop="PI_roundingtype" v-model="M_SM_Specification.roundingtype"  ref="ref_roundingtype" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnroundingfactorChange" :prop="PI_roundingfactor" v-model="M_SM_Specification.roundingfactor"  ref="ref_roundingfactor" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnorderrunningcdChange" :prop="PI_orderrunningcd" :value="M_SM_Specification.orderrunningcd" :label="M_SM_Specification.orderrunningcdLabel" ref="ref_orderrunningcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnordercancellationrunningcdChange" :prop="PI_ordercancellationrunningcd" :value="M_SM_Specification.ordercancellationrunningcd" :label="M_SM_Specification.ordercancellationrunningcdLabel" ref="ref_ordercancellationrunningcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnsnprunningcdChange" :prop="PI_snprunningcd" :value="M_SM_Specification.snprunningcd" :label="M_SM_Specification.snprunningcdLabel" ref="ref_snprunningcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnreservationrunningcdChange" :prop="PI_reservationrunningcd" :value="M_SM_Specification.reservationrunningcd" :label="M_SM_Specification.reservationrunningcdLabel" ref="ref_reservationrunningcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnvorunningcdChange" :prop="PI_vorunningcd" :value="M_SM_Specification.vorunningcd" :label="M_SM_Specification.vorunningcdLabel" ref="ref_vorunningcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnvisitorregistrationrunningcdChange" :prop="PI_visitorregistrationrunningcd" :value="M_SM_Specification.visitorregistrationrunningcd" :label="M_SM_Specification.visitorregistrationrunningcdLabel" ref="ref_visitorregistrationrunningcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnauctionrunningcdChange" :prop="PI_auctionrunningcd" :value="M_SM_Specification.auctionrunningcd" :label="M_SM_Specification.auctionrunningcdLabel" ref="ref_auctionrunningcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncredittermscdChange" :prop="PI_credittermscd" :value="M_SM_Specification.credittermscd" :label="M_SM_Specification.credittermscdLabel" ref="ref_credittermscd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncommisionrunningcdChange" :prop="PI_commisionrunningcd" :value="M_SM_Specification.commisionrunningcd" :label="M_SM_Specification.commisionrunningcdLabel" ref="ref_commisionrunningcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnsalesaddendumrunningcdChange" :prop="PI_salesaddendumrunningcd" :value="M_SM_Specification.salesaddendumrunningcd" :label="M_SM_Specification.salesaddendumrunningcdLabel" ref="ref_salesaddendumrunningcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnsalesaddendumcancellationrunningcdChange" :prop="PI_salesaddendumcancellationrunningcd" :value="M_SM_Specification.salesaddendumcancellationrunningcd" :label="M_SM_Specification.salesaddendumcancellationrunningcdLabel" ref="ref_salesaddendumcancellationrunningcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncreditnotesrunningcdChange" :prop="PI_creditnotesrunningcd" :value="M_SM_Specification.creditnotesrunningcd" :label="M_SM_Specification.creditnotesrunningcdLabel" ref="ref_creditnotesrunningcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnsalesorrunningcdChange" :prop="PI_salesorrunningcd" :value="M_SM_Specification.salesorrunningcd" :label="M_SM_Specification.salesorrunningcdLabel" ref="ref_salesorrunningcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OncommisionbasedChange" :prop="PI_commisionbased" v-model="M_SM_Specification.commisionbased"  ref="ref_commisionbased" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OncommissionpaymentChange" :prop="PI_commissionpayment" v-model="M_SM_Specification.commissionpayment"  ref="ref_commissionpayment" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OntaxjournalstatusChange" :prop="PI_taxjournalstatus" v-model="M_SM_Specification.taxjournalstatus"  ref="ref_taxjournalstatus" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OngeneratecontractschedulebasedonChange" :prop="PI_generatecontractschedulebasedon" v-model="M_SM_Specification.generatecontractschedulebasedon"  ref="ref_generatecontractschedulebasedon" />
                                      </b-col>
                                    </b-row>
                                    <div class="div-collapse">
                                        <span class="master-span-form">
                                            Mobile Sales
                                        </span>
                                    </div>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnvisitorcheckoutChange" :prop="PI_visitorcheckout" v-model="M_SM_Specification.visitorcheckout"  ref="ref_visitorcheckout" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_bookingcancelationtime" v-model="M_SM_Specification.bookingcancelationtime"  ref="ref_bookingcancelationtime" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_mobileauctiontokenamt" v-model="M_SM_Specification.mobileauctiontokenamt"  ref="ref_mobileauctiontokenamt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @change="OnbookbytokenChange" :prop="PI_bookbytoken" v-model="M_SM_Specification.bookbytoken"  ref="ref_bookbytoken" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @change="OnmobileauctiontokenmethodChange" :prop="PI_mobileauctiontokenmethod" v-model="M_SM_Specification.mobileauctiontokenmethod"  ref="ref_mobileauctiontokenmethod" />
                                      </b-col>
                                    </b-row>
                                    <div class="div-collapse">
                                        <span class="master-span-form">
                                            Mobile Default Auto Deposit
                                        </span>
                                    </div>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OntrxtypeChange" :prop="PI_trxtype" :value="M_SM_Specification.trxtype" :label="M_SM_Specification.trxtypeLabel" ref="ref_trxtype"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnpaymentcdChange" :prop="PI_paymentcd" :value="M_SM_Specification.paymentcd" :label="M_SM_Specification.paymentcdLabel" ref="ref_paymentcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnbankcdChange" :prop="PI_bankcd" :value="M_SM_Specification.bankcd" :label="M_SM_Specification.bankcdLabel" ref="ref_bankcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_bankchargesamt" v-model="M_SM_Specification.bankchargesamt"  ref="ref_bankchargesamt"/>
                                      </b-col>
                                    </b-row>
                                    <div class="div-collapse">
                                        <span class="master-span-form">
                                            Sales Recognition
                                        </span>
                                    </div>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnglsalesrecognitiontrxtypeChange" :prop="PI_glsalesrecognitiontrxtype" :value="M_SM_Specification.glsalesrecognitiontrxtype" :label="M_SM_Specification.glsalesrecognitiontrxtypeLabel" ref="ref_glsalesrecognitiontrxtype"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_collectionrecognition" v-model="M_SM_Specification.collectionrecognition"  ref="ref_collectionrecognition"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_recognizedpercentage" v-model="M_SM_Specification.recognizedpercentage"  ref="ref_recognizedpercentage"/>
                                      </b-col>
                                    </b-row>
                                    <div class="div-collapse">
                                        <span class="master-span-form">
                                            Penalty
                                        </span>
                                    </div>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnpenaltytrxtypeChange" :prop="PI_penaltytrxtype" :value="M_SM_Specification.penaltytrxtype" :label="M_SM_Specification.penaltytrxtypeLabel" ref="ref_penaltytrxtype"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnpenaltytaxcdChange" :prop="PI_penaltytaxcd" :value="M_SM_Specification.penaltytaxcd" :label="M_SM_Specification.penaltytaxcdLabel" ref="ref_penaltytaxcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_developerpenaltycalculatepercentage" v-model="M_SM_Specification.developerpenaltycalculatepercentage"  ref="ref_developerpenaltycalculatepercentage"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_handoverdays" v-model="M_SM_Specification.handoverdays"  ref="ref_handoverdays"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OncustomerpenaltyfromChange" :prop="PI_customerpenaltyfrom" v-model="M_SM_Specification.customerpenaltyfrom"  ref="ref_customerpenaltyfrom" />
                                      </b-col>
                                    </b-row>
                                    <div class="div-collapse">
                                        <span class="master-span-form">
                                            Sales Termination
                                        </span>
                                    </div>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnglsalesterminationtrxtypeChange" :prop="PI_glsalesterminationtrxtype" :value="M_SM_Specification.glsalesterminationtrxtype" :label="M_SM_Specification.glsalesterminationtrxtypeLabel" ref="ref_glsalesterminationtrxtype"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_nonrefundablepaymentlimit" v-model="M_SM_Specification.nonrefundablepaymentlimit"  ref="ref_nonrefundablepaymentlimit"/>
                                      </b-col>
                                    </b-row>
                                    <div class="div-collapse">
                                        <span class="master-span-form">
                                            Sales Hand Over
                                        </span>
                                    </div>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_mincollectionhandoverpercentage" v-model="M_SM_Specification.mincollectionhandoverpercentage"  ref="ref_mincollectionhandoverpercentage"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_minhandoverprogresspercentage" v-model="M_SM_Specification.minhandoverprogresspercentage"  ref="ref_minhandoverprogresspercentage"/>
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

            M_SM_Specification :{
                  auctionrunningcd: '',
                  auctionrunningcddescs: '',
                  bankcd: '',
                  bankchargesamt: '',
                  bankname: '',
                  bookbytoken: '',
                  bookingcancelationtime: '',
                  collectionrecognition: '',
                  commisionbased: '',
                  commisionrunningcd: '',
                  commisionrunningcddescs: '',
                  commissionpayment: '',
                  creditnotesrunningcd: '',
                  creditnotesrunningcddescs: '',
                  credittermscd: '',
                  credittermsdescs: '',
                  currencycd: '',
                  currencydescs: '',
                  customerpenaltyfrom: '',
                  developerpenaltycalculatepercentage: '',
                  generatecontractschedulebasedon: '',
                  glmodulecd: '',
                  glsalesrecognitiontrxtype: '',
                  glsalesrecognitiontrxtypedescs: '',
                  glsalesterminationtrxtype: '',
                  glsalesterminationtrxtypedescs: '',
                  handoverdays: '',
                  lastupdatestamp: '',
                  mincollectionhandoverpercentage: '',
                  minhandoverprogresspercentage: '',
                  mobileauctionpicking: '',
                  mobileauctiontokenamt: '',
                  mobileauctiontokenmethod: '',
                  nonrefundablepaymentlimit: '',
                  ordercancellationrunningcd: '',
                  ordercancellationrunningdescs: '',
                  orderrunningcd: '',
                  orderrunningdescs: '',
                  paymentcd: '',
                  paymentdescs: '',
                  penaltymodulecd: '',
                  penaltytaxcd: '',
                  penaltytaxdescs: '',
                  penaltytrxtype: '',
                  penaltytrxtypedescs: '',
                  recognizedpercentage: '',
                  reservationrunningcd: '',
                  reservationrunningdescs: '',
                  roundingfactor: '',
                  roundingtype: '',
                  salesaddendumcancellationrunningcd: '',
                  salesaddendumcancellationrunningcddescs: '',
                  salesaddendumrunningcd: '',
                  salesaddendumrunningcddescs: '',
                  salesorrunningcd: '',
                  salesorrunningcddescs: '',
                  snprunningcd: '',
                  snprunningdescs: '',
                  subportfoliocd: '',
                  taxjournalstatus: '',
                  trxtype: '',
                  trxtypedescs: '',
                  unitsales: '',
                  useredit: this.getDataUser().user_id,
                  userinput: '',
                  visitorcheckout: '',
                  visitorregistrationrunningcd: '',
                  visitorregistrationrunningcddescs: '',
                  vorunningcd: '',
                  vorunningdescs: '',
                  lastupdatestamp: 0,
                  rowid: 0
                    }
            ,					
            PI_currencycd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMCurrency'    , 
                    ColumnDB: 'CurrencyCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'CurrencyCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'currencycd', 
                cLabel: 'Currency Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 1, 
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
                cMasterUrl: 'CM/CM_RunningCd' ,
                cDisplayColumn: 'CurrencyCd,Descs' ,
            }, 
            PI_roundingtype: { 
                cValidate :'', 
                cName: 'roundingtype', 
                cId: 'rdbroundingtype', 
                cRadioOptions: [{ text: 'Up', value: 'U' },{ text: 'Down', value: 'D' },{ text: 'None', value: 'N' },], 
                cRadioDefaultOption: '', 
                cLabel:'Rounding Type', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 2, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_roundingfactor: { 
                cValidate :'', 
                cName: 'roundingfactor', 
                cId: 'rdbroundingfactor', 
                cRadioOptions: [{ text: 'Ten', value: 'T' },{ text: 'Hundred', value: 'H' },{ text: 'Thousand', value: 'O' },], 
                cRadioDefaultOption: '', 
                cLabel:'Rounding Factor', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 3, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_orderrunningcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'RunningCd'   , 
                    InitialWhere: "(ModuleCd is null OR ModuleCd = 'SM')"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'RunningCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'orderrunningcd', 
                cLabel: 'Order Running Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 4, 
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
                cMasterUrl: 'CM/CM_RunningCd' ,
                cDisplayColumn: 'RunningCd,Descs' ,
            }, 
            PI_ordercancellationrunningcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'RunningCd'   , 
                    InitialWhere: "(ModuleCd is null OR ModuleCd = 'SM')"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'RunningCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'ordercancellationrunningcd', 
                cLabel: 'Order Cancellation Running Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 5, 
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
                cMasterUrl: 'CM/CM_RunningCd' ,
                cDisplayColumn: 'RunningCd,Descs' ,
            }, 
            PI_snprunningcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'RunningCd'   , 
                    InitialWhere: "(ModuleCd is null OR ModuleCd = 'SM')"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'RunningCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'snprunningcd', 
                cLabel: 'SnP Running Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 6, 
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
                cMasterUrl: 'CM/CM_RunningCd' ,
                cDisplayColumn: 'RunningCd,Descs' ,
            }, 
            PI_reservationrunningcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'RunningCd'   , 
                    InitialWhere: "(ModuleCd is null OR ModuleCd = 'SM')"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'RunningCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'reservationrunningcd', 
                cLabel: 'Reservation Running Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 7, 
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
                cMasterUrl: 'CM/CM_RunningCd' ,
                cDisplayColumn: 'RunningCd,Descs' ,
            }, 
            PI_vorunningcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'RunningCd'   , 
                    InitialWhere: "(ModuleCd is null OR ModuleCd = 'SM')"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'RunningCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'vorunningcd', 
                cLabel: 'VO Running Code', 
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
                cMasterUrl: 'CM/CM_RunningCd' ,
                cDisplayColumn: 'RunningCd,Descs' ,
            }, 
            PI_visitorregistrationrunningcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'RunningCd'   , 
                    InitialWhere: "(ModuleCd is null OR ModuleCd = 'SM')"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'RunningCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'visitorregistrationrunningcd', 
                cLabel: 'Visitor Registration Running Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 9, 
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
                cMasterUrl: 'CM/CM_RunningCd' ,
                cDisplayColumn: 'RunningCd,Descs' ,
            }, 
            PI_auctionrunningcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'RunningCd'   , 
                    InitialWhere: "(ModuleCd is null OR ModuleCd = 'SM')"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'RunningCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'auctionrunningcd', 
                cLabel: 'Auction Running Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 10, 
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
                cMasterUrl: 'CM/CM_RunningCd' ,
                cDisplayColumn: 'RunningCd,Descs' ,
            }, 
            PI_credittermscd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMCreditTerms'    , 
                    ColumnDB: 'CreditTermsCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'CreditTermsCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'credittermscd', 
                cLabel: 'Credit Terms Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 11, 
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
                cMasterUrl: 'CM/CM_CreditTerms' ,
                cDisplayColumn: 'CreditTermsCd,Descs' ,
            }, 
            PI_commisionrunningcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'RunningCd'   , 
                    InitialWhere: "(ModuleCd is null OR ModuleCd = 'SM')"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'RunningCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'commisionrunningcd', 
                cLabel: 'Commision Running Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 12, 
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
                cMasterUrl: 'CM/CM_RunningCd' ,
                cDisplayColumn: 'RunningCd,Descs' ,
            }, 
            PI_salesaddendumrunningcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'RunningCd'   , 
                    InitialWhere: "(ModuleCd is null OR ModuleCd = 'SM')"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'RunningCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'salesaddendumrunningcd', 
                cLabel: 'Sales Addendum Running Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 13, 
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
                cMasterUrl: 'CM/CM_RunningCd' ,
                cDisplayColumn: 'RunningCd,Descs' ,
            }, 
            PI_salesaddendumcancellationrunningcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'RunningCd'   , 
                    InitialWhere: "(ModuleCd is null OR ModuleCd = 'SM')"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'RunningCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'salesaddendumcancellationrunningcd', 
                cLabel: 'Sales Addendum Cancellation Running Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 14, 
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
                cMasterUrl: 'CM/CM_RunningCd' ,
                cDisplayColumn: 'RunningCd,Descs' ,
            }, 
            PI_creditnotesrunningcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'RunningCd'   , 
                    InitialWhere: "(ModuleCd is null OR ModuleCd = 'SM')"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'RunningCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'creditnotesrunningcd', 
                cLabel: 'Credit Notes Running Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 15, 
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
                cMasterUrl: 'CM/CM_RunningCd' ,
                cDisplayColumn: 'RunningCd,Descs' ,
            }, 
            PI_salesorrunningcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMRunningCode'    , 
                    ColumnDB: 'RunningCd'   , 
                    InitialWhere: "(ModuleCd is null OR ModuleCd = 'SM')"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'RunningCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'salesorrunningcd', 
                cLabel: 'Sales OR Running Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 16, 
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
                cMasterUrl: 'CM/CM_RunningCd' ,
                cDisplayColumn: 'RunningCd,Descs' ,
            }, 
            PI_commisionbased: { 
                cValidate :'', 
                cName: 'commisionbased', 
                cId: 'rdbcommisionbased', 
                cRadioOptions: [{ text: 'Order Date', value: 'O' },{ text: 'SnP Date', value: 'S' },], 
                cRadioDefaultOption: '', 
                cLabel:'Commission Based', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 17, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_commissionpayment: { 
                cValidate :'', 
                cName: 'commissionpayment', 
                cId: 'rdbcommissionpayment', 
                cRadioOptions: [{ text: 'Direct', value: 'D' },{ text: 'Indirect', value: 'I' },], 
                cRadioDefaultOption: '', 
                cLabel:'Commission Payment', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 18, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_taxjournalstatus: { 
                cValidate :'', 
                cName: 'taxjournalstatus', 
                cId: 'rdbtaxjournalstatus', 
                cRadioOptions: [{ text: 'Receipt/Allocation', value: 'A' },{ text: 'Sales Recognition', value: 'R' },{ text: 'Combine', value: 'C' },], 
                cRadioDefaultOption: '', 
                cLabel:'Tax Journal On', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 19, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_generatecontractschedulebasedon: { 
                cValidate :'', 
                cName: 'generatecontractschedulebasedon', 
                cId: 'rdbgeneratecontractschedulebasedon', 
                cRadioOptions: [{ text: 'Manual (MC)', value: 'M' },{ text: 'Automatically', value: 'A' },], 
                cRadioDefaultOption: '', 
                cLabel:'Generate Contract Schedule Based on', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 20, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_visitorcheckout: { 
                cValidate :'', 
                cName: 'visitorcheckout', 
                cId: 'rdbvisitorcheckout', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' },{ text: 'No', value: 'N' },], 
                cRadioDefaultOption: '', 
                cLabel:'Visitor Check Out', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 21, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_bookingcancelationtime: { 
              cValidate :'', 
                cName: 'bookingcancelationtime', 
                cLabel: 'Booking Cancelation Time', 
                cLabelSize: 4, 
                cOrder: 24, 
                cLastLabel: 'Hour',
                cType: 'decimal',
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_mobileauctiontokenamt: { 
                cValidate :'', 
                cName: 'mobileauctiontokenamt', 
                cLabel: 'Mobile Auction Token Amount', 
                cLabelSize: 4, 
                cOrder: 23, 
                cKey: false, 
                cLastLabel: '%',
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_bookbytoken: { 
                cValidate :'', 
                cName: 'bookbytoken', 
                cId: 'rdbbookbytoken', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' },{ text: 'No', value: 'N' },], 
                cRadioDefaultOption: '', 
                cLabel:'Book By Token', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 24, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_mobileauctiontokenmethod: { 
                cValidate :'', 
                cName: 'mobileauctiontokenmethod', 
                cId: 'rdbmobileauctiontokenmethod', 
                cRadioOptions: [{ text: 'Direct', value: 'D' },{ text: 'Indirect', value: 'I' },], 
                cRadioDefaultOption: '', 
                cLabel:'Mobile Auction Token Method', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 25, 
                cKey: false,
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_trxtype: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTransTypeBySubPortfolio'    , 
                    ColumnDB: 'TrxType', 
                    InitialWhere: "SubPortfolioCd = '"+this.getDataUser().subportfolio_cd+"' AND ModuleCd = 'CB' AND TrxClass = 'T'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'TransactionType,Descs' 
                        }, 
                cValidate :'', 
                cName: 'trxtype', 
                cLabel: 'Trans. Type', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 26, 
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
                cDisplayColumn: 'TransactionType,Descs' ,
            }, 
            PI_paymentcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMPaymentType'    , 
                    ColumnDB: 'PaymentCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'PaymentCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'paymentcd', 
                cLabel: 'Payment Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 27, 
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
                cMasterUrl: 'CM/CM_PaymentType' ,
                cDisplayColumn: 'PaymentCd,Descs' ,
            }, 
            PI_bankcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCBBank'    , 
                    ColumnDB: 'BankCd'   , 
                    InitialWhere: "SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"' And STATUS = 'A'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'BankCd,ContactId,BankName,BankAccountNo,Currency,TimeEdit' 
                        }, 
                cValidate :'', 
                cName: 'bankcd', 
                cLabel: 'Bank', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 29, 
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
                cDisplayColumn: 'BankCd,ContactId,BankName,BankAccountNo,Currency,TimeEdit' ,
            }, 
            PI_bankchargesamt: { 
                cValidate :'', 
                cName: 'bankchargesamt', 
                cLabel: 'Bank Charges Amount', 
                cLabelSize: 4, 
                cOrder: 30, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_glsalesrecognitiontrxtype: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTransTypeMaster'    , 
                    ColumnDB: 'TrxType'   , 
                    InitialWhere: "ModuleCd='GL' and RunningCd is not null"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'TransactionType,Descs' 
                        }, 
                cValidate :'', 
                cName: 'glsalesrecognitiontrxtype', 
                cLabel: 'GL Trans. Type', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 31, 
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
                cMasterUrl: 'GL/GL_TransactionType' ,
                cDisplayColumn: 'TransactionType,Descs' ,
            }, 
            PI_collectionrecognition: { 
                cValidate :'max_value:100.00', 
                cName: 'collectionrecognition', 
                cLabel: 'Collection Recognition', 
                cLabelSize: 4, 
                cOrder: 32, 
                cKey: false, 
                cLastLabel: '%',
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_recognizedpercentage: { 
                cValidate :'max_value:100.00', 
                cName: 'recognizedpercentage', 
                cLabel: 'Recognized Percentage', 
                cLabelSize: 4, 
                cOrder: 33, 
                cKey: true, 
                cLastLabel: '%',
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_penaltytrxtype: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTransTypeMaster'    , 
                    ColumnDB: 'TrxType'   , 
                    InitialWhere: "ModuleCd='SM' and RunningCd is not null"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'TransactionType,Descs' 
                        }, 
                cValidate :'', 
                cName: 'penaltytrxtype', 
                cLabel: 'Penalty Trans. Type', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 34, 
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
                cMasterUrl: 'SM/SM_TransactionTypeMaster' ,
                cDisplayColumn: 'TransactionType,Descs' ,
            }, 
            PI_penaltytaxcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTaxCode'    , 
                    ColumnDB: 'TaxCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'TaxCd, Descs' 
                        }, 
                cValidate :'', 
                cName: 'penaltytaxcd', 
                cLabel: 'Penalty Tax Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 35, 
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
                cMasterUrl: 'CM/CM_TaxMaster' ,
                cDisplayColumn: 'TaxCd, Descs' ,
            }, 
            PI_developerpenaltycalculatepercentage: { 
                cValidate :'max_value:100.00', 
                cName: 'developerpenaltycalculatepercentage', 
                cLabel: 'Developer Penalty Calculate Percentage', 
                cLabelSize: 4, 
                cOrder: 36, 
                cKey: false, 
                cLastLabel: '%',
                cType: 'decimal',
                  cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_handoverdays: { 
                cValidate :'', 
                cName: 'handoverdays', 
                cLabel: 'Hand Over Days', 
                cLabelSize: 4, 
                cOrder: 37, 
                cKey: false, 
                cLastLabel: 'Days',
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_customerpenaltyfrom: { 
                cValidate :'', 
                cName: 'customerpenaltyfrom', 
                cId: 'rdbcustomerpenaltyfrom', 
                cRadioOptions: [{ text: 'Due Date', value: 'D' },{ text: 'Due Date + Grace Period', value: 'G' },], 
                cRadioDefaultOption: '', 
                cLabel:'Customer Penalty From', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 38, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_glsalesterminationtrxtype: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTransTypeMaster'    , 
                    ColumnDB: 'TrxType'   , 
                    InitialWhere: "ModuleCd='GL' and RunningCd is not null"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'TransactionType,Descs' 
                        }, 
                cValidate :'', 
                cName: 'glsalesterminationtrxtype', 
                cLabel: 'GL Trans. Type', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 39, 
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
                cMasterUrl: 'GL/GL_TransactionType' ,
                cDisplayColumn: 'TransactionType,Descs' ,
            }, 
            PI_nonrefundablepaymentlimit: { 
                cValidate :'max_value:100.00', 
                cName: 'nonrefundablepaymentlimit', 
                cLabel: 'No Refundable Payment Limit', 
                cLabelSize: 4, 
                cOrder: 40, 
                cKey: false, 
                cLastLabel: '%',
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_mincollectionhandoverpercentage: { 
                cValidate :'max_value:100.00', 
                cName: 'mincollectionhandoverpercentage', 
                cLabel: 'Min. Collection Hand Over Percentage', 
                cLabelSize: 4, 
                cOrder: 41, 
                cKey: false, 
                cLastLabel: '%',
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_minhandoverprogresspercentage: { 
                cValidate :'max_value:100.00', 
                cName: 'minhandoverprogresspercentage', 
                cLabel: 'Min. Hand Over Progress Percentage', 
                cLabelSize: 4, 
                cOrder: 42, 
                cKey: false, 
                cLastLabel: '%',
                cType: 'decimal',
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
        OncurrencycdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Specification.currencycd = data.id
            this.M_SM_Specification.currencycdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{currencycd}
            }
        })
        this.$forceUpdate()
        },
        OnroundingtypeChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{roundingtype}
            }
        })
        this.$forceUpdate()
        },
        OnroundingfactorChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{roundingfactor}
            }
        })
        this.$forceUpdate()
        },
        OnorderrunningcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Specification.orderrunningcd = data.id
            this.M_SM_Specification.orderrunningcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{orderrunningcd}
            }
        })
        this.$forceUpdate()
        },
        OnordercancellationrunningcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Specification.ordercancellationrunningcd = data.id
            this.M_SM_Specification.ordercancellationrunningcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{ordercancellationrunningcd}
            }
        })
        this.$forceUpdate()
        },
        OnsnprunningcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Specification.snprunningcd = data.id
            this.M_SM_Specification.snprunningcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{snprunningcd}
            }
        })
        this.$forceUpdate()
        },
        OnreservationrunningcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Specification.reservationrunningcd = data.id
            this.M_SM_Specification.reservationrunningcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{reservationrunningcd}
            }
        })
        this.$forceUpdate()
        },
        OnvorunningcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Specification.vorunningcd = data.id
            this.M_SM_Specification.vorunningcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{vorunningcd}
            }
        })
        this.$forceUpdate()
        },
        OnvisitorregistrationrunningcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Specification.visitorregistrationrunningcd = data.id
            this.M_SM_Specification.visitorregistrationrunningcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{visitorregistrationrunningcd}
            }
        })
        this.$forceUpdate()
        },
        OnauctionrunningcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Specification.auctionrunningcd = data.id
            this.M_SM_Specification.auctionrunningcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{auctionrunningcd}
            }
        })
        this.$forceUpdate()
        },
        OncredittermscdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Specification.credittermscd = data.id
            this.M_SM_Specification.credittermscdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{credittermscd}
            }
        })
        this.$forceUpdate()
        },
        OncommisionrunningcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Specification.commisionrunningcd = data.id
            this.M_SM_Specification.commisionrunningcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{commisionrunningcd}
            }
        })
        this.$forceUpdate()
        },
        OnsalesaddendumrunningcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Specification.salesaddendumrunningcd = data.id
            this.M_SM_Specification.salesaddendumrunningcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{salesaddendumrunningcd}
            }
        })
        this.$forceUpdate()
        },
        OnsalesaddendumcancellationrunningcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Specification.salesaddendumcancellationrunningcd = data.id
            this.M_SM_Specification.salesaddendumcancellationrunningcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{salesaddendumcancellationrunningcd}
            }
        })
        this.$forceUpdate()
        },
        OncreditnotesrunningcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Specification.creditnotesrunningcd = data.id
            this.M_SM_Specification.creditnotesrunningcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{creditnotesrunningcd}
            }
        })
        this.$forceUpdate()
        },
        OnsalesorrunningcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Specification.salesorrunningcd = data.id
            this.M_SM_Specification.salesorrunningcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{salesorrunningcd}
            }
        })
        this.$forceUpdate()
        },
        OncommisionbasedChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{commisionbased}
            }
        })
        this.$forceUpdate()
        },
        OncommissionpaymentChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{commissionpayment}
            }
        })
        this.$forceUpdate()
        },
        OntaxjournalstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{taxjournalstatus}
            }
        })
        this.$forceUpdate()
        },
        OngeneratecontractschedulebasedonChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{generatecontractschedulebasedon}
            }
        })
        this.$forceUpdate()
        },
        OnvisitorcheckoutChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{visitorcheckout}
            }
        })
        this.$forceUpdate()
        },
        OnbookbytokenChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              if(data == 'Y'){
                this.PI_mobileauctiontokenmethod.cKey = false
                this.PI_mobileauctiontokenmethod.cProtect = false
              }
              else{
                this.PI_mobileauctiontokenmethod.cKey = true
                this.PI_mobileauctiontokenmethod.cProtect = true
                this.M_SM_Specification.mobileauctiontokenmethod = 'I'
              }
//{bookbytoken}
            }
        })
        this.$forceUpdate()
        },
        OnmobileauctiontokenmethodChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{mobileauctiontokenmethod}
            }
        })
        this.$forceUpdate()
        },
        OntrxtypeChange (data) {
        this.$nextTick(() => {
            this.M_SM_Specification.trxtype = data.id
            this.M_SM_Specification.trxtypeLabel = data.label
            if (this.inputStatus != "VIEW") {
//{trxtype}
            }
        })
        this.$forceUpdate()
        },
        OnpaymentcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Specification.paymentcd = data.id
            this.M_SM_Specification.paymentcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{paymentcd}
            }
        })
        this.$forceUpdate()
        },
        OnbankcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Specification.bankcd = data.id
            this.M_SM_Specification.bankcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{bankcd}
            }
        })
        this.$forceUpdate()
        },
        OnglsalesrecognitiontrxtypeChange (data) {
        this.$nextTick(() => {
            this.M_SM_Specification.glsalesrecognitiontrxtype = data.id
            this.M_SM_Specification.glsalesrecognitiontrxtypeLabel = data.label
            if (this.inputStatus != "VIEW") {
//{glsalesrecognitiontrxtype}
            }
        })
        this.$forceUpdate()
        },
        OnpenaltytrxtypeChange (data) {
        this.$nextTick(() => {
            this.M_SM_Specification.penaltytrxtype = data.id
            this.M_SM_Specification.penaltytrxtypeLabel = data.label
            if (this.inputStatus != "VIEW") {
//{penaltytrxtype}
            }
        })
        this.$forceUpdate()
        },
        OnpenaltytaxcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_Specification.penaltytaxcd = data.id
            this.M_SM_Specification.penaltytaxcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{penaltytaxcd}
            }
        })
        this.$forceUpdate()
        },
        OncustomerpenaltyfromChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{customerpenaltyfrom}
            }
        })
        this.$forceUpdate()
        },
        OnglsalesterminationtrxtypeChange (data) {
        this.$nextTick(() => {
            this.M_SM_Specification.glsalesterminationtrxtype = data.id
            this.M_SM_Specification.glsalesterminationtrxtypeLabel = data.label
            if (this.inputStatus != "VIEW") {
//{glsalesterminationtrxtype}
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
        M_Post(dt){
        },
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                CurrencyCd: this.M_SM_Specification.currencycd == '' || this.M_SM_Specification.currencycd == null ? 'NULL' : this.M_SM_Specification.currencycd ,
                RoundingType: this.M_SM_Specification.roundingtype,
                RoundingFactor: this.M_SM_Specification.roundingfactor,
                OrderRunningCd: this.M_SM_Specification.orderrunningcd == '' || this.M_SM_Specification.orderrunningcd == null ? 'NULL' : this.M_SM_Specification.orderrunningcd ,
                SnPRunningCd: this.M_SM_Specification.snprunningcd == '' || this.M_SM_Specification.snprunningcd == null ? 'NULL' : this.M_SM_Specification.snprunningcd ,
                VORunningCd: this.M_SM_Specification.vorunningcd == '' || this.M_SM_Specification.vorunningcd == null ? 'NULL' : this.M_SM_Specification.vorunningcd ,
                AuctionRunningCd: this.M_SM_Specification.auctionrunningcd == '' || this.M_SM_Specification.auctionrunningcd == null ? 'NULL' : this.M_SM_Specification.auctionrunningcd ,
                CreditTermsCd: this.M_SM_Specification.credittermscd == '' || this.M_SM_Specification.credittermscd == null ? 'NULL' : this.M_SM_Specification.credittermscd ,
                CommissionPayment: this.M_SM_Specification.commissionpayment,
                CollectionRecognition: this.M_SM_Specification.collectionrecognition,
                GLSalesRecognitionTrxType: this.M_SM_Specification.glsalesrecognitiontrxtype == '' || this.M_SM_Specification.glsalesrecognitiontrxtype == null ? 'NULL' : this.M_SM_Specification.glsalesrecognitiontrxtype ,
                GLSalesTerminationTrxType: this.M_SM_Specification.glsalesterminationtrxtype == '' || this.M_SM_Specification.glsalesterminationtrxtype == null ? 'NULL' : this.M_SM_Specification.glsalesterminationtrxtype ,
                GLModuleCd: this.M_SM_Specification.glmodulecd,
                BookingCancelationTime: this.M_SM_Specification.bookingcancelationtime,
                ReservationRunningCd: this.M_SM_Specification.reservationrunningcd == '' || this.M_SM_Specification.reservationrunningcd == null ? 'NULL' : this.M_SM_Specification.reservationrunningcd ,
                PenaltyTrxType: this.M_SM_Specification.penaltytrxtype == '' || this.M_SM_Specification.penaltytrxtype == null ? 'NULL' : this.M_SM_Specification.penaltytrxtype ,
                PenaltyModuleCd: this.M_SM_Specification.penaltymodulecd,
                PenaltyTaxCd: this.M_SM_Specification.penaltytaxcd == '' || this.M_SM_Specification.penaltytaxcd == null ? 'NULL' : this.M_SM_Specification.penaltytaxcd ,
                TaxJournalStatus: this.M_SM_Specification.taxjournalstatus,
                RecognizedPercentage: this.M_SM_Specification.recognizedpercentage,
                NonRefundablePaymentLimit: this.M_SM_Specification.nonrefundablepaymentlimit,
                UserInput: this.getDataUser().user_id ,
                MobileAuctionTokenAmt: this.M_SM_Specification.mobileauctiontokenamt,
                MobileAuctionTokenMethod: this.M_SM_Specification.mobileauctiontokenmethod,
                MobileAuctionPicking: this.M_SM_Specification.mobileauctionpicking,
                MinCollectionHandOverPercentage: this.M_SM_Specification.mincollectionhandoverpercentage,
                MinHandOverProgressPercentage: this.M_SM_Specification.minhandoverprogresspercentage,
                VisitorRegistrationRunningCd: this.M_SM_Specification.visitorregistrationrunningcd == '' || this.M_SM_Specification.visitorregistrationrunningcd == null ? 'NULL' : this.M_SM_Specification.visitorregistrationrunningcd ,
                VisitorCheckOut: this.M_SM_Specification.visitorcheckout,
                TrxType: this.M_SM_Specification.trxtype == '' || this.M_SM_Specification.trxtype == null ? 'NULL' : this.M_SM_Specification.trxtype ,
                PaymentCd: this.M_SM_Specification.paymentcd == '' || this.M_SM_Specification.paymentcd == null ? 'NULL' : this.M_SM_Specification.paymentcd ,
                BankCd: this.M_SM_Specification.bankcd == '' || this.M_SM_Specification.bankcd == null ? 'NULL' : this.M_SM_Specification.bankcd ,
                BankChargesAmt: this.M_SM_Specification.bankchargesamt,
                CommisionBased: this.M_SM_Specification.commisionbased,
                CommisionRunningCd: this.M_SM_Specification.commisionrunningcd == '' || this.M_SM_Specification.commisionrunningcd == null ? 'NULL' : this.M_SM_Specification.commisionrunningcd ,
                BookByToken: this.M_SM_Specification.bookbytoken,
                DeveloperPenaltyCalculatePercentage: this.M_SM_Specification.developerpenaltycalculatepercentage,
                HandOverDays: this.M_SM_Specification.handoverdays,
                CustomerPenaltyFrom: this.M_SM_Specification.customerpenaltyfrom,
                SalesAddendumRunningCd: this.M_SM_Specification.salesaddendumrunningcd == '' || this.M_SM_Specification.salesaddendumrunningcd == null ? 'NULL' : this.M_SM_Specification.salesaddendumrunningcd ,
                SalesAddendumCancellationRunningCd: this.M_SM_Specification.salesaddendumcancellationrunningcd == '' || this.M_SM_Specification.salesaddendumcancellationrunningcd == null ? 'NULL' : this.M_SM_Specification.salesaddendumcancellationrunningcd ,
                OrderCancellationRunningCd: this.M_SM_Specification.ordercancellationrunningcd == '' || this.M_SM_Specification.ordercancellationrunningcd == null ? 'NULL' : this.M_SM_Specification.ordercancellationrunningcd ,
                CreditNotesRunningCd: this.M_SM_Specification.creditnotesrunningcd == '' || this.M_SM_Specification.creditnotesrunningcd == null ? 'NULL' : this.M_SM_Specification.creditnotesrunningcd ,
                GenerateContractScheduleBasedOn: this.M_SM_Specification.generatecontractschedulebasedon,
                SalesORRunningCd: this.M_SM_Specification.salesorrunningcd == '' || this.M_SM_Specification.salesorrunningcd == null ? 'NULL' : this.M_SM_Specification.salesorrunningcd                 
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
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                CurrencyCd: this.M_SM_Specification.currencycd == '' || this.M_SM_Specification.currencycd == null ? 'NULL' : this.M_SM_Specification.currencycd ,
                RoundingType: this.M_SM_Specification.roundingtype,
                RoundingFactor: this.M_SM_Specification.roundingfactor,
                OrderRunningCd: this.M_SM_Specification.orderrunningcd == '' || this.M_SM_Specification.orderrunningcd == null ? 'NULL' : this.M_SM_Specification.orderrunningcd ,
                SnPRunningCd: this.M_SM_Specification.snprunningcd == '' || this.M_SM_Specification.snprunningcd == null ? 'NULL' : this.M_SM_Specification.snprunningcd ,
                VORunningCd: this.M_SM_Specification.vorunningcd == '' || this.M_SM_Specification.vorunningcd == null ? 'NULL' : this.M_SM_Specification.vorunningcd ,
                AuctionRunningCd: this.M_SM_Specification.auctionrunningcd == '' || this.M_SM_Specification.auctionrunningcd == null ? 'NULL' : this.M_SM_Specification.auctionrunningcd ,
                CreditTermsCd: this.M_SM_Specification.credittermscd == '' || this.M_SM_Specification.credittermscd == null ? 'NULL' : this.M_SM_Specification.credittermscd ,
                CommissionPayment: this.M_SM_Specification.commissionpayment,
                CollectionRecognition: this.M_SM_Specification.collectionrecognition,
                GLSalesRecognitionTrxType: this.M_SM_Specification.glsalesrecognitiontrxtype == '' || this.M_SM_Specification.glsalesrecognitiontrxtype == null ? 'NULL' : this.M_SM_Specification.glsalesrecognitiontrxtype ,
                GLSalesTerminationTrxType: this.M_SM_Specification.glsalesterminationtrxtype == '' || this.M_SM_Specification.glsalesterminationtrxtype == null ? 'NULL' : this.M_SM_Specification.glsalesterminationtrxtype ,
                GLModuleCd: this.M_SM_Specification.glmodulecd,
                PenaltyTrxType: this.M_SM_Specification.penaltytrxtype == '' || this.M_SM_Specification.penaltytrxtype == null ? 'NULL' : this.M_SM_Specification.penaltytrxtype ,
                PenaltyModuleCd: this.M_SM_Specification.penaltymodulecd,
                PenaltyTaxCd: this.M_SM_Specification.penaltytaxcd == '' || this.M_SM_Specification.penaltytaxcd == null ? 'NULL' : this.M_SM_Specification.penaltytaxcd ,
                TaxJournalStatus: this.M_SM_Specification.taxjournalstatus,
                RecognizedPercentage: this.M_SM_Specification.recognizedpercentage,
                NonRefundablePaymentLimit: this.M_SM_Specification.nonrefundablepaymentlimit,
                UserEdit: this.getDataUser().user_id ,
                BookingCancelationTime: this.M_SM_Specification.bookingcancelationtime,
                ReservationRunningCd: this.M_SM_Specification.reservationrunningcd == '' || this.M_SM_Specification.reservationrunningcd == null ? 'NULL' : this.M_SM_Specification.reservationrunningcd ,
                LastUpdateStamp: this.M_SM_Specification.lastupdatestamp,
                MobileAuctionTokenAmt: this.M_SM_Specification.mobileauctiontokenamt,
                MobileAuctionTokenMethod: this.M_SM_Specification.mobileauctiontokenmethod,
                MobileAuctionPicking: this.M_SM_Specification.mobileauctionpicking,
                MinCollectionHandOverPercentage: this.M_SM_Specification.mincollectionhandoverpercentage,
                MinHandOverProgressPercentage: this.M_SM_Specification.minhandoverprogresspercentage,
                VisitorRegistrationRunningCd: this.M_SM_Specification.visitorregistrationrunningcd == '' || this.M_SM_Specification.visitorregistrationrunningcd == null ? 'NULL' : this.M_SM_Specification.visitorregistrationrunningcd ,
                VisitorCheckOut: this.M_SM_Specification.visitorcheckout,
                TrxType: this.M_SM_Specification.trxtype == '' || this.M_SM_Specification.trxtype == null ? 'NULL' : this.M_SM_Specification.trxtype ,
                PaymentCd: this.M_SM_Specification.paymentcd == '' || this.M_SM_Specification.paymentcd == null ? 'NULL' : this.M_SM_Specification.paymentcd ,
                BankCd: this.M_SM_Specification.bankcd == '' || this.M_SM_Specification.bankcd == null ? 'NULL' : this.M_SM_Specification.bankcd ,
                BankChargesAmt: this.M_SM_Specification.bankchargesamt,
                CommisionBased: this.M_SM_Specification.commisionbased,
                CommisionRunningCd: this.M_SM_Specification.commisionrunningcd == '' || this.M_SM_Specification.commisionrunningcd == null ? 'NULL' : this.M_SM_Specification.commisionrunningcd ,
                BookByToken: this.M_SM_Specification.bookbytoken,
                DeveloperPenaltyCalculatePercentage: this.M_SM_Specification.developerpenaltycalculatepercentage,
                HandOverDays: this.M_SM_Specification.handoverdays,
                CustomerPenaltyFrom: this.M_SM_Specification.customerpenaltyfrom,
                SalesAddendumRunningCd: this.M_SM_Specification.salesaddendumrunningcd == '' || this.M_SM_Specification.salesaddendumrunningcd == null ? 'NULL' : this.M_SM_Specification.salesaddendumrunningcd ,
                SalesAddendumCancellationRunningCd: this.M_SM_Specification.salesaddendumcancellationrunningcd == '' || this.M_SM_Specification.salesaddendumcancellationrunningcd == null ? 'NULL' : this.M_SM_Specification.salesaddendumcancellationrunningcd ,
                OrderCancellationRunningCd: this.M_SM_Specification.ordercancellationrunningcd == '' || this.M_SM_Specification.ordercancellationrunningcd == null ? 'NULL' : this.M_SM_Specification.ordercancellationrunningcd ,
                CreditNotesRunningCd: this.M_SM_Specification.creditnotesrunningcd == '' || this.M_SM_Specification.creditnotesrunningcd == null ? 'NULL' : this.M_SM_Specification.creditnotesrunningcd ,
                GenerateContractScheduleBasedOn: this.M_SM_Specification.generatecontractschedulebasedon,
                SalesORRunningCd: this.M_SM_Specification.salesorrunningcd == '' || this.M_SM_Specification.salesorrunningcd == null ? 'NULL' : this.M_SM_Specification.salesorrunningcd                 
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
			this.$nextTick(() => {
            this.M_SM_Specification = {
                  auctionrunningcd: '',
                  auctionrunningcddescs: '',
                  bankcd: '',
                  bankchargesamt: '',
                  bankname: '',
                  bookbytoken: '',
                  bookingcancelationtime: '',
                  collectionrecognition: '',
                  commisionbased: '',
                  commisionrunningcd: '',
                  commisionrunningcddescs: '',
                  commissionpayment: '',
                  creditnotesrunningcd: '',
                  creditnotesrunningcddescs: '',
                  credittermscd: '',
                  credittermsdescs: '',
                  currencycd: '',
                  currencydescs: '',
                  customerpenaltyfrom: '',
                  developerpenaltycalculatepercentage: '',
                  generatecontractschedulebasedon: '',
                  glmodulecd: '',
                  glsalesrecognitiontrxtype: '',
                  glsalesrecognitiontrxtypedescs: '',
                  glsalesterminationtrxtype: '',
                  glsalesterminationtrxtypedescs: '',
                  handoverdays: '',
                  lastupdatestamp: '',
                  mincollectionhandoverpercentage: '',
                  minhandoverprogresspercentage: '',
                  mobileauctionpicking: '',
                  mobileauctiontokenamt: '',
                  mobileauctiontokenmethod: '',
                  nonrefundablepaymentlimit: '',
                  ordercancellationrunningcd: '',
                  ordercancellationrunningdescs: '',
                  orderrunningcd: '',
                  orderrunningdescs: '',
                  paymentcd: '',
                  paymentdescs: '',
                  penaltymodulecd: '',
                  penaltytaxcd: '',
                  penaltytaxdescs: '',
                  penaltytrxtype: '',
                  penaltytrxtypedescs: '',
                  recognizedpercentage: '',
                  reservationrunningcd: '',
                  reservationrunningdescs: '',
                  roundingfactor: '',
                  roundingtype: '',
                  salesaddendumcancellationrunningcd: '',
                  salesaddendumcancellationrunningcddescs: '',
                  salesaddendumrunningcd: '',
                  salesaddendumrunningcddescs: '',
                  salesorrunningcd: '',
                  salesorrunningcddescs: '',
                  snprunningcd: '',
                  snprunningdescs: '',
                  subportfoliocd: '',
                  taxjournalstatus: '',
                  trxtype: '',
                  trxtypedescs: '',
                  unitsales: '',
                  useredit: this.getDataUser().user_id,
                  userinput: '',
                  visitorcheckout: '',
                  visitorregistrationrunningcd: '',
                  visitorregistrationrunningcddescs: '',
                  vorunningcd: '',
                  vorunningdescs: '',
                  lastupdatestamp: 0,
                  rowid: 0
                    }
            	
		   })
		   this.$forceUpdate()	
		},
        M_New(){
          this.$refs.ref_currencycd.focus()
        },
        M_Edit(){
          this.$refs.ref_currencycd.focus()
        },
        M_Delete(dt){       

            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                SubPortfolioCd:this.getDataUser().subportfolio_cd,
                PortfolioCd:this.getDataUser().portfolio_cd,
                LineNo: this.$parent.data.page_order,
                Data: dt
				//,SourceValue:''
            }
            
            this.postJSONMulti( this.getUrlDeleteMulti(), param )
            .then(response => {
                if (response == null) return
				var message = "Deleting Data Successfully"   				
				//kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
				this.$parent.resultDelete(message)
				


            })
        },        
        getDataBy (record) {
          // console.log(record)
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,                SubPortfolioCd: this.getDataUser().subportfolio_cd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                // console.log(data)
                if(response.Data.length > 0){

                    // this.$store.commit('setStatus', 'EDIT')
                    this.getToolbar().FormStatus = 'EDIT'
                    this.getToolbar().ProcessPS()
            this.M_SM_Specification = {
              auctionrunningcd: data.auctionrunningcd,
              auctionrunningcddescs: data.auctionrunningcddescs,
              bankcd: data.bankcd,
              bankchargesamt: this.isCurrency(data.bankchargesamt, data.decimal),
              bankname: data.bankname,
              bookbytoken: data.bookbytoken,
              bookingcancelationtime: this.isCurrency(data.bookingcancelationtime, data.decimal),
              collectionrecognition: this.isCurrency(data.collectionrecognition, data.decimal),
              commisionbased: data.commisionbased,
              commisionrunningcd: data.commisionrunningcd,
              commisionrunningdescs: data.commisionrunningcddescs,
              commissionpayment: data.commissionpayment,
              creditnotesrunningcd: data.creditnotesrunningcd,
              creditnotesrunningcddescs: data.creditnotesrunningcddescs,
              credittermscd: data.credittermscd,
              credittermsdescs: data.credittermsdescs,
              currencycd: data.currencycd,
              currencydescs: data.currencydescs,
              customerpenaltyfrom: data.customerpenaltyfrom,
              developerpenaltycalculatepercentage: this.isCurrency(data.developerpenaltycalculatepercentage, data.decimal),
              generatecontractschedulebasedon: data.generatecontractschedulebasedon,
              glmodulecd: data.glmodulecd,
              glsalesrecognitiontrxtype: data.glsalesrecognitiontrxtype,
              glsalesrecognitiontrxtypedescs: data.glsalesrecognitiontrxtypedescs,
              glsalesterminationtrxtype: data.glsalesterminationtrxtype,
              glsalesterminationtrxtypedescs: data.glsalesterminationtrxtypedescs,
              handoverdays: data.handoverdays,
              lastupdatestamp: data.lastupdatestamp,
              mincollectionhandoverpercentage: this.isCurrency(data.mincollectionhandoverpercentage, data.decimal),
              minhandoverprogresspercentage: this.isCurrency(data.minhandoverprogresspercentage, data.decimal),
              mobileauctionpicking: data.mobileauctionpicking,
              mobileauctiontokenamt: this.isCurrency(data.mobileauctiontokenamt, data.decimal),
              mobileauctiontokenmethod: data.mobileauctiontokenmethod,
              nonrefundablepaymentlimit: this.isCurrency(data.nonrefundablepaymentlimit, data.decimal),
              ordercancellationrunningcd: data.ordercancellationrunningcd,
              ordercancellationrunningdescs: data.ordercancellationrunningdescs,
              orderrunningcd: data.orderrunningcd,
              orderrunningdescs: data.orderrunningdescs,
              paymentcd: data.paymentcd,
              paymentdescs: data.paymentdescs,
              penaltymodulecd: data.penaltymodulecd,
              penaltytaxcd: data.penaltytaxcd,
              penaltytaxdescs: data.penaltytaxdescs,
              penaltytrxtype: data.penaltytrxtype,
              penaltytrxtypedescs: data.penaltytrxtypedescs,
              recognizedpercentage: this.isCurrency(data.recognizedpercentage, data.decimal),
              reservationrunningcd: data.reservationrunningcd,
              reservationrunningdescs: data.reservationrunningdescs,
              roundingfactor: data.roundingfactor,
              roundingtype: data.roundingtype,
              salesaddendumcancellationrunningcd: data.salesaddendumcancellationrunningcd,
              salesaddendumcancellationrunningdescs: data.salesaddendumcancellationrunningcddescs,
              salesaddendumrunningcd: data.salesaddendumrunningcd,
              salesaddendumrunningcddescs: data.salesaddendumrunningcddescs,
              salesorrunningcd: data.salesorrunningcd,
              salesorrunningdescs: data.salesorrunningcddescs,
              snprunningcd: data.snprunningcd,
              snprunningdescs: data.snprunningdescs,
              subportfoliocd: data.subportfoliocd,
              taxjournalstatus: data.taxjournalstatus,
              trxtype: data.trxtype,
              trxtypedescs: data.trxtypedescs,
              unitsales: data.unitsales,
              useredit: data.useredit,
              userinput: data.userinput,
              visitorcheckout: data.visitorcheckout,
              visitorregistrationrunningcd: data.visitorregistrationrunningcd,
              visitorregistrationrunningcddescs: data.visitorregistrationrunningcddescs,
              vorunningcd: data.vorunningcd,
              vorunningdescs: data.vorunningdescs
                    }
                 

                this.M_SM_Specification.currencycdLabel = this.M_SM_Specification.currencycd != null && this.M_SM_Specification.currencycd != '' ? data.currencycd + this.separator + data.currencydescs :'' 
                this.M_SM_Specification.orderrunningcdLabel = this.M_SM_Specification.orderrunningcd != null && this.M_SM_Specification.orderrunningcd != '' ? data.orderrunningcd + this.separator + data.orderrunningdescs :'' 
                this.M_SM_Specification.ordercancellationrunningcdLabel = this.M_SM_Specification.ordercancellationrunningcd != null && this.M_SM_Specification.ordercancellationrunningcd != '' ? data.ordercancellationrunningcd + this.separator + data.ordercancellationrunningdescs :'' 
                this.M_SM_Specification.snprunningcdLabel = this.M_SM_Specification.snprunningcd != null && this.M_SM_Specification.snprunningcd != '' ? data.snprunningcd + this.separator + data.snprunningdescs :'' 
                this.M_SM_Specification.reservationrunningcdLabel = this.M_SM_Specification.reservationrunningcd != null && this.M_SM_Specification.reservationrunningcd != '' ? data.reservationrunningcd + this.separator + data.reservationrunningdescs :'' 
                this.M_SM_Specification.vorunningcdLabel = this.M_SM_Specification.vorunningcd != null && this.M_SM_Specification.vorunningcd != '' ? data.vorunningcd + this.separator + data.vorunningdescs :'' 
                this.M_SM_Specification.visitorregistrationrunningcdLabel = this.M_SM_Specification.visitorregistrationrunningcd != null && this.M_SM_Specification.visitorregistrationrunningcd != '' ? data.visitorregistrationrunningcd + this.separator + data.visitorregistrationrunningcddescs :'' 
                this.M_SM_Specification.auctionrunningcdLabel = this.M_SM_Specification.auctionrunningcd != null && this.M_SM_Specification.auctionrunningcd != '' ? data.auctionrunningcd + this.separator + data.auctionrunningcddescs :'' 
                this.M_SM_Specification.credittermscdLabel = this.M_SM_Specification.credittermscd != null && this.M_SM_Specification.credittermscd != '' ? data.credittermscd + this.separator + data.credittermsdescs :'' 
                this.M_SM_Specification.commisionrunningcdLabel = this.M_SM_Specification.commisionrunningcd != null && this.M_SM_Specification.commisionrunningcd != '' ? data.commisionrunningcd + this.separator + data.commisionrunningcddescs :'' 
                this.M_SM_Specification.salesaddendumrunningcdLabel = this.M_SM_Specification.salesaddendumrunningcd != null && this.M_SM_Specification.salesaddendumrunningcd != '' ? data.salesaddendumrunningcd + this.separator + data.salesaddendumrunningcddescs :'' 
                this.M_SM_Specification.salesaddendumcancellationrunningcdLabel = this.M_SM_Specification.salesaddendumcancellationrunningcd != null && this.M_SM_Specification.salesaddendumcancellationrunningcd != '' ? data.salesaddendumcancellationrunningcd + this.separator + data.salesaddendumcancellationrunningcddescs :'' 
                this.M_SM_Specification.creditnotesrunningcdLabel = this.M_SM_Specification.creditnotesrunningcd != null && this.M_SM_Specification.creditnotesrunningcd != '' ? data.creditnotesrunningcd + this.separator + data.creditnotesrunningcddescs :'' 
                this.M_SM_Specification.salesorrunningcdLabel = this.M_SM_Specification.salesorrunningcd != null && this.M_SM_Specification.salesorrunningcd != '' ? data.salesorrunningcd + this.separator + data.salesorrunningcddescs :'' 
                this.M_SM_Specification.trxtypeLabel = this.M_SM_Specification.trxtype != null && this.M_SM_Specification.trxtype != '' ? data.trxtype + this.separator + data.trxtypedescs :'' 
                this.M_SM_Specification.paymentcdLabel = this.M_SM_Specification.paymentcd != null && this.M_SM_Specification.paymentcd != '' ? data.paymentcd + this.separator + data.paymentdescs :'' 
                this.M_SM_Specification.bankcdLabel = this.M_SM_Specification.bankcd != null && this.M_SM_Specification.bankcd != '' ? data.bankcd + this.separator + data.bankcddescs :'' 
                this.M_SM_Specification.glsalesrecognitiontrxtypeLabel = this.M_SM_Specification.glsalesrecognitiontrxtype != null && this.M_SM_Specification.glsalesrecognitiontrxtype != '' ? data.glsalesrecognitiontrxtype + this.separator + data.glsalesrecognitiontrxtypedescs :'' 
                this.M_SM_Specification.penaltytrxtypeLabel = this.M_SM_Specification.penaltytrxtype != null && this.M_SM_Specification.penaltytrxtype != '' ? data.penaltytrxtype + this.separator + data.penaltytrxtypedescs :'' 
                this.M_SM_Specification.penaltytaxcdLabel = this.M_SM_Specification.penaltytaxcd != null && this.M_SM_Specification.penaltytaxcd != '' ? data.penaltytaxcd + this.separator + data.penaltytaxdescs :'' 
                this.M_SM_Specification.glsalesterminationtrxtypeLabel = this.M_SM_Specification.glsalesterminationtrxtype != null && this.M_SM_Specification.glsalesterminationtrxtype != '' ? data.glsalesterminationtrxtype + this.separator + data.glsalesterminationtrxtypedescs :'' 
         
                if(data.bookbytoken == 'Y'){
                  this.PI_mobileauctiontokenmethod.cKey = false
                }
                else{
                  this.PI_mobileauctiontokenmethod.cKey = true
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
