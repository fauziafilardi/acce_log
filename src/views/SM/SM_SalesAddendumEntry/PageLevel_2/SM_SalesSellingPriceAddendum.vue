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
                                  <b-row style="padding-left:10px;">					
                                    <b-col md="12" id="col-left"> <!-- table open -->
                                         
                                          <b-row>
                                            <b-col  md="6">
                                              <ABSinputTextVuex :prop="PI_buildingprice" v-model="M_SM_SalesSellingPriceAddendum.buildingprice"  ref="ref_buildingprice"/>
                                            </b-col>
                                          </b-row>
                                          <b-row>
                                            <b-col  md="6">
                                              <ABSinputTextVuex :prop="PI_landprice" v-model="M_SM_SalesSellingPriceAddendum.landprice"  ref="ref_landprice"/>
                                            </b-col>
                                          </b-row>
                                          <!-- <b-row style="height: 20px !important;">
                                            <b-col md="2">
                                              <ABSLabelOnly
                                              :prop="{cLabel: '', 
                                                cLabelSize: 4, 
                                                cValue: '', 
                                                cPageLevel: PageLevel, 
                                                cTabIndex: TabIndex, 
                                                cVisible: true,
                                                cClass: 'lbl-col-align'}"
                                              />
                                            </b-col>
                                            <b-col md="5">
                                              <b-row>
                                                <b-col md="3" style="text-align: right !important;padding-right: 16px !important;">Percentage (%) </b-col>                                           
                                                <b-col md="3" style="text-align: right !important;padding-right: 16px !important;">Amount </b-col>
                                              </b-row>
                                            </b-col>
                                          </b-row>

                                          <b-row>
                                            <b-col md="2">
                                              <ABSLabelOnly
                                              :prop="{cLabel: '', 
                                                cLabelSize: 4, 
                                                cValue: '', 
                                                cPageLevel: PageLevel, 
                                                cTabIndex: TabIndex, 
                                                cVisible: true,
                                                cClass: 'lbl-col-align'}"
                                              />
                                            </b-col>
                                            <b-col md="5">
                                              <b-row>
                                                <b-col  md="3">
                                                  <ABSTextBoxOnly :prop="PI_interestpercentage" v-model="M_SM_SalesSellingPriceAddendum.interestpercentage"  ref="ref_interestpercentage"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_interestamt" v-model="M_SM_SalesSellingPriceAddendum.interestamt"  ref="ref_interestamt"/>
                                                </b-col>
                                              </b-row>
                                            </b-col>
                                          </b-row> -->
                                          <div class="div-collapse">
                                              <span class="master-span-form">
                                                  Price Breakdown
                                              </span>
                                          </div>
                                          <b-row style="height: 20px !important;">
                                            <b-col md="2">
                                              <ABSLabelOnly
                                              :prop="{cLabel: '', 
                                                cLabelSize: 4, 
                                                cValue: '', 
                                                cPageLevel: PageLevel, 
                                                cTabIndex: TabIndex, 
                                                cVisible: true,
                                                cClass: 'lbl-col-align'}"
                                              />
                                            </b-col>
                                            <b-col md="5">
                                              <b-row>
                                                <b-col md="3" style="text-align: right !important;padding-right: 16px !important;">Trans Amount </b-col>                                           
                                                <b-col md="3" style="text-align: left !important;">Tax Code </b-col>
                                                <b-col md="3" style="text-align: left !important;">Discount Code </b-col>
                                                <b-col md="3" style="text-align: right !important;padding-right: 20px !important;">Discount Amount </b-col>
                                              </b-row>                                              
                                            </b-col>
                                            <b-col md="5">
                                              <b-row>
                                                <b-col md="3" style="text-align: right !important;padding-right: 16px !important;">After Disc Amt </b-col>
                                                <b-col md="3" style="text-align: right !important;padding-right: 16px !important;">Net Amount </b-col>
                                                <b-col md="3" style="text-align: right !important;padding-right: 16px !important;">Vat Amount </b-col>
                                                <b-col md="3" style="text-align: right !important;padding-right: 16px !important;">Total Amount </b-col>
                                              </b-row>                                              
                                            </b-col>
                                          </b-row>

                                          <b-row>
                                            <b-col md="2">
                                              <ABSLabelOnly
                                              :prop="{cLabel: 'Unit Price', 
                                                cLabelSize: 4, 
                                                cValue: '', 
                                                cPageLevel: PageLevel, 
                                                cTabIndex: TabIndex, 
                                                cVisible: true,
                                                cClass: 'lbl-col-align'}"
                                              />
                                            </b-col>
                                            <b-col md="5">
                                              <b-row>
                                                <b-col  md="3" style="padding-left: 10px !important">
                                                  <ABSTextBoxOnly :prop="PI_lottrxamt" v-model="M_SM_SalesSellingPriceAddendum.lottrxamt"  ref="ref_lottrxamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <!-- <ABSInputSelectListOnly @change="OnlottaxcdChange" :prop="PI_lottaxcd" :value="M_SM_SalesSellingPriceAddendum.lottaxcd" :label="M_SM_SalesSellingPriceAddendum.lottaxcdLabel" ref="ref_lottaxcd"/> -->
                                                  <ABSTextBoxOnly :prop="PI_lottaxcd" v-model="M_SM_SalesSellingPriceAddendum.lottaxcd"  ref="ref_lottaxcd"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSInputSelectListOnly @change="OnlotdiscountcdChange" :prop="PI_lotdiscountcd" :value="M_SM_SalesSellingPriceAddendum.lotdiscountcd" :label="M_SM_SalesSellingPriceAddendum.lotdiscountcdLabel" ref="ref_lotdiscountcd"/>
                                                </b-col>
                                                <b-col md="3" style="padding-right: 10px !important">
                                                  <ABSTextBoxOnly :prop="PI_lotdiscamt" v-model="M_SM_SalesSellingPriceAddendum.lotdiscamt"  ref="ref_lotdiscamt"/>
                                                </b-col>
                                              </b-row>
                                            </b-col>
                                            <b-col md="5">
                                              <b-row>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_lotafterdiscamt" v-model="M_SM_SalesSellingPriceAddendum.lotafterdiscamt"  ref="ref_lotafterdiscamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_lotnetamt" v-model="M_SM_SalesSellingPriceAddendum.lotnetamt"  ref="ref_lotnetamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_lotvatamt" v-model="M_SM_SalesSellingPriceAddendum.lotvatamt"  ref="ref_lotvatamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_lottotalamt" v-model="M_SM_SalesSellingPriceAddendum.lottotalamt"  ref="ref_lottotalamt"/>
                                                </b-col>
                                              </b-row>
                                            </b-col>
                                          </b-row>

                                          <b-row>
                                            <b-col md="2">
                                              <ABSLabelOnly
                                              :prop="{cLabel: 'VO Price', 
                                                cLabelSize: 4, 
                                                cValue: '', 
                                                cPageLevel: PageLevel, 
                                                cTabIndex: TabIndex, 
                                                cVisible: true,
                                                cClass: 'lbl-col-align'}"
                                              />
                                            </b-col>
                                            <b-col md="5">
                                              <b-row>
                                                <b-col  md="3" style="padding-left: 10px !important">
                                                  <ABSTextBoxOnly :prop="PI_voprice" v-model="M_SM_SalesSellingPriceAddendum.voprice"  ref="ref_voprice"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <!-- <ABSInputSelectListOnly @change="OnvotaxcdChange" :prop="PI_votaxcd" :value="M_SM_SalesSellingPriceAddendum.votaxcd" :label="M_SM_SalesSellingPriceAddendum.votaxcdLabel" ref="ref_votaxcd"/> -->
                                                  <ABSTextBoxOnly :prop="PI_votaxcd" v-model="M_SM_SalesSellingPriceAddendum.votaxcd"  ref="ref_votaxcd"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSInputSelectListOnly @change="OnvodiscountcdChange" :prop="PI_vodiscountcd" :value="M_SM_SalesSellingPriceAddendum.vodiscountcd" :label="M_SM_SalesSellingPriceAddendum.vodiscountcdLabel" ref="ref_vodiscountcd"/>
                                                </b-col>
                                                <b-col md="3" style="padding-right: 10px !important">
                                                  <ABSTextBoxOnly :prop="PI_vodiscamt" v-model="M_SM_SalesSellingPriceAddendum.vodiscamt"  ref="ref_vodiscamt"/>
                                                </b-col>
                                              </b-row>
                                            </b-col>
                                            <b-col md="5">
                                              <b-row>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_voafterdiscamt" v-model="M_SM_SalesSellingPriceAddendum.voafterdiscamt"  ref="ref_voafterdiscamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_vonetamt" v-model="M_SM_SalesSellingPriceAddendum.vonetamt"  ref="ref_vonetamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_vovatamt" v-model="M_SM_SalesSellingPriceAddendum.vovatamt"  ref="ref_vovatamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_vototalamt" v-model="M_SM_SalesSellingPriceAddendum.vototalamt"  ref="ref_vototalamt"/>
                                                </b-col>
                                              </b-row>
                                            </b-col>
                                          </b-row>

                                          <b-row>
                                            <b-col md="2">
                                              <ABSLabelOnly
                                              :prop="{cLabel: 'Other', 
                                                cLabelSize: 4, 
                                                cValue: '', 
                                                cPageLevel: PageLevel, 
                                                cTabIndex: TabIndex, 
                                                cVisible: true,
                                                cClass: 'lbl-col-align'}"
                                              />
                                            </b-col>
                                            <b-col md="5">
                                              <b-row>
                                                <b-col  md="3" style="padding-left: 10px !important">
                                                  <ABSTextBoxOnly :prop="PI_otherprice" v-model="M_SM_SalesSellingPriceAddendum.otherprice"  ref="ref_otherprice"/>
                                                </b-col>                                          
                                                <b-col  md="3">
                                                  <!-- <ABSInputSelectListOnly @change="OnothertaxcdChange" :prop="PI_othertaxcd" :value="M_SM_SalesSellingPriceAddendum.othertaxcd" :label="M_SM_SalesSellingPriceAddendum.othertaxcdLabel" ref="ref_othertaxcd"/> -->
                                                  <ABSTextBoxOnly :prop="PI_othertaxcd" v-model="M_SM_SalesSellingPriceAddendum.othertaxcd"  ref="ref_othertaxcd"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSInputSelectListOnly @change="OnotherdiscountcdChange" :prop="PI_otherdiscountcd" :value="M_SM_SalesSellingPriceAddendum.otherdiscountcd" :label="M_SM_SalesSellingPriceAddendum.otherdiscountcdLabel" ref="ref_otherdiscountcd"/>
                                                </b-col>
                                                <b-col md="3" style="padding-right: 10px !important">
                                                  <ABSTextBoxOnly :prop="PI_otherdiscamt" v-model="M_SM_SalesSellingPriceAddendum.otherdiscamt"  ref="ref_otherdiscamt"/>
                                                </b-col>
                                              </b-row>
                                            </b-col>
                                            <b-col md="5">
                                              <b-row>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_otherafterdiscamt" v-model="M_SM_SalesSellingPriceAddendum.otherafterdiscamt"  ref="ref_otherafterdiscamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_othernetamt" v-model="M_SM_SalesSellingPriceAddendum.othernetamt"  ref="ref_othernetamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_othervatamt" v-model="M_SM_SalesSellingPriceAddendum.othervatamt"  ref="ref_othervatamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_othertotalamt" v-model="M_SM_SalesSellingPriceAddendum.othertotalamt"  ref="ref_othertotalamt"/>
                                                </b-col>
                                              </b-row>
                                            </b-col>
                                          </b-row>

                                          <b-row>
                                            <b-col md="2">
                                              <ABSLabelOnly
                                              :prop="{cLabel: 'Total Selling Price', 
                                                cLabelSize: 4, 
                                                cValue: '', 
                                                cPageLevel: PageLevel, 
                                                cTabIndex: TabIndex, 
                                                cVisible: true,
                                                cClass: 'lbl-col-align'}"
                                              />
                                            </b-col>
                                            <b-col md="5">
                                              <b-row>
                                                <b-col  md="3" style="padding-left: 10px !important">
                                                  <ABSTextBoxOnly :prop="PI_totaltrxamt" v-model="M_SM_SalesSellingPriceAddendum.totaltrxamt"  ref="ref_totaltrxamt"/>
                                                </b-col>
                                                <b-col  md="3">
                                                </b-col>
                                                <b-col  md="3">
                                                </b-col>
                                                <b-col md="3" style="padding-right: 10px !important">
                                                  <ABSTextBoxOnly :prop="PI_totaldiscamt" v-model="M_SM_SalesSellingPriceAddendum.totaldiscamt"  ref="ref_totaldiscamt"/>
                                                </b-col>
                                              </b-row>
                                            </b-col>
                                            <b-col md="5">
                                              <b-row>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_totalafterdiscamt" v-model="M_SM_SalesSellingPriceAddendum.totalafterdiscamt"  ref="ref_totalafterdiscamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_totalnetamt" v-model="M_SM_SalesSellingPriceAddendum.totalnetamt"  ref="ref_totalnetamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_totalvatamt" v-model="M_SM_SalesSellingPriceAddendum.totalvatamt"  ref="ref_totalvatamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_grandtotal" v-model="M_SM_SalesSellingPriceAddendum.grandtotal"  ref="ref_grandtotal"/>
                                                </b-col>
                                              </b-row>
                                            </b-col>
                                          </b-row>
                                          <b-row>
                                            <b-col  md="6">
                                              <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_SalesSellingPriceAddendum.remarks"  ref="ref_remarks" />
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
    props: {PageLevel:'', TabIndex: '', data: ''},
    data() {
        return {
			ValKey:null,
            FormType: "Form",
			Module:"SM",
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_SalesSellingPriceAddendum :{
                salestypecd: '',
                salestype: '',
                fromdate: '',
                todate: '',
                addendumsequenceno: '',
                buildingprice: 0,
                landprice: 0,
                interestpercentage: 0,
                interestamt: 0,
                lottrxamt: 0,
                lottaxcd: '',
                lotdiscountcd: '',
                lotdiscamt: 0,
                lotafterdiscamt: 0,
                lotnetamt: 0,
                lotvatamt: 0,
                lottotalamt: 0,
                voprice: 0,
                vodiscamt: 0,
                voafterdiscamt: 0,
                vonetamt: 0,
                vovatamt: 0,
                vototalamt: 0,
                otherprice: 0,
                otherdiscamt: 0,
                otherafterdiscamt: 0,
                othernetamt: 0,
                othervatamt: 0,
                othertotalamt: 0,
                totaltrxamt: 0,
                totaldiscamt: 0,
                totalafterdiscamt: 0,
                totalnetamt: 0,
                totalvatamt: 0,
                grandtotal: 0,
                remarks: '',
                votaxcd: '',
                vodiscountcd: '',
                othertaxcd: '',
                otherdiscountcd: ''
                    }
            ,
            // PI_salestypecd: { 
            //     dataLookUp: { 
            //         LookUpCd: 'GetSalesTypeCd'    , 
            //         ColumnDB: 'SalesTypeCd'   , 
            //         InitialWhere: ""   , 
            //         ParamWhere: '' ,
            //         SourceField: ''  ,
            //         DisplayLookup: 'SalesTypeCd,Descs' 
            //             }, 
            //     cValidate :'required', 
            //     cName: 'salestypecd', 
            //     cLabel: 'Sales Type', 
            //     cKey: true, 
            //     cLabelSize: 4, 
            //     cOrder: 4, 
            //     cTriggered: false, 
            //     cDefault: '', 
            //     cProtect: false, 
            //     cVisible:  true, 
            //     cAsync:  false, 
            //     cFilter: true, 
            //     cPageLevel: this.PageLevel, 
            //     cTabIndex: this.TabIndex, 
            //     cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
            //     cStatic: false, 
            //     cOption: [], 
            //     cMasterUrl: 'SM/SM_SalesType' ,
            //     cDisplayColumn: 'SalesTypeCd,Descs' ,
            // }, 
            // PI_fromdate: { 
            //     cValidate :'required', 
            //     cName: 'fromdate', 
            //     cLabel: 'From Date', 
            //     cLabelSize: 4, 
            //     cOrder: 0, 
            //     cKey: true, 
            //     cVisible:  true, 
            //     cProtect: false, 
            //     cPageLevel: this.PageLevel, 
            //     cTabIndex: this.TabIndex, 
            //     cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            // }, 
            PI_buildingprice: { 
                cValidate :'', 
                cName: 'buildingprice', 
                cLabel: 'Building Price', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_landprice: { 
                cValidate :'', 
                cName: 'landprice', 
                cLabel: 'Land Price', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_interestpercentage: { 
                cValidate :'', 
                cName: 'interestpercentage', 
                cLabel: 'Percentage (%)', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_interestamt: { 
                cValidate :'', 
                cName: 'interestamt', 
                cLabel: 'Amount', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_lottrxamt: { 
                cValidate :'', 
                cName: 'lottrxamt', 
                cLabel: 'Unit Price', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_lottaxcd: { 
                cValidate :'', 
                cName: 'lottaxcd', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            // PI_lottaxcd: { 
            //     dataLookUp: { 
            //         LookUpCd: 'GetLookupCMTaxCode'    , 
            //         ColumnDB: 'TaxCd'   , 
            //         InitialWhere: ""   , 
            //         ParamWhere: '' ,
            //         SourceField: ''  ,
            //         DisplayLookup: 'TaxCd, Descs' 
            //             }, 
            //     cValidate :'', 
            //     cName: 'lottaxcd', 
            //     cLabel: '', 
            //     cKey: true, 
            //     cLabelSize: 4, 
            //     cOrder: 0, 
            //     cTriggered: false, 
            //     cDefault: '', 
            //     cProtect: false, 
            //     cVisible:  true, 
            //     cAsync:  false, 
            //     cFilter: true, 
            //     cPageLevel: this.PageLevel, 
            //     cTabIndex: this.TabIndex, 
            //     cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
            //     cStatic: false, 
            //     cOption: [], 
            //     cMasterUrl: '' ,
            //     cDisplayColumn: 'TaxCd, Descs' ,
            // }, 
            PI_lotdiscountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMDiscount'    , 
                    ColumnDB: 'DiscountCd'   , 
                    InitialWhere: "DiscountCd in (Select DiscountCd from CM_DiscountUser where UserId='"+this.getDataUser().user_id+"')", 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'DiscountCd' 
                        }, 
                cValidate :'', 
                cName: 'lotdiscountcd', 
                cLabel: '', 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'DiscountCd' ,
            }, 
            PI_lotdiscamt: { 
                cValidate :'', 
                cName: 'lotdiscamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_lotafterdiscamt: { 
                cValidate :'', 
                cName: 'lotafterdiscamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_lotnetamt: { 
                cValidate :'', 
                cName: 'lotnetamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_lotvatamt: { 
                cValidate :'', 
                cName: 'lotvatamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_lottotalamt: { 
                cValidate :'', 
                cName: 'lottotalamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_voprice: { 
                cValidate :'', 
                cName: 'voprice', 
                cLabel: 'VO Price', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_votaxcd: { 
                cValidate :'', 
                cName: 'votaxcd', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            // PI_votaxcd: { 
            //     dataLookUp: { 
            //         LookUpCd: 'GetLookupCMTaxCode'    , 
            //         ColumnDB: 'TaxCd'   , 
            //         InitialWhere: ""   , 
            //         ParamWhere: '' ,
            //         SourceField: ''  ,
            //         DisplayLookup: 'TaxCd, Descs' 
            //             }, 
            //     cValidate :'', 
            //     cName: 'votaxcd', 
            //     cLabel: '', 
            //     cKey: true, 
            //     cLabelSize: 4, 
            //     cOrder: 0, 
            //     cTriggered: false, 
            //     cDefault: '', 
            //     cProtect: false, 
            //     cVisible:  true, 
            //     cAsync:  false, 
            //     cFilter: true, 
            //     cPageLevel: this.PageLevel, 
            //     cTabIndex: this.TabIndex, 
            //     cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
            //     cStatic: false, 
            //     cOption: [], 
            //     cMasterUrl: '' ,
            //     cDisplayColumn: 'TaxCd, Descs' ,
            // }, 
            PI_vodiscountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMDiscount'    , 
                    ColumnDB: 'DiscountCd'   , 
                    InitialWhere: "DiscountCd in (Select DiscountCd from CM_DiscountUser where UserId='"+this.getDataUser().user_id+"')", 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'DiscountCd' 
                        }, 
                cValidate :'', 
                cName: 'vodiscountcd', 
                cLabel: '', 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'DiscountCd' ,
            }, 
            PI_vodiscamt: { 
                cValidate :'', 
                cName: 'vodiscamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_voafterdiscamt: { 
                cValidate :'', 
                cName: 'voafterdiscamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_vonetamt: { 
                cValidate :'', 
                cName: 'vonetamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_vovatamt: { 
                cValidate :'', 
                cName: 'vovatamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_vototalamt: { 
                cValidate :'', 
                cName: 'vototalamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_otherprice: { 
                cValidate :'', 
                cName: 'otherprice', 
                cLabel: 'Other', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_othertaxcd: { 
                cValidate :'', 
                cName: 'othertaxcd', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            // PI_othertaxcd: { 
            //     dataLookUp: { 
            //         LookUpCd: 'GetLookupCMTaxCode'    , 
            //         ColumnDB: 'TaxCd'   , 
            //         InitialWhere: ""   , 
            //         ParamWhere: '' ,
            //         SourceField: ''  ,
            //         DisplayLookup: 'TaxCd, Descs' 
            //             }, 
            //     cValidate :'', 
            //     cName: 'othertaxcd', 
            //     cLabel: '', 
            //     cKey: true, 
            //     cLabelSize: 4, 
            //     cOrder: 0, 
            //     cTriggered: false, 
            //     cDefault: '', 
            //     cProtect: false, 
            //     cVisible:  true, 
            //     cAsync:  false, 
            //     cFilter: true, 
            //     cPageLevel: this.PageLevel, 
            //     cTabIndex: this.TabIndex, 
            //     cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
            //     cStatic: false, 
            //     cOption: [], 
            //     cMasterUrl: '' ,
            //     cDisplayColumn: 'TaxCd, Descs' ,
            // }, 
            PI_otherdiscountcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMDiscount'    , 
                    ColumnDB: 'DiscountCd'   , 
                    InitialWhere: "DiscountCd in (Select DiscountCd from CM_DiscountUser where UserId='"+this.getDataUser().user_id+"')", 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'DiscountCd' 
                        }, 
                cValidate :'', 
                cName: 'otherdiscountcd', 
                cLabel: '', 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'DiscountCd' ,
            }, 
            PI_otherdiscamt: { 
                cValidate :'', 
                cName: 'otherdiscamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_otherafterdiscamt: { 
                cValidate :'', 
                cName: 'otherafterdiscamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_othernetamt: { 
                cValidate :'', 
                cName: 'othernetamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_othervatamt: { 
                cValidate :'', 
                cName: 'othervatamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_othertotalamt: { 
                cValidate :'', 
                cName: 'othertotalamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_totaltrxamt: { 
                cValidate :'', 
                cName: 'totaltrxamt', 
                cLabel: 'Total Selling Price', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_totaldiscamt: { 
                cValidate :'', 
                cName: 'totaldiscamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_totalafterdiscamt: { 
                cValidate :'', 
                cName: 'totalafterdiscamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_totalnetamt: { 
                cValidate :'', 
                cName: 'totalnetamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_totalvatamt: { 
                cValidate :'', 
                cName: 'totalvatamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_grandtotal: { 
                cValidate :'', 
                cName: 'grandtotal', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: true, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
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
                cKey: true, 
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
		return this.$store.getters.GetPage2Data
	},
    DataRowPage1(){
		return this.$store.getters.GetPage1Data
	}
	,GetDataBy1(){
		return this.$store.getters.GetPage1GetDataBy
	}
  },
    methods: {
        OnRead(){
          
        },
        OnNotRead(){

        },
        OnsalestypecdChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesSellingPriceAddendum.salestypecd = data.id
            this.M_SM_SalesSellingPriceAddendum.salestypecdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{salestypecd}
            }
        })
        this.$forceUpdate()
        },
        OnlottaxcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesSellingPriceAddendum.lottaxcd = data.id
            this.M_SM_SalesSellingPriceAddendum.lottaxcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{lottaxcd}
            }
        })
        this.$forceUpdate()
        },
        OnlotdiscountcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesSellingPriceAddendum.lotdiscountcd = data.id
            this.M_SM_SalesSellingPriceAddendum.lotdiscountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{lotdiscountcd}
            }
        })
        this.$forceUpdate()
        },
        OnvotaxcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesSellingPriceAddendum.votaxcd = data.id
            this.M_SM_SalesSellingPriceAddendum.votaxcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{votaxcd}
            }
        })
        this.$forceUpdate()
        },
        OnvodiscountcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesSellingPriceAddendum.vodiscountcd = data.id
            this.M_SM_SalesSellingPriceAddendum.vodiscountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{vodiscountcd}
            }
        })
        this.$forceUpdate()
        },
        OnothertaxcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesSellingPriceAddendum.othertaxcd = data.id
            this.M_SM_SalesSellingPriceAddendum.othertaxcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{othertaxcd}
            }
        })
        this.$forceUpdate()
        },
        OnotherdiscountcdChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesSellingPriceAddendum.otherdiscountcd = data.id
            this.M_SM_SalesSellingPriceAddendum.otherdiscountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{otherdiscountcd}
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
		
		setToolbarButton () {
           this.getToolbar().statusFunction[0].disabled = true
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
            this.$parent.showForm = true
            let data = this.$store.getters.GetPage1Data
            console.log(data)

           if(data.StatusCd == 'N'){
              this.getToolbar().FormStatus = 'EDIT'
              this.getToolbar().ProcessPS()
            } else if (data.StatusCd == 'C') {
              this.getToolbar().FormStatus = 'VIEW'
              this.getToolbar().ProcessPS()
            }else {
              this.getToolbar().FormStatus = 'VIEW'
              this.getToolbar().ProcessPS()
            }

            // if(data.STATUS == 'Y' || data.STATUS == 'C'){
            //   this.getToolbar().statusFunction[0].disabled = true
            //   // this.getToolbar().statusFunction[1].disabled = true
            //    this.getToolbar().FormStatus = 'VIEW'
            //   this.getToolbar().ProcessPS()
            // }else{
            //   // this.getToolbar().statusFunction[0].disabled = false
            //   // this.getToolbar().statusFunction[1].disabled = false
            //   this.getToolbar().FormStatus = 'EDIT'
            //   this.getToolbar().ProcessPS()
            // }
  			    // this.getToolbar().doEdit(true)


          // this.FormType = "View"
                    // this.$store.commit('setFormType','View')
            // this.FormType = "Form"
            // this.$store.commit('setFormType','Form')
            // this.getToolbar().FormStatus = 'EDIT'
            // this.getToolbar().ProcessPS()
            // this.$store.commit('setNewStatus', false)
            // this.getToolbar().statusFunction[0].disabled = true
            // this.getToolbar().statusFunction[1].disabled = true
            this.getDataBy()
            // this.FormToABSList().doGetList('','eb_getList')
        },		
		M_CheckboxChecked(data, status, index){

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
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                LotNo: this.DataRowPage1.LotNo,
                OrderNo: this.DataRowPage1.OrderNo,
                LotPrice: this.M_SM_SalesSellingPriceAddendum.lottrxamt ?  this.replaceAllString(this.M_SM_SalesSellingPriceAddendum.lottrxamt, ',', '', 'number') : 0,
                LotDiscountCd: this.M_SM_SalesSellingPriceAddendum.lotdiscountcd == '' || this.M_SM_SalesSellingPriceAddendum.lotdiscountcd == null ? 'NULL' : this.M_SM_SalesSellingPriceAddendum.lotdiscountcd,
                LotTaxCd: this.M_SM_SalesSellingPriceAddendum.lottaxcd == '' || this.M_SM_SalesSellingPriceAddendum.lottaxcd == null ? 'NULL' : this.M_SM_SalesSellingPriceAddendum.lottaxcd,
                VOPrice: this.M_SM_SalesSellingPriceAddendum.voprice ? this.replaceAllString(this.M_SM_SalesSellingPriceAddendum.voprice, ',', '', 'number') : 0,
                VODiscountCd : this.M_SM_SalesSellingPriceAddendum.vodiscountcd == '' || this.M_SM_SalesSellingPriceAddendum.vodiscountcd == null ? 'NULL' : this.M_SM_SalesSellingPriceAddendum.vodiscountcd,
                VOTaxCd : this.M_SM_SalesSellingPriceAddendum.votaxcd,
                OtherPrice : this.M_SM_SalesSellingPriceAddendum.otherprice ? this.replaceAllString(this.M_SM_SalesSellingPriceAddendum.otherprice, ',', '', 'number') : 0,
                OtherDiscountCd : this.M_SM_SalesSellingPriceAddendum.otherdiscountcd == '' || this.M_SM_SalesSellingPriceAddendum.otherdiscountcd == null ? 'NULL' : this.M_SM_SalesSellingPriceAddendum.otherdiscountcd,
                OtherTaxCd : this.M_SM_SalesSellingPriceAddendum.othertaxcd,
                Remarks : this.M_SM_SalesSellingPriceAddendum.remarks,
                UserEdit : this.getDataUser().user_id

            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_SalesSellingPriceAddendum = {
                salestypecd: '',
                salestype: '',
                fromdate: '',
                todate: '',
                addendumsequenceno: '',
                buildingprice: 0,
                landprice: 0,
                interestpercentage: 0,
                interestamt: 0,
                lottrxamt: 0,
                lottaxcd: '',
                lotdiscountcd: '',
                lotdiscamt: 0,
                lotafterdiscamt: 0,
                lotnetamt: 0,
                lotvatamt: 0,
                lottotalamt: 0,
                voprice: 0,
                vodiscamt: 0,
                voafterdiscamt: 0,
                vonetamt: 0,
                vovatamt: 0,
                vototalamt: 0,
                otherprice: 0,
                otherdiscamt: 0,
                otherafterdiscamt: 0,
                othernetamt: 0,
                othervatamt: 0,
                othertotalamt: 0,
                totaltrxamt: 0,
                totaldiscamt: 0,
                totalafterdiscamt: 0,
                totalnetamt: 0,
                totalvatamt: 0,
                grandtotal: 0,
                remarks: '',
                votaxcd: '',
                vodiscountcd: '',
                othertaxcd: '',
                otherdiscountcd: ''
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
					_Message_:'',


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
        getDataBy () {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,                LotNo: this.DataRowPage1.LotNo,
                OrderNo: this.DataRowPage1.OrderNo,
                addendumsequenceno: this.DataRowPage1.AddendumSequenceNo,				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return
                
                // if(response.Data.length > 0){
                  var data = response.Data[0]
                  // this.getToolbar().FormStatus = 'EDIT'
                  // this.getToolbar().ProcessPS()
                  this.M_SM_SalesSellingPriceAddendum = {
                      salestypecd: data.salestypecd,
                      salestype: data.salestype,
                      fromdate: data.fromdate,
                      todate: data.todate,
                      buildingprice: this.isCurrency(data.buildingprice, this.decimal),
                      landprice: this.isCurrency(data.landprice, this.decimal),
                      interestpercentage: this.isCurrency(data.interestpercentage, this.decimal),
                      interestamt: this.isCurrency(data.interestamt, this.decimal),
                      lottrxamt: this.isCurrency(data.lotprice, this.decimal),
                      lottaxcd: data.lottaxcd,
                      lotdiscountcd: data.lotdiscountcd,
                      lotdiscamt: this.isCurrency(data.lotdiscountamt, this.decimal),
                      lotafterdiscamt: this.isCurrency(data.lotpriceafterdiscount, this.decimal),
                      lotnetamt: this.isCurrency(data.lotbaseamt, this.decimal),
                      lotvatamt: this.isCurrency(data.lottaxamt, this.decimal),
                      lottotalamt: this.isCurrency(data.lottotalamt, this.decimal),
                      voprice: this.isCurrency(data.voprice, this.decimal),
                      vodiscamt: this.isCurrency(data.vodiscountamt, this.decimal),
                      voafterdiscamt: this.isCurrency(data.vopriceafterdiscount, this.decimal),
                      vonetamt: this.isCurrency(data.vobaseamt, this.decimal),
                      vovatamt: this.isCurrency(data.votaxamt, this.decimal),
                      vototalamt: this.isCurrency(data.vototalamt, this.decimal),
                      otherprice: this.isCurrency(data.otherprice, this.decimal),
                      otherdiscamt: this.isCurrency(data.otherdiscamt, this.decimal),
                      otherafterdiscamt: this.isCurrency(data.otherafterdiscamt, this.decimal),
                      othernetamt: this.isCurrency(data.othernetamt, this.decimal),
                      othervatamt: this.isCurrency(data.othervatamt, this.decimal),
                      othertotalamt: this.isCurrency(data.othertotalamt, this.decimal),
                      totaltrxamt: this.isCurrency(data.totalprice, this.decimal),
                      totaldiscamt: this.isCurrency(data.totaldiscountamt, this.decimal),
                      totalafterdiscamt: this.isCurrency(data.totalafterdiscountamt, this.decimal),
                      totalnetamt: this.isCurrency(data.totalnetamt, this.decimal),
                      totalvatamt: this.isCurrency(data.totalvatamt, this.decimal),
                      grandtotal: this.isCurrency(data.grandtotal, this.decimal),
                      remarks: data.remarks,
                      votaxcd: data.votaxcd,
                      vodiscountcd: data.vodiscountcd,
                      othertaxcd: data.othertaxcd,
                      otherdiscountcd: data.otherdiscountcd
                    }
                 

                    this.M_SM_SalesSellingPriceAddendum.salestypecdLabel = this.M_SM_SalesSellingPriceAddendum.salestypecd != null && this.M_SM_SalesSellingPriceAddendum.salestypecd != '' ? data.salestypecd + this.separator  :'' 
                    // this.M_SM_SalesSellingPriceAddendum.lottaxcdLabel = this.M_SM_SalesSellingPriceAddendum.lottaxcd != null && this.M_SM_SalesSellingPriceAddendum.lottaxcd != '' ? data.lottaxcd + this.separator  :'' 
                    this.M_SM_SalesSellingPriceAddendum.lotdiscountcdLabel = this.M_SM_SalesSellingPriceAddendum.lotdiscountcd != null && this.M_SM_SalesSellingPriceAddendum.lotdiscountcd != '' ? data.lotdiscountcd :'' 
                    // this.M_SM_SalesSellingPriceAddendum.votaxcdLabel = this.M_SM_SalesSellingPriceAddendum.votaxcd != null && this.M_SM_SalesSellingPriceAddendum.votaxcd != '' ? data.votaxcd + this.separator  :'' 
                    this.M_SM_SalesSellingPriceAddendum.vodiscountcdLabel = this.M_SM_SalesSellingPriceAddendum.vodiscountcd != null && this.M_SM_SalesSellingPriceAddendum.vodiscountcd != '' ? data.vodiscountcd :'' 
                    // this.M_SM_SalesSellingPriceAddendum.othertaxcdLabel = this.M_SM_SalesSellingPriceAddendum.othertaxcd != null && this.M_SM_SalesSellingPriceAddendum.othertaxcd != '' ? data.othertaxcd + this.separator  :'' 
                    this.M_SM_SalesSellingPriceAddendum.otherdiscountcdLabel = this.M_SM_SalesSellingPriceAddendum.otherdiscountcd != null && this.M_SM_SalesSellingPriceAddendum.otherdiscountcd != '' ? data.otherdiscountcd  :'' 
      

                    this.IEBy.Input = data.userinput
                    this.IEBy.Edit = data.useredit

                // }else{
                //   this.getToolbar().FormStatus = 'NEW'
                //   this.getToolbar().ProcessPS()
                // }

                


            })
        }
        ,MdtRange_fromdate (data) {
            this.M_SM_SalesSellingPriceAddendum.fromdate = data
        }
        ,MdtRange_todate (data) {
            this.M_SM_SalesSellingPriceAddendum.todate = data
        }
		
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

