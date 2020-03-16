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
                                            <ABSInputSelectList @change="OnsalestypecdChange" :prop="PI_salestypecd" :value="M_SM_LotSellingPrice.salestypecd" :label="M_SM_LotSellingPrice.salestypecdLabel" ref="ref_salestypecd"/>
                                          </b-col>
                                        </b-row>
                                        <b-row>
                                          <b-col  md="6">
                                            <ABSinputDateRangeVuex :prop="PI_fromdate" :valueFrom="M_SM_LotSellingPrice.fromdate" :valueTo="M_SM_LotSellingPrice.todate" ref="ref_fromdate" @from="MdtRange_fromdate" @to="MdtRange_todate" />
                                          </b-col>
                                        </b-row>
                                          <b-row>
                                            <b-col  md="6">
                                              <ABSinputTextVuex @input="OnbuildingpriceChange" :prop="PI_buildingprice" v-model="M_SM_LotSellingPrice.buildingprice"  ref="ref_buildingprice"/>
                                            </b-col>
                                          </b-row>
                                          <b-row>
                                            <b-col  md="6">
                                              <ABSinputTextVuex @input="OnlandpriceChange" :prop="PI_landprice" v-model="M_SM_LotSellingPrice.landprice"  ref="ref_landprice"/>
                                            </b-col>
                                          </b-row>
                                          <div class="div-collapse">
                                              <span class="master-span-form">
                                                  Interest
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
                                                <b-col md="3">
                                                  <ABSTextBoxOnly @input="OninterestpercentageChange" :prop="PI_interestpercentage" v-model="M_SM_LotSellingPrice.interestpercentage"  ref="ref_interestpercentage"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly @input="OninterestamtChange" :prop="PI_interestamt" v-model="M_SM_LotSellingPrice.interestamt"  ref="ref_interestamt"/>
                                                </b-col>
                                              </b-row>
                                            </b-col>
                                          </b-row>
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
                                                  <ABSTextBoxOnly @input="OnlottrxamtChange" :prop="PI_lottrxamt" v-model="M_SM_LotSellingPrice.lottrxamt"  ref="ref_lottrxamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSInputSelectListOnly @change="OnlottaxcdChange" :prop="PI_lottaxcd" :value="M_SM_LotSellingPrice.lottaxcd" :label="M_SM_LotSellingPrice.lottaxcdLabel" ref="ref_lottaxcd"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSInputSelectListOnly @change="OnlotdiscountcdChange" :prop="PI_lotdiscountcd" :value="M_SM_LotSellingPrice.lotdiscountcd" :label="M_SM_LotSellingPrice.lotdiscountcdLabel" ref="ref_lotdiscountcd"/>
                                                </b-col>
                                                <b-col md="3" style="padding-right: 10px !important">
                                                  <ABSTextBoxOnly :prop="PI_lotdiscamt" v-model="M_SM_LotSellingPrice.lotdiscamt"  ref="ref_lotdiscamt"/>
                                                </b-col>
                                              </b-row>
                                            </b-col>
                                            <b-col md="5">
                                              <b-row>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_lotafterdiscamt" v-model="M_SM_LotSellingPrice.lotafterdiscamt"  ref="ref_lotafterdiscamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_lotnetamt" v-model="M_SM_LotSellingPrice.lotnetamt"  ref="ref_lotnetamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_lotvatamt" v-model="M_SM_LotSellingPrice.lotvatamt"  ref="ref_lotvatamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_lottotalamt" v-model="M_SM_LotSellingPrice.lottotalamt"  ref="ref_lottotalamt"/>
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
                                                <b-col md="3" style="padding-left: 10px !important">
                                                  <ABSTextBoxOnly @input="OnvopriceChange" :prop="PI_voprice" v-model="M_SM_LotSellingPrice.voprice"  ref="ref_voprice"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSInputSelectListOnly @change="OnvotaxcdChange" :prop="PI_votaxcd" :value="M_SM_LotSellingPrice.votaxcd" :label="M_SM_LotSellingPrice.votaxcdLabel" ref="ref_votaxcd"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSInputSelectListOnly @change="OnvodiscountcdChange" :prop="PI_vodiscountcd" :value="M_SM_LotSellingPrice.vodiscountcd" :label="M_SM_LotSellingPrice.vodiscountcdLabel" ref="ref_vodiscountcd"/>
                                                </b-col>
                                                <b-col md="3" style="padding-right: 10px !important">
                                                  <ABSTextBoxOnly :prop="PI_vodiscamt" v-model="M_SM_LotSellingPrice.vodiscamt"  ref="ref_vodiscamt"/>
                                                </b-col>
                                              </b-row>
                                            </b-col>
                                            <b-col md="5">
                                              <b-row>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_voafterdiscamt" v-model="M_SM_LotSellingPrice.voafterdiscamt"  ref="ref_voafterdiscamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_vonetamt" v-model="M_SM_LotSellingPrice.vonetamt"  ref="ref_vonetamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_vovatamt" v-model="M_SM_LotSellingPrice.vovatamt"  ref="ref_vovatamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_vototalamt" v-model="M_SM_LotSellingPrice.vototalamt"  ref="ref_vototalamt"/>
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
                                                  <ABSTextBoxOnly @input="OnotherpriceChange" :prop="PI_otherprice" v-model="M_SM_LotSellingPrice.otherprice"  ref="ref_otherprice"/>
                                                </b-col>                                          
                                                <b-col  md="3">
                                                  <ABSInputSelectListOnly @change="OnothertaxcdChange" :prop="PI_othertaxcd" :value="M_SM_LotSellingPrice.othertaxcd" :label="M_SM_LotSellingPrice.othertaxcdLabel" ref="ref_othertaxcd"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSInputSelectListOnly @change="OnotherdiscountcdChange" :prop="PI_otherdiscountcd" :value="M_SM_LotSellingPrice.otherdiscountcd" :label="M_SM_LotSellingPrice.otherdiscountcdLabel" ref="ref_otherdiscountcd"/>
                                                </b-col>
                                                <b-col md="3" style="padding-right: 10px !important">
                                                  <ABSTextBoxOnly :prop="PI_otherdiscamt" v-model="M_SM_LotSellingPrice.otherdiscamt"  ref="ref_otherdiscamt"/>
                                                </b-col>
                                              </b-row>
                                            </b-col>
                                            <b-col md="5">
                                              <b-row>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_otherafterdiscamt" v-model="M_SM_LotSellingPrice.otherafterdiscamt"  ref="ref_otherafterdiscamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_othernetamt" v-model="M_SM_LotSellingPrice.othernetamt"  ref="ref_othernetamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_othervatamt" v-model="M_SM_LotSellingPrice.othervatamt"  ref="ref_othervatamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_othertotalamt" v-model="M_SM_LotSellingPrice.othertotalamt"  ref="ref_othertotalamt"/>
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
                                                  <ABSTextBoxOnly :prop="PI_totaltrxamt" v-model="M_SM_LotSellingPrice.totaltrxamt"  ref="ref_totaltrxamt"/>
                                                </b-col>
                                                <b-col  md="3">
                                                </b-col>
                                                <b-col  md="3">
                                                </b-col>
                                                <b-col md="3" style="padding-right: 10px !important">
                                                  <ABSTextBoxOnly :prop="PI_totaldiscamt" v-model="M_SM_LotSellingPrice.totaldiscamt"  ref="ref_totaldiscamt"/>
                                                </b-col>
                                              </b-row>
                                            </b-col>
                                            <b-col md="5">
                                              <b-row>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_totalafterdiscamt" v-model="M_SM_LotSellingPrice.totalafterdiscamt"  ref="ref_totalafterdiscamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_totalnetamt" v-model="M_SM_LotSellingPrice.totalnetamt"  ref="ref_totalnetamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_totalvatamt" v-model="M_SM_LotSellingPrice.totalvatamt"  ref="ref_totalvatamt"/>
                                                </b-col>
                                                <b-col md="3">
                                                  <ABSTextBoxOnly :prop="PI_grandtotal" v-model="M_SM_LotSellingPrice.grandtotal"  ref="ref_grandtotal"/>
                                                </b-col>
                                              </b-row>
                                            </b-col>
                                          </b-row>
                                          <b-row>
                                            <b-col  md="6">
                                              <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_LotSellingPrice.remarks"  ref="ref_remarks" />
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
          // statusOnChangeAmt: true,
          // statusOnChangePercent: true,
          statusOnChange: 0,
			ValKey:null,
      FormType: "List",
      Module:"SM",
      propList: {
                initialWhere:"LotNo = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_LotSellingPrice :{
                salestypecd: '',
                salestype: '',
                fromdate: '',
                todate: '',
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
                otherdiscountcd: '',
                sequenceno: 0,
                lastupdatestamp: 0,
                    }
            ,
            PI_salestypecd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSMSalesType'    , 
                    ColumnDB: 'SalesTypeCd'   , 
                    InitialWhere: "SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'SalesTypeCd,Descs' 
                        }, 
                cValidate :'required', 
                cName: 'salestypeeecd', 
                cLabel: 'Sales Type', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 101, 
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
                cMasterUrl: 'SM/SM_SalesType' ,
                cDisplayColumn: 'SalesTypeCd,Descs' ,
            }, 
            PI_fromdate: { 
                cValidate :'required', 
                cName: 'fromdate', 
                cLabel: 'From Date', 
                cLabelSize: 4, 
                cOrder: 102, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_buildingprice: { 
                cValidate :'', 
                cName: 'buildingprice', 
                cLabel: 'Building Price', 
                cLabelSize: 4, 
                cOrder: 103, 
                cKey: false, 
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
                cOrder: 104, 
                cKey: false, 
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
                cOrder: 105, 
                cKey: false, 
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
                cOrder: 106, 
                cKey: false, 
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
                cOrder: 107, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_lottaxcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTaxCode'    , 
                    ColumnDB: 'TaxCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'TaxCd, Descs' 
                        }, 
                cValidate :'', 
                cName: 'lottaxcd', 
                cLabel: '', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 108 , 
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
                cDisplayColumn: 'TaxCd, Descs' ,
            }, 
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
                cOrder: 109, 
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
                cOrder: 110, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_lotafterdiscamt: { 
                cValidate :'', 
                cName: 'lotafterdiscamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 111, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_lotnetamt: { 
                cValidate :'', 
                cName: 'lotnetamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 112, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_lotvatamt: { 
                cValidate :'', 
                cName: 'lotvatamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 113, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_lottotalamt: { 
                cValidate :'', 
                cName: 'lottotalamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 114, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_voprice: { 
                cValidate :'', 
                cName: 'voprice', 
                cLabel: 'VO Price', 
                cLabelSize: 4, 
                cOrder: 115, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_votaxcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTaxCode'    , 
                    ColumnDB: 'TaxCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'TaxCd, Descs' 
                        }, 
                cValidate :'', 
                cName: 'votaxcd', 
                cLabel: '', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 116, 
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
                cDisplayColumn: 'TaxCd, Descs' ,
            }, 
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
                cOrder: 117, 
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
                cOrder: 118, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_voafterdiscamt: { 
                cValidate :'', 
                cName: 'voafterdiscamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 119, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_vonetamt: { 
                cValidate :'', 
                cName: 'vonetamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 120, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_vovatamt: { 
                cValidate :'', 
                cName: 'vovatamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 121, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_vototalamt: { 
                cValidate :'', 
                cName: 'vototalamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 122, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_otherprice: { 
                cValidate :'', 
                cName: 'otherprice', 
                cLabel: 'Other', 
                cLabelSize: 4, 
                cOrder: 123, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_othertaxcd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMTaxCode'    , 
                    ColumnDB: 'TaxCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'TaxCd, Descs' 
                        }, 
                cValidate :'', 
                cName: 'othertaxcd', 
                cLabel: '', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 124, 
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
                cDisplayColumn: 'TaxCd, Descs' ,
            }, 
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
                cOrder: 125, 
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
                cOrder: 126, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_otherafterdiscamt: { 
                cValidate :'', 
                cName: 'otherafterdiscamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 127, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_othernetamt: { 
                cValidate :'', 
                cName: 'othernetamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 128, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_othervatamt: { 
                cValidate :'', 
                cName: 'othervatamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 129, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_othertotalamt: { 
                cValidate :'', 
                cName: 'othertotalamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 130, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_totaltrxamt: { 
                cValidate :'', 
                cName: 'totaltrxamt', 
                cLabel: 'Total Selling Price', 
                cLabelSize: 4, 
                cOrder: 131, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_totaldiscamt: { 
                cValidate :'', 
                cName: 'totaldiscamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 132, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_totalafterdiscamt: { 
                cValidate :'', 
                cName: 'totalafterdiscamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 133, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_totalnetamt: { 
                cValidate :'', 
                cName: 'totalnetamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 134, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_totalvatamt: { 
                cValidate :'', 
                cName: 'totalvatamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 135, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_grandtotal: { 
                cValidate :'', 
                cName: 'grandtotal', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 136, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Remarks', 
                cLabelSize: 4, 
                cOrder: 137, 
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
      GetTotalAll(){
        var vBuildingAmt = this.replaceAllString(this.M_SM_LotSellingPrice.buildingprice, ',', '', 'number')
        var vLandAmt = this.replaceAllString(this.M_SM_LotSellingPrice.landprice, ',', '', 'number')
        var vInterestPercentage = this.replaceAllString(this.M_SM_LotSellingPrice.interestpercentage, ',', '', 'number')
        var vInterestAmt = this.replaceAllString(this.M_SM_LotSellingPrice.interestamt, ',', '', 'number')

        //unit price
        var vLotPrice = this.replaceAllString(this.M_SM_LotSellingPrice.lottrxamt, ',', '', 'number')
        var vLotTaxCd = this.M_SM_LotSellingPrice.lottaxcd
        var vLotDiscCd = this.M_SM_LotSellingPrice.lotdiscountcd
        var vLotDiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.lotdiscamt, ',', '', 'number')
        var vLotAfterDiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.lotafterdiscamt, ',', '', 'number')
        var vLotNetAmt = this.replaceAllString(this.M_SM_LotSellingPrice.lotnetamt, ',', '', 'number')
        var vLotVATAmt = this.replaceAllString(this.M_SM_LotSellingPrice.lotvatamt, ',', '', 'number')
        var vLotTotalAmt = this.replaceAllString(this.M_SM_LotSellingPrice.lottotalamt, ',', '', 'number')

        //vo price
        var vVOPrice = this.M_SM_LotSellingPrice.voprice ? this.replaceAllString(this.M_SM_LotSellingPrice.voprice, ',', '', 'number') : 0
        var vVOTaxCd = this.M_SM_LotSellingPrice.votaxcd
        var vVODiscCd = this.M_SM_LotSellingPrice.vodiscountcd
        var vVODiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.vodiscamt, ',', '', 'number')
        var vVOAfterDiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.voafterdiscamt, ',', '', 'number')
        var vVONetAmt = this.replaceAllString(this.M_SM_LotSellingPrice.vonetamt, ',', '', 'number')
        var vVOVATAmt = this.replaceAllString(this.M_SM_LotSellingPrice.vovatamt, ',', '', 'number')
        var vVOTotalAmt = this.replaceAllString(this.M_SM_LotSellingPrice.vototalamt, ',', '', 'number')
        
        //other price
        var vOtherPrice = this.M_SM_LotSellingPrice.otherprice ? this.replaceAllString(this.M_SM_LotSellingPrice.otherprice, ',', '', 'number') : 0
        var vOtherTaxCd = this.M_SM_LotSellingPrice.othertaxcd
        var vOtherDiscCd = this.M_SM_LotSellingPrice.otherdiscountcd
        var vOtherDiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.otherdiscamt, ',', '', 'number')
        var vOtherAfterDiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.otherafterdiscamt, ',', '', 'number')
        var vOtherNetAmt = this.replaceAllString(this.M_SM_LotSellingPrice.othernetamt, ',', '', 'number')
        var vOtherVATAmt = this.replaceAllString(this.M_SM_LotSellingPrice.othervatamt, ',', '', 'number')
        var vOtherTotalAmt = this.replaceAllString(this.M_SM_LotSellingPrice.othertotalamt, ',', '', 'number')
        
        //Hitung Total Bawah Unit
        var vTotalTrxAmt = parseFloat(vLotPrice) + parseFloat(vVOPrice) + parseFloat(vOtherPrice)
        var vTotalDiscAmt = parseFloat(vLotDiscAmt) + parseFloat(vVODiscAmt) + parseFloat(vOtherDiscAmt)  
        var vTotalAfterDiscAmt = parseFloat(vLotAfterDiscAmt) + parseFloat(vVOAfterDiscAmt) + parseFloat(vOtherAfterDiscAmt)
        var vTotalNetAmt = parseFloat(vLotNetAmt) + parseFloat(vVONetAmt) + parseFloat(vOtherNetAmt)
        var vTotalVATAmt = parseFloat(vLotVATAmt) + parseFloat(vVOVATAmt) + parseFloat(vOtherVATAmt)
        var vGrandTotal = parseFloat(vLotTotalAmt) + parseFloat(vVOTotalAmt) + parseFloat(vOtherTotalAmt)

        this.M_SM_LotSellingPrice.totaltrxamt = this.isCurrency(vTotalTrxAmt, this.decimal)
        this.M_SM_LotSellingPrice.totaldiscamt = this.isCurrency(vTotalDiscAmt, this.decimal)
        this.M_SM_LotSellingPrice.totalafterdiscamt = this.isCurrency(vTotalAfterDiscAmt, this.decimal)
        this.M_SM_LotSellingPrice.totalnetamt = this.isCurrency(vTotalNetAmt, this.decimal)
        this.M_SM_LotSellingPrice.totalvatamt = this.isCurrency(vTotalVATAmt, this.decimal)
        this.M_SM_LotSellingPrice.grandtotal = this.isCurrency(vGrandTotal, this.decimal)

      },
      GetCalculateUnit () {
        var vBuildingAmt = this.replaceAllString(this.M_SM_LotSellingPrice.buildingprice, ',', '', 'number')
        var vLandAmt = this.replaceAllString(this.M_SM_LotSellingPrice.landprice, ',', '', 'number')
        var vInterestPercentage = this.replaceAllString(this.M_SM_LotSellingPrice.interestpercentage, ',', '', 'number')
        var vInterestAmt = this.replaceAllString(this.M_SM_LotSellingPrice.interestamt, ',', '', 'number')

        //unit price
        var vLotPrice = this.replaceAllString(this.M_SM_LotSellingPrice.lottrxamt, ',', '', 'number')
        var vLotTaxCd = this.M_SM_LotSellingPrice.lottaxcd
        var vLotDiscCd = this.M_SM_LotSellingPrice.lotdiscountcd
        var vLotDiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.lotdiscamt, ',', '', 'number')
        var vLotAfterDiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.lotafterdiscamt, ',', '', 'number')
        var vLotNetAmt = this.replaceAllString(this.M_SM_LotSellingPrice.lotnetamt, ',', '', 'number')
        var vLotVATAmt = this.replaceAllString(this.M_SM_LotSellingPrice.lotvatamt, ',', '', 'number')
        var vLotTotalAmt = this.replaceAllString(this.M_SM_LotSellingPrice.lottotalamt, ',', '', 'number')

        //vo price
        var vVOPrice = this.M_SM_LotSellingPrice.voprice ? this.replaceAllString(this.M_SM_LotSellingPrice.voprice, ',', '', 'number') : 0
        var vVOTaxCd = this.M_SM_LotSellingPrice.votaxcd
        var vVODiscCd = this.M_SM_LotSellingPrice.vodiscountcd
        var vVODiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.vodiscamt, ',', '', 'number')
        var vVOAfterDiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.voafterdiscamt, ',', '', 'number')
        var vVONetAmt = this.replaceAllString(this.M_SM_LotSellingPrice.vonetamt, ',', '', 'number')
        var vVOVATAmt = this.replaceAllString(this.M_SM_LotSellingPrice.vovatamt, ',', '', 'number')
        var vVOTotalAmt = this.replaceAllString(this.M_SM_LotSellingPrice.vototalamt, ',', '', 'number')
        
        //other price
        var vOtherPrice = this.M_SM_LotSellingPrice.otherprice ? this.replaceAllString(this.M_SM_LotSellingPrice.otherprice, ',', '', 'number') : 0
        var vOtherTaxCd = this.M_SM_LotSellingPrice.othertaxcd
        var vOtherDiscCd = this.M_SM_LotSellingPrice.otherdiscountcd
        var vOtherDiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.otherdiscamt, ',', '', 'number')
        var vOtherAfterDiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.otherafterdiscamt, ',', '', 'number')
        var vOtherNetAmt = this.replaceAllString(this.M_SM_LotSellingPrice.othernetamt, ',', '', 'number')
        var vOtherVATAmt = this.replaceAllString(this.M_SM_LotSellingPrice.othervatamt, ',', '', 'number')
        var vOtherTotalAmt = this.replaceAllString(this.M_SM_LotSellingPrice.othertotalamt, ',', '', 'number')
        vInterestPercentage = vInterestPercentage && vInterestPercentage != '' ? vInterestPercentage : 0
        // if(vInterestPercentage >= 0){
          // vInterestAmt = (vInterestPercentage / 100) * (parseFloat(vBuildingAmt) + parseFloat(vLandAmt))

          
          
        // }

        vLotPrice = parseFloat(vBuildingAmt) + parseFloat(vLandAmt) + parseFloat(vInterestAmt)
        
        if(vLotDiscCd != "" && vLotDiscCd != null){
          var param = {
              OptionFunctionCd: "GetSMCalculateDiscount",
              ModuleCd: this.Module,
              SubPortfolioCd: this.getDataUser().subportfolio_cd,
              BasePrice: vLotPrice,
              DiscCd: vLotDiscCd,
              DiscAmount_Output: 0
            }

            this.FnDynamicFunction(param)
              .then(ress => {
                var data = ress
                vLotDiscAmt = data.DiscAmount //this.isCurrency(data.DiscAmount,this.decimal)
                vLotAfterDiscAmt = parseFloat(vLotPrice) - parseFloat(vLotDiscAmt)

                this.M_SM_LotSellingPrice.lotdiscamt = this.isCurrency(vLotDiscAmt, this.decimal)
                this.M_SM_LotSellingPrice.lotafterdiscamt = this.isCurrency(vLotAfterDiscAmt, this.decimal)

                //hitung tax cd

                if(vLotTaxCd != "" && vLotTaxCd != null){
                var param = {
                    OptionFunctionCd: "SMCalculateTax",
                    ModuleCd: this.Module,
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
                    AfterDiscountAmt: vLotAfterDiscAmt,
                    TaxCd: vLotTaxCd,
                    BaseAmt_Output:0,
                    TaxAmt_Output:0
                  }

                  this.FnDynamicFunction(param)
                    .then(ress => {
                  
                        // var data = ress[0]
                        var data = ress
                        vLotNetAmt = data.BaseAmt //this.isCurrency(data.BaseAmt,this.decimal)
                        vLotVATAmt = data.TaxAmt //this.isCurrency(data.TaxAmt,this.decimal)
                      
                        vLotTotalAmt = parseFloat(vLotNetAmt) + parseFloat(vLotVATAmt) 

                        this.M_SM_LotSellingPrice.lotnetamt = this.isCurrency(vLotNetAmt, this.decimal)
                        this.M_SM_LotSellingPrice.lotvatamt = this.isCurrency(vLotVATAmt, this.decimal)
                        this.M_SM_LotSellingPrice.lottotalamt = this.isCurrency(vLotTotalAmt, this.decimal)

                        this.GetTotalAll()
                    })
                }
                else{
                  vLotNetAmt = vLotAfterDiscAmt
                  vLotVATAmt = 0
                  
                  vLotTotalAmt = parseFloat(vLotNetAmt) + parseFloat(vLotVATAmt) 

                  this.M_SM_LotSellingPrice.lotnetamt = this.isCurrency(vLotNetAmt, this.decimal)
                  this.M_SM_LotSellingPrice.lotvatamt = this.isCurrency(vLotVATAmt, this.decimal)
                  this.M_SM_LotSellingPrice.lottotalamt = this.isCurrency(vLotTotalAmt, this.decimal)
                  this.GetTotalAll()
                }
              
              })
                //hitung tax cd

          }
          else{
            vLotDiscAmt = 0
            vLotAfterDiscAmt = parseFloat(vLotPrice) - parseFloat(vLotDiscAmt)

            this.M_SM_LotSellingPrice.lotdiscamt = this.isCurrency(vLotDiscAmt, this.decimal)
            this.M_SM_LotSellingPrice.lotafterdiscamt = this.isCurrency(vLotAfterDiscAmt, this.decimal)

            //hitung tax cd 2

                if(vLotTaxCd != "" && vLotTaxCd != null){
                var param = {
                    OptionFunctionCd: "SMCalculateTax",
                    ModuleCd: this.Module,
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
                    AfterDiscountAmt: vLotAfterDiscAmt,
                    TaxCd: vLotTaxCd,
                    BaseAmt_Output:0,
                    TaxAmt_Output:0
                  }

                  this.FnDynamicFunction(param)
                    .then(ress => {
                  
                        // var data = ress[0]
                        var data = ress
                        vLotNetAmt = data.BaseAmt //this.isCurrency(data.BaseAmt,this.decimal)
                        vLotVATAmt = data.TaxAmt //this.isCurrency(data.TaxAmt,this.decimal)
                      
                        vLotTotalAmt = parseFloat(vLotNetAmt) + parseFloat(vLotVATAmt) 

                        this.M_SM_LotSellingPrice.lotnetamt = this.isCurrency(vLotNetAmt, this.decimal)
                        this.M_SM_LotSellingPrice.lotvatamt = this.isCurrency(vLotVATAmt, this.decimal)
                        this.M_SM_LotSellingPrice.lottotalamt = this.isCurrency(vLotTotalAmt, this.decimal)

                        this.GetTotalAll()
                    })
                }
                else{
                  vLotNetAmt = vLotAfterDiscAmt
                  vLotVATAmt = 0
                  
                  vLotTotalAmt = parseFloat(vLotNetAmt) + parseFloat(vLotVATAmt) 

                  this.M_SM_LotSellingPrice.lotnetamt = this.isCurrency(vLotNetAmt, this.decimal)
                  this.M_SM_LotSellingPrice.lotvatamt = this.isCurrency(vLotVATAmt, this.decimal)
                  this.M_SM_LotSellingPrice.lottotalamt = this.isCurrency(vLotTotalAmt, this.decimal)

                  this.GetTotalAll()
                }
                //hitung tax cd2
          }
        
        vLotAfterDiscAmt = parseFloat(vLotPrice) - parseFloat(vLotDiscAmt)
        
        // this.M_SM_LotSellingPrice.interestamt = this.isCurrency(vInterestAmt, this.decimal)
        this.M_SM_LotSellingPrice.lottrxamt = this.isCurrency(vLotPrice, this.decimal)
      
      },
        GetCalculateVO(){
            //unit price
            var vLotPrice = this.replaceAllString(this.M_SM_LotSellingPrice.lottrxamt, ',', '', 'number')
            var vLotTaxCd = this.M_SM_LotSellingPrice.lottaxcd
            var vLotDiscCd = this.M_SM_LotSellingPrice.lotdiscountcd
            var vLotDiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.lotdiscamt, ',', '', 'number')
            var vLotAfterDiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.lotafterdiscamt, ',', '', 'number')
            var vLotNetAmt = this.replaceAllString(this.M_SM_LotSellingPrice.lotnetamt, ',', '', 'number')
            var vLotVATAmt = this.replaceAllString(this.M_SM_LotSellingPrice.lotvatamt, ',', '', 'number')
            var vLotTotalAmt = this.replaceAllString(this.M_SM_LotSellingPrice.lottotalamt, ',', '', 'number')

            //vo price
            var vVOPrice = this.M_SM_LotSellingPrice.voprice ? this.replaceAllString(this.M_SM_LotSellingPrice.voprice, ',', '', 'number') : 0
            var vVOTaxCd = this.M_SM_LotSellingPrice.votaxcd
            var vVODiscCd = this.M_SM_LotSellingPrice.vodiscountcd
            var vVODiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.vodiscamt, ',', '', 'number')
            var vVOAfterDiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.voafterdiscamt, ',', '', 'number')
            var vVONetAmt = this.replaceAllString(this.M_SM_LotSellingPrice.vonetamt, ',', '', 'number')
            var vVOVATAmt = this.replaceAllString(this.M_SM_LotSellingPrice.vovatamt, ',', '', 'number')
            var vVOTotalAmt = this.replaceAllString(this.M_SM_LotSellingPrice.vototalamt, ',', '', 'number')
            
            //other price
            var vOtherPrice = this.M_SM_LotSellingPrice.otherprice ? this.replaceAllString(this.M_SM_LotSellingPrice.otherprice, ',', '', 'number') : 0
            var vOtherTaxCd = this.M_SM_LotSellingPrice.othertaxcd
            var vOtherDiscCd = this.M_SM_LotSellingPrice.otherdiscountcd
            var vOtherDiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.otherdiscamt, ',', '', 'number')
            var vOtherAfterDiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.otherafterdiscamt, ',', '', 'number')
            var vOtherNetAmt = this.replaceAllString(this.M_SM_LotSellingPrice.othernetamt, ',', '', 'number')
            var vOtherVATAmt = this.replaceAllString(this.M_SM_LotSellingPrice.othervatamt, ',', '', 'number')
            var vOtherTotalAmt = this.replaceAllString(this.M_SM_LotSellingPrice.othertotalamt, ',', '', 'number')
            
            if(vVODiscCd != "" && vVODiscCd != null){
              var param = {
                  OptionFunctionCd: "GetSMCalculateDiscount",
                  ModuleCd: this.Module,
                  SubPortfolioCd: this.getDataUser().subportfolio_cd,
                  BasePrice: vVOPrice,
                  DiscCd: vVODiscCd,
                  DiscAmount_Output: 0
                }

                this.FnDynamicFunction(param)
                  .then(ress => {
                    var data = ress
                    vVODiscAmt = data.DiscAmount //this.isCurrency(data.DiscAmount,this.decimal)
                    vVOAfterDiscAmt = parseFloat(vVOPrice) - parseFloat(vVODiscAmt)

                    this.M_SM_LotSellingPrice.vodiscamt = this.isCurrency(vVODiscAmt, this.decimal)
                    this.M_SM_LotSellingPrice.voafterdiscamt = this.isCurrency(vVOAfterDiscAmt, this.decimal)

                    //hitung VO tax cd

                    if(vVOTaxCd != "" && vVOTaxCd != null){
                    var param = {
                        OptionFunctionCd: "SMCalculateTax",
                        ModuleCd: this.Module,
                        SubPortfolioCd: this.getDataUser().subportfolio_cd,
                        AfterDiscountAmt: vVOAfterDiscAmt,
                        TaxCd: vVOTaxCd,
                        BaseAmt_Output:0,
                        TaxAmt_Output:0
                      }

                      this.FnDynamicFunction(param)
                        .then(ress => {
                      
                            // var data = ress[0]
                            var data = ress
                            vVONetAmt = data.BaseAmt //this.isCurrency(data.BaseAmt,this.decimal)
                            vVOVATAmt = data.TaxAmt //this.isCurrency(data.TaxAmt,this.decimal)
                          
                            vVOTotalAmt = parseFloat(vVONetAmt) + parseFloat(vVOVATAmt) 

                            this.M_SM_LotSellingPrice.vonetamt = this.isCurrency(vVONetAmt, this.decimal)
                            this.M_SM_LotSellingPrice.vovatamt = this.isCurrency(vVOVATAmt, this.decimal)
                            this.M_SM_LotSellingPrice.vototalamt = this.isCurrency(vVOTotalAmt, this.decimal)

                            this.GetTotalAll()
                            // //Hitung Total Bawah VO
                            // var vTotalTrxAmt = parseFloat(vLotPrice) + parseFloat(vVOPrice) + parseFloat(vOtherPrice)
                            // var vTotalDiscAmt = parseFloat(vLotDiscAmt) + parseFloat(vVODiscAmt) + parseFloat(vOtherDiscAmt)  
                            // var vTotalAfterDiscAmt = parseFloat(vLotAfterDiscAmt) + parseFloat(vVOAfterDiscAmt) + parseFloat(vOtherAfterDiscAmt)
                            // var vTotalNetAmt = parseFloat(vLotNetAmt) + parseFloat(vVONetAmt) + parseFloat(vOtherNetAmt)
                            // var vTotalVATAmt = parseFloat(vLotVATAmt) + parseFloat(vVOVATAmt) + parseFloat(vOtherVATAmt)
                            // var vGrandTotal = parseFloat(vLotTotalAmt) + parseFloat(vVOTotalAmt) + parseFloat(vOtherTotalAmt)

                            // this.M_SM_LotSellingPrice.totaltrxamt = this.isCurrency(vTotalTrxAmt, this.decimal)
                            // this.M_SM_LotSellingPrice.totaldiscamt = this.isCurrency(vTotalDiscAmt, this.decimal)
                            // this.M_SM_LotSellingPrice.totalafterdiscamt = this.isCurrency(vTotalAfterDiscAmt, this.decimal)
                            // this.M_SM_LotSellingPrice.totalnetamt = this.isCurrency(vTotalNetAmt, this.decimal)
                            // this.M_SM_LotSellingPrice.totalvatamt = this.isCurrency(vTotalVATAmt, this.decimal)
                            // this.M_SM_LotSellingPrice.grandtotal = this.isCurrency(vGrandTotal, this.decimal)
                        })
                    }
                    else{
                      vVONetAmt = vVOAfterDiscAmt
                      vVOVATAmt = 0
                      
                      vVOTotalAmt = parseFloat(vVONetAmt) + parseFloat(vVOVATAmt) 

                      this.M_SM_LotSellingPrice.vonetamt = this.isCurrency(vVONetAmt, this.decimal)
                      this.M_SM_LotSellingPrice.vovatamt = this.isCurrency(vVOVATAmt, this.decimal)
                      this.M_SM_LotSellingPrice.vototalamt = this.isCurrency(vVOTotalAmt, this.decimal)

                      //Hitung Total Bawah VO
                      var vTotalTrxAmt = parseFloat(vLotPrice) + parseFloat(vVOPrice) + parseFloat(vOtherPrice)
                      var vTotalDiscAmt = parseFloat(vLotDiscAmt) + parseFloat(vVODiscAmt) + parseFloat(vOtherDiscAmt)  
                      var vTotalAfterDiscAmt = parseFloat(vLotAfterDiscAmt) + parseFloat(vVOAfterDiscAmt) + parseFloat(vOtherAfterDiscAmt)
                      var vTotalNetAmt = parseFloat(vLotNetAmt) + parseFloat(vVONetAmt) + parseFloat(vOtherNetAmt)
                      var vTotalVATAmt = parseFloat(vLotVATAmt) + parseFloat(vVOVATAmt) + parseFloat(vOtherVATAmt)
                      var vGrandTotal = parseFloat(vLotTotalAmt) + parseFloat(vVOTotalAmt) + parseFloat(vOtherTotalAmt)

                      this.M_SM_LotSellingPrice.totaltrxamt = this.isCurrency(vTotalTrxAmt, this.decimal)
                      this.M_SM_LotSellingPrice.totaldiscamt = this.isCurrency(vTotalDiscAmt, this.decimal)
                      this.M_SM_LotSellingPrice.totalafterdiscamt = this.isCurrency(vTotalAfterDiscAmt, this.decimal)
                      this.M_SM_LotSellingPrice.totalnetamt = this.isCurrency(vTotalNetAmt, this.decimal)
                      this.M_SM_LotSellingPrice.totalvatamt = this.isCurrency(vTotalVATAmt, this.decimal)
                      this.M_SM_LotSellingPrice.grandtotal = this.isCurrency(vGrandTotal, this.decimal)
                    }
                  
                  })
                    //hitung tax cd

                    // //Hitung Total Bawah VO
                    // var vTotalTrxAmt = parseFloat(vLotPrice) + parseFloat(vVOPrice) + parseFloat(vOtherPrice)
                    // var vTotalDiscAmt = parseFloat(vLotDiscAmt) + parseFloat(vVODiscAmt) + parseFloat(vOtherDiscAmt)  
                    // var vTotalAfterDiscAmt = parseFloat(vLotAfterDiscAmt) + parseFloat(vVOAfterDiscAmt) + parseFloat(vOtherAfterDiscAmt)
                    // var vTotalNetAmt = parseFloat(vLotNetAmt) + parseFloat(vVONetAmt) + parseFloat(vOtherNetAmt)
                    // var vTotalVATAmt = parseFloat(vLotVATAmt) + parseFloat(vVOVATAmt) + parseFloat(vOtherVATAmt)
                    // var vGrandTotal = parseFloat(vLotTotalAmt) + parseFloat(vVOTotalAmt) + parseFloat(vOtherTotalAmt)

                    // this.M_SM_LotSellingPrice.totaltrxamt = this.isCurrency(vTotalTrxAmt, this.decimal)
                    // this.M_SM_LotSellingPrice.totaldiscamt = this.isCurrency(vTotalDiscAmt, this.decimal)
                    // this.M_SM_LotSellingPrice.totalafterdiscamt = this.isCurrency(vTotalAfterDiscAmt, this.decimal)
                    // this.M_SM_LotSellingPrice.totalnetamt = this.isCurrency(vTotalNetAmt, this.decimal)
                    // this.M_SM_LotSellingPrice.totalvatamt = this.isCurrency(vTotalVATAmt, this.decimal)
                    // this.M_SM_LotSellingPrice.grandtotal = this.isCurrency(vGrandTotal, this.decimal)
                      

              }
              else{
                vVODiscAmt = 0
                vVOAfterDiscAmt = parseFloat(vVOPrice) - parseFloat(vVODiscAmt)

                this.M_SM_LotSellingPrice.vodiscamt = this.isCurrency(vVODiscAmt, this.decimal)
                this.M_SM_LotSellingPrice.voafterdiscamt = this.isCurrency(vVOAfterDiscAmt, this.decimal)

                  //hitung VO tax cd 2

                    if(vVOTaxCd != "" && vVOTaxCd != null){
                    var param = {
                        OptionFunctionCd: "SMCalculateTax",
                        ModuleCd: this.Module,
                        SubPortfolioCd: this.getDataUser().subportfolio_cd,
                        AfterDiscountAmt: vVOAfterDiscAmt,
                        TaxCd: vVOTaxCd,
                        BaseAmt_Output:0,
                        TaxAmt_Output:0
                      }

                      this.FnDynamicFunction(param)
                        .then(ress => {
                      
                            // var data = ress[0]
                            var data = ress
                            vVONetAmt = data.BaseAmt //this.isCurrency(data.BaseAmt,this.decimal)
                            vVOVATAmt = data.TaxAmt //this.isCurrency(data.TaxAmt,this.decimal)
                          
                            vVOTotalAmt = parseFloat(vVONetAmt) + parseFloat(vVOVATAmt) 

                            this.M_SM_LotSellingPrice.vonetamt = this.isCurrency(vVONetAmt, this.decimal)
                            this.M_SM_LotSellingPrice.vovatamt = this.isCurrency(vVOVATAmt, this.decimal)
                            this.M_SM_LotSellingPrice.vototalamt = this.isCurrency(vVOTotalAmt, this.decimal)
                        })
                    }
                    else{
                      vVONetAmt = vVOAfterDiscAmt
                      vVOVATAmt = 0
                      
                      vVOTotalAmt = parseFloat(vVONetAmt) + parseFloat(vVOVATAmt) 

                      this.M_SM_LotSellingPrice.vonetamt = this.isCurrency(vVONetAmt, this.decimal)
                      this.M_SM_LotSellingPrice.vovatamt = this.isCurrency(vVOVATAmt, this.decimal)
                      this.M_SM_LotSellingPrice.vototalamt = this.isCurrency(vVOTotalAmt, this.decimal)
                    }
                  
                    //hitung VO tax cd 2
                    this.GetTotalAll()
                    // //Hitung Total Bawah VO 2
                    //   var vTotalTrxAmt = parseFloat(vLotPrice) + parseFloat(vVOPrice) + parseFloat(vOtherPrice)
                    //   var vTotalDiscAmt = parseFloat(vLotDiscAmt) + parseFloat(vVODiscAmt) + parseFloat(vOtherDiscAmt)  
                    //   var vTotalAfterDiscAmt = parseFloat(vLotAfterDiscAmt) + parseFloat(vVOAfterDiscAmt) + parseFloat(vOtherAfterDiscAmt)
                    //   var vTotalNetAmt = parseFloat(vLotNetAmt) + parseFloat(vVONetAmt) + parseFloat(vOtherNetAmt)
                    //   var vTotalVATAmt = parseFloat(vLotVATAmt) + parseFloat(vVOVATAmt) + parseFloat(vOtherVATAmt)
                    //   var vGrandTotal = parseFloat(vLotTotalAmt) + parseFloat(vVOTotalAmt) + parseFloat(vOtherTotalAmt)

                    //   this.M_SM_LotSellingPrice.totaltrxamt = this.isCurrency(vTotalTrxAmt, this.decimal)
                    //   this.M_SM_LotSellingPrice.totaldiscamt = this.isCurrency(vTotalDiscAmt, this.decimal)
                    //   this.M_SM_LotSellingPrice.totalafterdiscamt = this.isCurrency(vTotalAfterDiscAmt, this.decimal)
                    //   this.M_SM_LotSellingPrice.totalnetamt = this.isCurrency(vTotalNetAmt, this.decimal)
                    //   this.M_SM_LotSellingPrice.totalvatamt = this.isCurrency(vTotalVATAmt, this.decimal)
                    //   this.M_SM_LotSellingPrice.grandtotal = this.isCurrency(vGrandTotal, this.decimal)
              }
            
            vVOAfterDiscAmt = parseFloat(vVOPrice) - parseFloat(vVODiscAmt)
            
            
            this.M_SM_LotSellingPrice.voprice = vVOPrice
        },
        GetCalculateOther(){
            //unit price
            var vLotPrice = this.replaceAllString(this.M_SM_LotSellingPrice.lottrxamt, ',', '', 'number')
            var vLotTaxCd = this.M_SM_LotSellingPrice.lottaxcd
            var vLotDiscCd = this.M_SM_LotSellingPrice.lotdiscountcd
            var vLotDiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.lotdiscamt, ',', '', 'number')
            var vLotAfterDiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.lotafterdiscamt, ',', '', 'number')
            var vLotNetAmt = this.replaceAllString(this.M_SM_LotSellingPrice.lotnetamt, ',', '', 'number')
            var vLotVATAmt = this.replaceAllString(this.M_SM_LotSellingPrice.lotvatamt, ',', '', 'number')
            var vLotTotalAmt = this.replaceAllString(this.M_SM_LotSellingPrice.lottotalamt, ',', '', 'number')

            //vo price
            var vVOPrice = this.M_SM_LotSellingPrice.voprice ? this.replaceAllString(this.M_SM_LotSellingPrice.voprice, ',', '', 'number') : 0
            var vVOTaxCd = this.M_SM_LotSellingPrice.votaxcd
            var vVODiscCd = this.M_SM_LotSellingPrice.vodiscountcd
            var vVODiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.vodiscamt, ',', '', 'number')
            var vVOAfterDiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.voafterdiscamt, ',', '', 'number')
            var vVONetAmt = this.replaceAllString(this.M_SM_LotSellingPrice.vonetamt, ',', '', 'number')
            var vVOVATAmt = this.replaceAllString(this.M_SM_LotSellingPrice.vovatamt, ',', '', 'number')
            var vVOTotalAmt = this.replaceAllString(this.M_SM_LotSellingPrice.vototalamt, ',', '', 'number')
            
            //other price
            var vOtherPrice = this.M_SM_LotSellingPrice.otherprice ? this.replaceAllString(this.M_SM_LotSellingPrice.otherprice, ',', '', 'number') : 0
            var vOtherTaxCd = this.M_SM_LotSellingPrice.othertaxcd
            var vOtherDiscCd = this.M_SM_LotSellingPrice.otherdiscountcd
            var vOtherDiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.otherdiscamt, ',', '', 'number')
            var vOtherAfterDiscAmt = this.replaceAllString(this.M_SM_LotSellingPrice.otherafterdiscamt, ',', '', 'number')
            var vOtherNetAmt = this.replaceAllString(this.M_SM_LotSellingPrice.othernetamt, ',', '', 'number')
            var vOtherVATAmt = this.replaceAllString(this.M_SM_LotSellingPrice.othervatamt, ',', '', 'number')
            var vOtherTotalAmt = this.replaceAllString(this.M_SM_LotSellingPrice.othertotalamt, ',', '', 'number')
            
            if(vOtherDiscCd != "" && vOtherDiscCd != null){
              var param = {
                  OptionFunctionCd: "GetSMCalculateDiscount",
                  ModuleCd: this.Module,
                  SubPortfolioCd: this.getDataUser().subportfolio_cd,
                  BasePrice: vOtherPrice,
                  DiscCd: vOtherDiscCd,
                  DiscAmount_Output: 0
                }

                this.FnDynamicFunction(param)
                  .then(ress => {
                    var data = ress
                    vOtherDiscAmt = data.DiscAmount //this.isCurrency(data.DiscAmount,this.decimal)
                    vOtherAfterDiscAmt = parseFloat(vOtherPrice) - parseFloat(vOtherDiscAmt)

                    this.M_SM_LotSellingPrice.otherdiscamt = this.isCurrency(vOtherDiscAmt, this.decimal)
                    this.M_SM_LotSellingPrice.otherafterdiscamt = this.isCurrency(vOtherAfterDiscAmt, this.decimal)

                    //hitung VO tax cd

                    if(vOtherTaxCd != "" && vOtherTaxCd != null){
                    var param = {
                        OptionFunctionCd: "SMCalculateTax",
                        ModuleCd: this.Module,
                        SubPortfolioCd: this.getDataUser().subportfolio_cd,
                        AfterDiscountAmt: vOtherAfterDiscAmt,
                        TaxCd: vOtherTaxCd,
                        BaseAmt_Output:0,
                        TaxAmt_Output:0
                      }

                      this.FnDynamicFunction(param)
                        .then(ress => {
                      
                            // var data = ress[0]
                            var data = ress
                            vOtherNetAmt = data.BaseAmt //this.isCurrency(data.BaseAmt,this.decimal)
                            vOtherVATAmt = data.TaxAmt //this.isCurrency(data.TaxAmt,this.decimal)
                          
                            vOtherTotalAmt = parseFloat(vOtherTotalAmt) + parseFloat(vOtherVATAmt) 

                            this.M_SM_LotSellingPrice.othernetamt = this.isCurrency(vOtherNetAmt, this.decimal)
                            this.M_SM_LotSellingPrice.othervatamt = this.isCurrency(vOtherVATAmt, this.decimal)
                            this.M_SM_LotSellingPrice.othertotalamt = this.isCurrency(vOtherTotalAmt, this.decimal)

                            this.GetTotalAll()
                        })
                    }
                    else{
                      vOtherNetAmt = vOtherAfterDiscAmt
                      vOtherVATAmt = 0
                      
                      vOtherTotalAmt = parseFloat(vOtherNetAmt) + parseFloat(vOtherVATAmt) 

                      this.M_SM_LotSellingPrice.othernetamt = this.isCurrency(vOtherNetAmt, this.decimal)
                      this.M_SM_LotSellingPrice.othervatamt = this.isCurrency(vOtherVATAmt, this.decimal)
                      this.M_SM_LotSellingPrice.othertotalamt = this.isCurrency(vOtherTotalAmt, this.decimal)

                      this.GetTotalAll()
                    }
                  
                  })
                    //hitung tax cd

              }
              else{
                vOtherDiscAmt = 0
                vOtherAfterDiscAmt = parseFloat(vOtherPrice) - parseFloat(vOtherDiscAmt)

                this.M_SM_LotSellingPrice.otherdiscamt = this.isCurrency(vOtherDiscAmt, this.decimal)
                this.M_SM_LotSellingPrice.otherafterdiscamt = this.isCurrency(vOtherAfterDiscAmt, this.decimal)

                  //hitung VO tax cd 2

                    if(vOtherTaxCd != "" && vOtherTaxCd != null){
                    var param = {
                        OptionFunctionCd: "SMCalculateTax",
                        ModuleCd: this.Module,
                        SubPortfolioCd: this.getDataUser().subportfolio_cd,
                        AfterDiscountAmt: vOtherAfterDiscAmt,
                        TaxCd: vOtherTaxCd,
                        BaseAmt_Output:0,
                        TaxAmt_Output:0
                      }

                      this.FnDynamicFunction(param)
                        .then(ress => {
                      
                            // var data = ress[0]
                            var data = ress
                            vOtherNetAmt = data.BaseAmt //this.isCurrency(data.BaseAmt,this.decimal)
                            vOtherVATAmt = data.TaxAmt //this.isCurrency(data.TaxAmt,this.decimal)
                          
                            vOtherTotalAmt = parseFloat(vOtherNetAmt) + parseFloat(vOtherVATAmt) 

                            this.M_SM_LotSellingPrice.othernetamt = this.isCurrency(vOtherNetAmt, this.decimal)
                            this.M_SM_LotSellingPrice.othervatamt = this.isCurrency(vOtherVATAmt, this.decimal)
                            this.M_SM_LotSellingPrice.othertotalamt = this.isCurrency(vOtherTotalAmt, this.decimal)

                            this.GetTotalAll()
                        })
                    }
                    else{
                      vOtherNetAmt = vOtherAfterDiscAmt
                      vOtherVATAmt = 0
                      
                      vOtherTotalAmt = parseFloat(vOtherNetAmt) + parseFloat(vOtherVATAmt) 

                      this.M_SM_LotSellingPrice.othernetamt = this.isCurrency(vOtherNetAmt, this.decimal)
                      this.M_SM_LotSellingPrice.othervatamt = this.isCurrency(vOtherVATAmt, this.decimal)
                      this.M_SM_LotSellingPrice.othertotalamt = this.isCurrency(vOtherTotalAmt, this.decimal)
                      
                      this.GetTotalAll()
                    }
                  
                    //hitung VO tax cd 2
              }
            
            vOtherAfterDiscAmt = parseFloat(vOtherPrice) - parseFloat(vOtherDiscAmt)
            
            
            this.M_SM_LotSellingPrice.otherprice = vOtherPrice
        },
        GetValidationErrorMessage(LotNo, SequenceNo, FromDate, ToDate, InsertFlag){
             var param = {
            OptionFunctionCd: "GetSMValidationErrorMessage",
            ModuleCd: this.Module,
            SubPortfolioCd: this.getDataUser().subportfolio_cd,
            LotNo: LotNo, 
            SequenceNo: SequenceNo, 
            FromDate: FromDate, 
            ToDate: ToDate, 
            InsertFlag: InsertFlag, 
            ErrorMessage_Output:0, 
          }

          this.FnDynamicFunction(param)
            .then(ress => {
          
                // var data = ress[0]
                var data = ress
                this.M_SM_LotSellingPrice.baseamt = this.isCurrency(data.BaseAmt,this.decimal)
                this.M_SM_LotSellingPrice.taxamt = this.isCurrency(data.TaxAmt,this.decimal)
                this.M_SM_LotSellingPrice.totalamt = this.isCurrency(parseFloat(data.BaseAmt) + parseFloat(data.TaxAmt),this.decimal)

              
            })
        },
        OnvopriceChange(data){
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{voprice}   
              this.GetCalculateVO()
            }
        })
        this.$forceUpdate()
        },
        OnotherpriceChange(data){
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{otherprice}
              // this.AllOnChange()
              this.GetCalculateOther()
            }
        })
        this.$forceUpdate()
        },
        OnbuildingpriceChange (data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
  // //{buildingprice}
            // if(this.M_SM_LotSellingPrice.interestpercentage != 0){
              // this.CalculateUnitAmt()
              // this.AllOnChange()
              // this.CalculateDisc('unit')
              // this.CalculateTax('unit')
              this.GetCalculateUnit()
            }
          })
          this.$forceUpdate()
        },
        OnlandpriceChange(data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              // this.CalculateUnitAmt()
              // this.AllOnChange()
              // this.CalculateDisc('unit')
              // this.CalculateTax('unit')
              this.GetCalculateUnit()
            }
          })
          this.$forceUpdate()
        },
        OninterestpercentageChange(data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              // if (this.statusOnChangeAmt == true && this.statusOnChangePercent == true) {
              //   this.statusOnChangeAmt = false
              // }
              // else if (this.statusOnChangeAmt == false && this.statusOnChangePercent == false) {
              //   this.statusOnChangePercent = true
              // }
              // else {
              //   this.statusOnChangePercent = true
              //   this.statusOnChangeAmt = false
              // }

              // if (this.statusOnChangePercent == true) {
              //   this.statusOnChangeAmt = false
              if (this.statusOnChange !== 2) {
                var vBuildingAmt = this.replaceAllString(this.M_SM_LotSellingPrice.buildingprice, ',', '', 'number')
                var vLandAmt = this.replaceAllString(this.M_SM_LotSellingPrice.landprice, ',', '', 'number')
                var vInterestPercentage = this.replaceAllString(this.M_SM_LotSellingPrice.interestpercentage, ',', '', 'number')
                var vInterestAmt = this.replaceAllString(this.M_SM_LotSellingPrice.interestamt, ',', '', 'number')


                // vInterestPercentage = (vInterestAmt / (parseFloat(vBuildingAmt) + parseFloat(vLandAmt)) * 100).toFixed(2)
                vInterestAmt = (vInterestPercentage / 100) * (parseFloat(vBuildingAmt) + parseFloat(vLandAmt))

                this.M_SM_LotSellingPrice.interestamt = this.isCurrency(vInterestAmt, this.decimal)

                // this.GetCalculateUnit()
                this.M_SM_LotSellingPrice.lottrxamt = this.isCurrency((vBuildingAmt + vLandAmt + vInterestAmt), this.decimal)

                this.statusOnChange = 1
              }
              else {
                this.statusOnChange = 0
              }
            }
          })
          this.$forceUpdate()
        },
        OninterestamtChange(data) {
          this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
              // if (this.statusOnChangeAmt == true && this.statusOnChangePercent == true) {
              //   this.statusOnChangePercent = false
              // }
              // else if (this.statusOnChangeAmt == false && this.statusOnChangePercent == false) {
              //   this.statusOnChangeAmt = true
              // }
              // else {
              //   this.statusOnChangeAmt = true
              //   this.statusOnChangePercent = false
              // }

              // if (this.statusOnChangeAmt == true) {
              //   this.statusOnChangePercent = false

              if (this.statusOnChange !== 1) {
                var vBuildingAmt = this.replaceAllString(this.M_SM_LotSellingPrice.buildingprice, ',', '', 'number')
                var vLandAmt = this.replaceAllString(this.M_SM_LotSellingPrice.landprice, ',', '', 'number')
                var vInterestPercentage = this.replaceAllString(this.M_SM_LotSellingPrice.interestpercentage, ',', '', 'number')
                var vInterestAmt = this.replaceAllString(this.M_SM_LotSellingPrice.interestamt, ',', '', 'number')


                vInterestPercentage = (vInterestAmt / (parseFloat(vBuildingAmt) + parseFloat(vLandAmt)) * 100)

                this.M_SM_LotSellingPrice.interestpercentage = this.isCurrency(vInterestPercentage, this.decimal)

                // this.GetCalculateUnit()
                this.M_SM_LotSellingPrice.lottrxamt = this.isCurrency((vBuildingAmt + vLandAmt + vInterestAmt), this.decimal)
                
                this.statusOnChange = 2
              }
              else {
                this.statusOnChange = 0
              }
            }
          })
          this.$forceUpdate()
        },
        OnsalestypecdChange (data) {
        this.$nextTick(() => {
            this.M_SM_LotSellingPrice.salestypecd = data.id
            this.M_SM_LotSellingPrice.salestypecdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{salestypecd}
            }
        })
        this.$forceUpdate()
        },
        OnlottrxamtChange (data) {
          this.$nextTick(() => {
              this.GetCalculateUnit()
          })
          this.$forceUpdate()
        },
        OnlottaxcdChange (data) {
        
          this.$nextTick(() => {
              this.M_SM_LotSellingPrice.lottaxcd = data.id
              this.M_SM_LotSellingPrice.lottaxcdLabel = data.id
              if (this.inputStatus != "VIEW") {
                // this.CalculateTax('unit')
                this.GetCalculateUnit()
              }
          })
          this.$forceUpdate()
        },
        OnlotdiscountcdChange (data) {
          this.$nextTick(() => {
            this.M_SM_LotSellingPrice.lotdiscountcd = data.id
            this.M_SM_LotSellingPrice.lotdiscountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
              // this.CalculateTax('unit')
              this.GetCalculateUnit()
            }
          })
          this.$forceUpdate()
        },
        OnvotaxcdChange (data) {
          this.$nextTick(() => {
              this.M_SM_LotSellingPrice.votaxcd = data.id
              this.M_SM_LotSellingPrice.votaxcdLabel = data.id
              if (this.inputStatus != "VIEW") {
                // this.CalculateTax('vo')
                this.GetCalculateVO()
              }
          })
          this.$forceUpdate()
        },
        OnvodiscountcdChange (data) {
          this.$nextTick(() => {
            this.M_SM_LotSellingPrice.vodiscountcd = data.id
            this.M_SM_LotSellingPrice.vodiscountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
              // this.CalculateDisc('vo')
              this.GetCalculateVO()
            }
          })
          this.$forceUpdate()
        },
        OnothertaxcdChange (data) {
          this.$nextTick(() => {
            this.M_SM_LotSellingPrice.othertaxcd = data.id
            this.M_SM_LotSellingPrice.othertaxcdLabel = data.id
            if (this.inputStatus != "VIEW") {
              // this.CalculateTax('other')
              this.GetCalculateOther()
            }
          })
          this.$forceUpdate()
        },
        OnotherdiscountcdChange (data) {
          this.$nextTick(() => {
            this.M_SM_LotSellingPrice.otherdiscountcd = data.id
            this.M_SM_LotSellingPrice.otherdiscountcdLabel = data.label
            if (this.inputStatus != "VIEW") {
              // this.CalculateDisc('other')
              this.GetCalculateOther()
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
          //  this.getToolbar().statusFunction[0].disabled = true
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
            this.$parent.showForm = false
            let data = this.$store.getters.GetPage1Data
          
            this.M_SM_LotSellingPrice.lotno = data.LotNo 
            this.propList.initialWhere =" LotNo = '" + data.LotNo + "' "
        

            this.FormToABSList().doGetList('','eb_getList')

        },		
		M_CheckboxChecked(data, status, index){

        },		
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                LotNo: this.M_SM_LotSellingPrice.lotno,
                SalesTypeCd: this.M_SM_LotSellingPrice.salestypecd == '' || this.M_SM_LotSellingPrice.salestypecd == null ? 'NULL' : this.M_SM_LotSellingPrice.salestypecd ,
                FromDate: this.M_SM_LotSellingPrice.fromdate == '' || this.M_SM_LotSellingPrice.fromdate == null ? 'NULL' : this.M_SM_LotSellingPrice.fromdate ,
                ToDate: this.M_SM_LotSellingPrice.todate == '' || this.M_SM_LotSellingPrice.todate == null ? 'NULL' : this.M_SM_LotSellingPrice.todate ,
                BuildingPrice: this.M_SM_LotSellingPrice.buildingprice,
                LandPrice: this.M_SM_LotSellingPrice.landprice,
                LotDiscountCd: this.M_SM_LotSellingPrice.lotdiscountcd == '' || this.M_SM_LotSellingPrice.lotdiscountcd == null ? 'NULL' : this.M_SM_LotSellingPrice.lotdiscountcd ,
                LotTaxCd: this.M_SM_LotSellingPrice.lottaxcd == '' || this.M_SM_LotSellingPrice.lottaxcd == null ? 'NULL' : this.M_SM_LotSellingPrice.lottaxcd ,
                VOPrice: this.M_SM_LotSellingPrice.voprice,
                VODiscountCd: this.M_SM_LotSellingPrice.vodiscountcd == '' || this.M_SM_LotSellingPrice.vodiscountcd == null ? 'NULL' : this.M_SM_LotSellingPrice.vodiscountcd ,
                VOTaxCd: this.M_SM_LotSellingPrice.votaxcd == '' || this.M_SM_LotSellingPrice.votaxcd == null ? 'NULL' : this.M_SM_LotSellingPrice.votaxcd ,
                OtherPrice: this.M_SM_LotSellingPrice.otherprice,
                OtherDiscountCd: this.M_SM_LotSellingPrice.otherdiscountcd == '' || this.M_SM_LotSellingPrice.otherdiscountcd == null ? 'NULL' : this.M_SM_LotSellingPrice.otherdiscountcd ,
                OtherTaxCd: this.M_SM_LotSellingPrice.othertaxcd == '' || this.M_SM_LotSellingPrice.othertaxcd == null ? 'NULL' : this.M_SM_LotSellingPrice.othertaxcd ,
                Remarks: this.M_SM_LotSellingPrice.remarks,
                UserInput: this.getDataUser().user_id ,
                InterestPercentage: this.M_SM_LotSellingPrice.interestpercentage,
                InterestAmt: this.M_SM_LotSellingPrice.interestamt                
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
                SequenceNo: this.M_SM_LotSellingPrice.sequenceno,
                LotNo: this.M_SM_LotSellingPrice.lotno,
                SalesTypeCd: this.M_SM_LotSellingPrice.salestypecd == '' || this.M_SM_LotSellingPrice.salestypecd == null ? 'NULL' : this.M_SM_LotSellingPrice.salestypecd ,
                FromDate: this.M_SM_LotSellingPrice.fromdate == '' || this.M_SM_LotSellingPrice.fromdate == null ? 'NULL' : this.M_SM_LotSellingPrice.fromdate ,
                ToDate: this.M_SM_LotSellingPrice.todate == '' || this.M_SM_LotSellingPrice.todate == null ? 'NULL' : this.M_SM_LotSellingPrice.todate ,
                BuildingPrice: this.M_SM_LotSellingPrice.buildingprice,
                LandPrice: this.M_SM_LotSellingPrice.landprice,
                LotDiscountCd: this.M_SM_LotSellingPrice.lotdiscountcd == '' || this.M_SM_LotSellingPrice.lotdiscountcd == null ? 'NULL' : this.M_SM_LotSellingPrice.lotdiscountcd ,
                LotTaxCd: this.M_SM_LotSellingPrice.lottaxcd == '' || this.M_SM_LotSellingPrice.lottaxcd == null ? 'NULL' : this.M_SM_LotSellingPrice.lottaxcd ,
                VOPrice: this.M_SM_LotSellingPrice.voprice,
                VODiscountCd: this.M_SM_LotSellingPrice.vodiscountcd == '' || this.M_SM_LotSellingPrice.vodiscountcd == null ? 'NULL' : this.M_SM_LotSellingPrice.vodiscountcd ,
                VOTaxCd: this.M_SM_LotSellingPrice.votaxcd == '' || this.M_SM_LotSellingPrice.votaxcd == null ? 'NULL' : this.M_SM_LotSellingPrice.votaxcd ,
                OtherPrice: this.M_SM_LotSellingPrice.otherprice,
                OtherDiscountCd: this.M_SM_LotSellingPrice.otherdiscountcd == '' || this.M_SM_LotSellingPrice.otherdiscountcd == null ? 'NULL' : this.M_SM_LotSellingPrice.otherdiscountcd ,
                OtherTaxCd: this.M_SM_LotSellingPrice.othertaxcd == '' || this.M_SM_LotSellingPrice.othertaxcd == null ? 'NULL' : this.M_SM_LotSellingPrice.othertaxcd ,
                Remarks: this.M_SM_LotSellingPrice.remarks,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_LotSellingPrice.lastupdatestamp,
                InterestPercentage: this.M_SM_LotSellingPrice.interestpercentage,
                InterestAmt: this.M_SM_LotSellingPrice.interestamt                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_LotSellingPrice = {
                salestypecd: '',
                salestype: '',
                fromdate: '',
                todate: '',
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
                otherdiscountcd: '',
                sequenceno: 0,
                lastupdatestamp: 0,
                    }
            	
		},
        M_New(){
          let data = this.$store.getters.GetPage1Data
          this.M_SM_LotSellingPrice.lotno = data.LotNo 

          this.$refs.ref_salestypecd.focus()
        },
        M_Edit(){
          let data = this.$store.getters.GetPage1Data
          this.M_SM_LotSellingPrice.lotno = data.LotNo 

          this.$refs.ref_salestypecd.focus()
        },
        M_Delete(dt){           
          var data = this.FormToABSList().getRowSelected()  
          var dataDelete = []

          
          data.forEach((value) => {

            
            dataDelete.push({
              _Message_:'',
                        SubPortfolioCd: this.getDataUser().subportfolio_cd,
                        SequenceNo: value.SequenceNo,
                        LotNo: value.LotNo,
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
        
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                sequenceno: record.SequenceNo,
                lotno: record.LotNo						
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return
                
                  var data = response.Data[0]
                
                  this.M_SM_LotSellingPrice = {
                      salestypecd: data.salestypecd,
                      salestype: data.salestype,
                      sequenceno: record.SequenceNo,
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
                      otherdiscountcd: data.otherdiscountcd,
                      lastupdatestamp: record.LastUpdateStamp
                    }
                 

                    this.M_SM_LotSellingPrice.salestypecdLabel = this.M_SM_LotSellingPrice.salestypecd != null && this.M_SM_LotSellingPrice.salestypecd != '' ? data.salestypecd  :'' 
                    this.M_SM_LotSellingPrice.lottaxcdLabel = this.M_SM_LotSellingPrice.lottaxcd != null && this.M_SM_LotSellingPrice.lottaxcd != '' ? data.lottaxcd :'' 
                    this.M_SM_LotSellingPrice.lotdiscountcdLabel = this.M_SM_LotSellingPrice.lotdiscountcd != null && this.M_SM_LotSellingPrice.lotdiscountcd != '' ? data.lotdiscountcd :'' 
                    this.M_SM_LotSellingPrice.votaxcdLabel = this.M_SM_LotSellingPrice.votaxcd != null && this.M_SM_LotSellingPrice.votaxcd != '' ? data.votaxcd :'' 
                    this.M_SM_LotSellingPrice.vodiscountcdLabel = this.M_SM_LotSellingPrice.vodiscountcd != null && this.M_SM_LotSellingPrice.vodiscountcd != '' ? data.vodiscountcd :'' 
                    this.M_SM_LotSellingPrice.othertaxcdLabel = this.M_SM_LotSellingPrice.othertaxcd != null && this.M_SM_LotSellingPrice.othertaxcd != '' ? data.othertaxcd :'' 
                    this.M_SM_LotSellingPrice.otherdiscountcdLabel = this.M_SM_LotSellingPrice.otherdiscountcd != null && this.M_SM_LotSellingPrice.otherdiscountcd != '' ? data.otherdiscountcd  :'' 
      

                    this.IEBy.Input = data.userinput
                    this.IEBy.Edit = data.useredit


            })
        }
        ,MdtRange_fromdate (data) {
            this.M_SM_LotSellingPrice.fromdate = data
        }
        ,MdtRange_todate (data) {
            this.M_SM_LotSellingPrice.todate = data
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