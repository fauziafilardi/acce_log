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
                                        <ABSinputTextVuex :prop="PI_orderno" v-model="M_SM_SalesEntry.orderno"  ref="ref_orderno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnagentidChange" :prop="PI_agentid" :value="M_SM_SalesEntry.agentid" :label="M_SM_SalesEntry.agentidLabel" ref="ref_agentid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OnorderdateChange" :prop="PI_orderdate" v-model="M_SM_SalesEntry.orderdate"  ref="ref_orderdate" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnmarketingidChange" :prop="PI_marketingid" :value="M_SM_SalesEntry.marketingid" :label="M_SM_SalesEntry.marketingidLabel" ref="ref_marketingid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                      </b-col>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnmediacdChange" :prop="PI_mediacd" :value="M_SM_SalesEntry.mediacd" :label="M_SM_SalesEntry.mediacdLabel" ref="ref_mediacd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnlotnoChange" :prop="PI_lotno" :value="M_SM_SalesEntry.lotno" :label="M_SM_SalesEntry.lotnoLabel" ref="ref_lotno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnsolicitoridChange" :prop="PI_solicitorid" :value="M_SM_SalesEntry.solicitorid" :label="M_SM_SalesEntry.solicitoridLabel" ref="ref_solicitorid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnsalestypecdChange" :prop="PI_salestypecd" :value="M_SM_SalesEntry.salestypecd" :label="M_SM_SalesEntry.salestypecdLabel" ref="ref_salestypecd"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnfinancieridChange" :prop="PI_financierid" :value="M_SM_SalesEntry.financierid" :label="M_SM_SalesEntry.financieridLabel" ref="ref_financierid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_snpno" v-model="M_SM_SalesEntry.snpno"  ref="ref_snpno"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_referenceno" v-model="M_SM_SalesEntry.referenceno"  ref="ref_referenceno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OnsnpdateChange" :prop="PI_snpdate" v-model="M_SM_SalesEntry.snpdate"  ref="ref_snpdate" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputDateVuex @input="OnhandoverdateChange" :prop="PI_handoverdate" v-model="M_SM_SalesEntry.handoverdate"  ref="ref_handoverdate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_vono" v-model="M_SM_SalesEntry.vono"  ref="ref_vono"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OncurrencycdChange" :prop="PI_currencycd" :value="M_SM_SalesEntry.currencycd" :label="M_SM_SalesEntry.currencycdLabel" ref="ref_currencycd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OnvodateChange" :prop="PI_vodate" v-model="M_SM_SalesEntry.vodate"  ref="ref_vodate" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSCompute :prop="PI_commisionstatusdescs" v-model="M_SM_SalesEntry.commisionstatusdescs"  ref="ref_commisionstatusdescs" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OncontactidChange" :prop="PI_contactid" :value="M_SM_SalesEntry.contactid" :label="M_SM_SalesEntry.contactidLabel" ref="ref_contactid"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSInputSelectList @change="OnreferralidChange" :prop="PI_referralid" :value="M_SM_SalesEntry.referralid" :label="M_SM_SalesEntry.referralidLabel" ref="ref_referralid"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_SM_SalesEntry.remarks"  ref="ref_remarks" />
                                      </b-col>
                                    </b-row>
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
                                      <b-col md="8">
                                        <b-row>
                                          <b-col md="2" style="text-align: right !important; padding-right: 15px !important">Trans Amt </b-col>
                                          <b-col md="2" style="text-align: right !important; padding-right: 15px !important">Net Amt </b-col>
                                          <b-col md="2" style="text-align: right !important; padding-right: 15px !important">VAT Amt </b-col>
                                          <b-col md="2" style="text-align: right !important; padding-right: 15px !important">Total Amt </b-col>
                                          <b-col md="2" style="text-align: right !important; padding-right: 15px !important">Received Amt </b-col>
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
                                      <b-col md="8">
                                        <b-row>
                                          <b-col md="2" style="padding-left: 16px !important;">                                         
                                            <ABSTextBoxOnly :prop="PI_unittrxamt" v-model="M_SM_SalesEntry.unittrxamt"  ref="ref_unittrxamt"/>
                                          </b-col>
                                          <b-col md="2"> 
                                            <ABSTextBoxOnly :prop="PI_unitnetamt" v-model="M_SM_SalesEntry.unitnetamt"  ref="ref_unitnetamt"/>
                                          </b-col>
                                          <b-col md="2"> 
                                            <ABSTextBoxOnly :prop="PI_unitvatamt" v-model="M_SM_SalesEntry.unitvatamt"  ref="ref_unitvatamt"/>
                                          </b-col>
                                          <b-col md="2">
                                            <ABSTextBoxOnly :prop="PI_unittotalamt" v-model="M_SM_SalesEntry.unittotalamt"  ref="ref_unittotalamt"/>
                                          </b-col>
                                          <b-col md="2"> 
                                            <ABSTextBoxOnly :prop="PI_unitreceivedamt" v-model="M_SM_SalesEntry.unitreceivedamt"  ref="ref_unitreceivedamt"/>
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
                                      <b-col md="8">
                                        <b-row>
                                          <b-col md="2" style="padding-left: 16px !important;">                                        
                                            <ABSTextBoxOnly :prop="PI_votrxamt" v-model="M_SM_SalesEntry.votrxamt"  ref="ref_votrxamt"/>
                                          </b-col>
                                          <b-col md="2"> 
                                            <ABSTextBoxOnly :prop="PI_vonetamt" v-model="M_SM_SalesEntry.vonetamt"  ref="ref_vonetamt"/>
                                          </b-col>
                                          <b-col md="2"> 
                                            <ABSTextBoxOnly :prop="PI_vovatamt" v-model="M_SM_SalesEntry.vovatamt"  ref="ref_vovatamt"/>
                                          </b-col>
                                          <b-col md="2"> 
                                            <ABSTextBoxOnly :prop="PI_vototalamt" v-model="M_SM_SalesEntry.vototalamt"  ref="ref_vototalamt"/>
                                          </b-col>
                                          <b-col md="2"> 
                                            <ABSTextBoxOnly :prop="PI_voreceivedamt" v-model="M_SM_SalesEntry.voreceivedamt"  ref="ref_voreceivedamt"/>
                                          </b-col>
                                        </b-row>
                                      </b-col>
                                    </b-row>
                                     <b-row>
                                      <b-col md="2">
                                        <ABSLabelOnly
                                        :prop="{cLabel: 'Other Price', 
                                          cLabelSize: 4, 
                                          cValue: '', 
                                          cPageLevel: PageLevel, 
                                          cTabIndex: TabIndex, 
                                          cVisible: true,
                                          cClass: 'lbl-col-align'}"
                                        />
                                      </b-col>
                                      <b-col md="8">
                                        <b-row>
                                          <b-col md="2" style="padding-left: 16px !important;">                                         
                                            <ABSTextBoxOnly :prop="PI_othertrxamt" v-model="M_SM_SalesEntry.othertrxamt"  ref="ref_othertrxamt"/>
                                          </b-col>
                                          <b-col md="2"> 
                                            <ABSTextBoxOnly :prop="PI_othernetamt" v-model="M_SM_SalesEntry.othernetamt"  ref="ref_othernetamt"/>
                                          </b-col>
                                          <b-col md="2"> 
                                            <ABSTextBoxOnly :prop="PI_othervatamt" v-model="M_SM_SalesEntry.othervatamt"  ref="ref_othervatamt"/>
                                          </b-col>
                                          <b-col md="2"> 
                                            <ABSTextBoxOnly :prop="PI_othertotalamt" v-model="M_SM_SalesEntry.othertotalamt"  ref="ref_othertotalamt"/>
                                          </b-col>
                                          <b-col md="2"> 
                                            <ABSTextBoxOnly :prop="PI_otherreceivedamt" v-model="M_SM_SalesEntry.otherreceivedamt"  ref="ref_otherreceivedamt"/>
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
                                      <b-col md="8">
                                        <b-row>
                                          <b-col md="2" style="padding-left: 16px !important;">                                         
                                            <ABSTextBoxOnly :prop="PI_totaltrxamt" v-model="M_SM_SalesEntry.totaltrxamt"  ref="ref_totaltrxamt"/>
                                          </b-col>
                                          <b-col md="2"> 
                                            <ABSTextBoxOnly :prop="PI_totalnetamt" v-model="M_SM_SalesEntry.totalnetamt"  ref="ref_totalnetamt"/>
                                          </b-col>
                                          <b-col md="2"> 
                                            <ABSTextBoxOnly :prop="PI_totalvatamt" v-model="M_SM_SalesEntry.totalvatamt"  ref="ref_totalvatamt"/>
                                          </b-col>
                                          <b-col md="2"> 
                                            <ABSTextBoxOnly :prop="PI_grandtotal" v-model="M_SM_SalesEntry.grandtotal"  ref="ref_grandtotal"/>
                                          </b-col>
                                          <b-col md="2"> 
                                            <ABSTextBoxOnly :prop="PI_totalreceivedamt" v-model="M_SM_SalesEntry.totalreceivedamt"  ref="ref_totalreceivedamt"/>
                                          </b-col>
                                        </b-row>
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
                initialWhere: "",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
            dataSpec:[],
            IEBy: {Input: '', Edit: ''},   			

            M_SM_SalesEntry :{
                orderno: '',
                agentid: '',
                orderdate: '',
                marketingid: '',
                mediacd: '',
                lotno: '',
                solicitorid: '',
                salestypecd: '',
                financierid: '',
                snpno: '',
                referenceno: '',
                snpdate: '',
                vono: '',
                currencycd: '',
                vodate: '',
                commisionstatusdescs: '',
                contactid: '',
                referralid: '',
                remarks: '',
                el1: '',
                el2: '',
                el3: '',
                el4: '',
                el5: '',
                votrxamt: '0',
                vonetamt: '0',
                vovatamt: '0',
                vototalamt: '0',
                voreceivedamt: '0',
                othertrxamt: '0',
                unittrxamt: '0',
                unitnetamt: '0',
                unitvatamt: '0',
                unittotalamt: '0',
                unitreceivedamt: '0',
                othertrxamt: '0',
                othernetamt: '0',
                othervatamt: '0',
                othertotalamt: '0',
                otherreceivedamt: '0',
                totaltrxamt: '0',
                totalnetamt: '0',
                totalvatamt: '0',
                grandtotal: '0',
                totalreceivedamt: '0',
                handoverdate: '',
                    }
            ,
            PI_orderno: { 
                cValidate :'required|max:20', 
                cName: 'orderno', 
                cLabel: 'Order No', 
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
            PI_agentid: { 
                dataLookUp: { 
                    LookUpCd: 'GetluAgentID'    , 
                    ColumnDB: 'AgentID'   , 
                    InitialWhere: "SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"'",
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'ContactID,Name' 
                        }, 
                cValidate :'required', 
                cName: 'agentid', 
                cLabel: 'Principle ID', 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'ContactID,Name' ,
            }, 
            PI_orderdate: { 
                cValidate :'required', 
                cName: 'orderdate', 
                cLabel: 'Order Date', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_marketingid: { 
                dataLookUp: { 
                    LookUpCd: 'GetluMarketingID'    , 
                    ColumnDB: 'MarketingID'   , 
                    InitialWhere: "SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"' AND STATUS ='A' AND PrincipleID=''", 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'ContactID,Name' 
                        }, 
                cValidate :'required', 
                cName: 'marketingid', 
                cLabel: 'Marketing ID ', 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'ContactID,Name' ,
            }, 
            PI_mediacd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupTNMedia'    , 
                    ColumnDB: 'MediaCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'MediaCd,Descs' 
                        }, 
                cValidate :'', 
                cName: 'mediacd', 
                cLabel: 'Media Cd', 
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
                cMasterUrl: 'SM/SM_Media' ,
                cDisplayColumn: 'MediaCd,Descs' ,
            }, 
            PI_lotno: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupTNLot'    , 
                    ColumnDB: 'LotNo'   , 
                    InitialWhere: "SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"' AND SalesStatus='A'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'LotNo,Descs' 
                        }, 
                cValidate :'', 
                cName: 'lotno', 
                cLabel: 'Unit No', 
                cKey: true, 
                cLabelSize: 4, 
                cOrder: 3, 
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
                cDisplayColumn: 'LotNo,Descs' ,
            }, 
            PI_solicitorid: { 
                dataLookUp: { 
                    LookUpCd: 'GetluSolicitor'    , 
                    ColumnDB: 'SolicitorID'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'ContactID,Name' 
                        }, 
                cValidate :'', 
                cName: 'solicitorid', 
                cLabel: 'Solicitor ID', 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'ContactID,Name' ,
            }, 
            PI_salestypecd: { 
                dataLookUp: { 
                    LookUpCd: 'GetSalesTypeCd'    , 
                    ColumnDB: 'SalesTypeCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'SalesTypeCd,Descs' 
                        }, 
                cValidate :'required', 
                cName: 'salestypecd', 
                cLabel: 'Sales Type', 
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
                cMasterUrl: 'SM/SM_SalesType' ,
                cDisplayColumn: 'SalesTypeCd,Descs' ,
            }, 
            PI_financierid: { 
                dataLookUp: { 
                    LookUpCd: 'GetluSolicitor'    , 
                    ColumnDB: 'SolicitorID'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'ContactID,Name' 
                        }, 
                cValidate :'', 
                cName: 'financierid', 
                cLabel: 'Financier ID', 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'ContactID,Name' ,
            }, 
            PI_snpno: { 
                cValidate :'', 
                cName: 'snpno', 
                cLabel: 'SnP No', 
                cLabelSize: 4, 
                cOrder: 5, 
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
                cOrder: 14, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_snpdate: { 
                cValidate :'', 
                cName: 'snpdate', 
                cLabel: 'SnP Date', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_handoverdate: { 
                cValidate :'', 
                cName: 'handoverdate', 
                cLabel: 'Hand Over Date', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_vono: { 
                cValidate :'', 
                cName: 'vono', 
                cLabel: 'VO No', 
                cLabelSize: 4, 
                cOrder: 7, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_currencycd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMCurrency'    , 
                    ColumnDB: 'CurrencyCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'CurrencyCd,Descs' 
                        }, 
                cValidate :'required', 
                cName: 'currencycd', 
                cLabel: 'Currency Code', 
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
                cMasterUrl: 'CM/CM_CurrencyMaster' ,
                cDisplayColumn: 'CurrencyCd,Descs' ,
            }, 
            PI_vodate: { 
                cValidate :'', 
                cName: 'vodate', 
                cLabel: 'VO Date', 
                cLabelSize: 4, 
                cOrder: 8, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_commisionstatusdescs: { 
                cLabel: 'Commision Status', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_contactid: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMContact'    , 
                    ColumnDB: 'ContactId'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'ContactId,Name' 
                        }, 
                cValidate :'required', 
                cName: 'contactid', 
                cLabel: 'Buyer ID', 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'ContactId,Name' ,
            }, 
            PI_referralid: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMContact'    , 
                    ColumnDB: 'ContactId'   , 
                    InitialWhere: ""   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'ContactId,Name' 
                        }, 
                cValidate :'', 
                cName: 'referralid', 
                cLabel: 'Referral ID', 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'ContactId,Name' ,
            }, 
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Remarks', 
                cLabelSize: 4, 
                cOrder:17, 
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
            PI_el1: { 
                cLabel: 'Trans Amt', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_el2: { 
                cLabel: 'Net Amt', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_el3: { 
                cLabel: 'VAT Amt', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_el4: { 
                cLabel: 'Total Amt', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_el5: { 
                cLabel: 'Received Amt', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_unittrxamt: { 
                cValidate :'', 
                cName: 'unittrxamt', 
                cLabel: 'Unit Price', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_unitnetamt: { 
                cValidate :'', 
                cName: 'unitnetamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_unitvatamt: { 
                cValidate :'', 
                cName: 'unitvatamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_unittotalamt: { 
                cValidate :'', 
                cName: 'unittotalamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_unitreceivedamt: { 
                cValidate :'', 
                cName: 'unitreceivedamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_votrxamt: { 
                cValidate :'', 
                cName: 'votrxamt', 
                cLabel: 'VO Price', 
                cLabelSize: 4, 
                cOrder: 0, 
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
                cOrder: 0, 
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
                cOrder: 0, 
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
                cOrder: 0, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_voreceivedamt: { 
                cValidate :'', 
                cName: 'voreceivedamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_othertrxamt: { 
                cValidate :'', 
                cName: 'othertrxamt', 
                cLabel: 'Other Price', 
                cLabelSize: 4, 
                cOrder: 0, 
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
                cOrder: 0, 
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
                cOrder: 0, 
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
                cOrder: 0, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_otherreceivedamt: { 
                cValidate :'', 
                cName: 'otherreceivedamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
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
                cOrder: 0, 
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
                cOrder: 0, 
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
                cOrder: 0, 
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
                cOrder: 0, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_totalreceivedamt: { 
                cValidate :'', 
                cName: 'totalreceivedamt', 
                cLabel: '', 
                cLabelSize: 4, 
                cOrder: 0, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: true, 
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
        OnagentidChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesEntry.agentid = data.id
            this.M_SM_SalesEntry.agentidLabel = data.label
            if (this.inputStatus != "VIEW") {
//{agentid}
                this.PI_marketingid.dataLookUp.InitialWhere = "SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"' AND Status='A' AND PrincipleID='"+data.id+"'"
            }
        })
        this.$forceUpdate()
        },
        OnorderdateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{orderdate}
            }
        })
        this.$forceUpdate()
        },
        OnmarketingidChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesEntry.marketingid = data.id
            this.M_SM_SalesEntry.marketingidLabel = data.label
            if (this.inputStatus != "VIEW") {
//{marketingid}
            
            }
        })
        this.$forceUpdate()
        },
        OnmediacdChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesEntry.mediacd = data.id
            this.M_SM_SalesEntry.mediacdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{mediacd}
            }
        })
        this.$forceUpdate()
        },
        OnlotnoChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesEntry.lotno = data.id
            this.M_SM_SalesEntry.lotnoLabel = data.label
            if (this.inputStatus != "VIEW") {
//{lotno}
            }
        })
        this.$forceUpdate()
        },
        OnsolicitoridChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesEntry.solicitorid = data.id
            this.M_SM_SalesEntry.solicitoridLabel = data.label
            if (this.inputStatus != "VIEW") {
//{solicitorid}
            }
        })
        this.$forceUpdate()
        },
        OnsalestypecdChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesEntry.salestypecd = data.id
            this.M_SM_SalesEntry.salestypecdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{salestypecd}
            }
        })
        this.$forceUpdate()
        },
        OnfinancieridChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesEntry.financierid = data.id
            this.M_SM_SalesEntry.financieridLabel = data.label
            if (this.inputStatus != "VIEW") {
//{financierid}
            }
        })
        this.$forceUpdate()
        },
        OnsnpdateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{snpdate}
            }
        })
        this.$forceUpdate()
        },
        OnhandoverdateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{handoverdate}
            }
        })
        this.$forceUpdate()
        },
        OncurrencycdChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesEntry.currencycd = data.id
            this.M_SM_SalesEntry.currencycdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{currencycd}
            }
        })
        this.$forceUpdate()
        },
        OnvodateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{vodate}
            }
        })
        this.$forceUpdate()
        },
        OncontactidChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesEntry.contactid = data.id
            this.M_SM_SalesEntry.contactidLabel = data.label
            if (this.inputStatus != "VIEW") {
//{contactid}
            }
        })
        this.$forceUpdate()
        },
        OnreferralidChange (data) {
        this.$nextTick(() => {
            this.M_SM_SalesEntry.referralid = data.id
            this.M_SM_SalesEntry.referralidLabel = data.label
            if (this.inputStatus != "VIEW") {
//{referralid}
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
        fn_generate(){
            this.FnGenerateRunningCode(
              this.getDataUser().subportfolio_cd,
              this.dataSpec.OrderRunningCd,
              this.getDataUser().user_id,
              this.getToday())
            .then(dt=>{
                this.M_SM_SalesEntry.orderno = dt.RunningCode
                  this.FnGenerateRunningCode(
                  this.getDataUser().subportfolio_cd,
                  this.dataSpec.SnPRunningCd,
                  this.getDataUser().user_id,
                  this.getToday())
                .then(dt=>{
                  this.M_SM_SalesEntry.snpno = dt.RunningCode
                        this.M_SM_SalesEntry.orderno = dt.RunningCode
                        this.FnGenerateRunningCode(
                        this.getDataUser().subportfolio_cd,
                        this.dataSpec.VORunningCd,
                        this.getDataUser().user_id,
                        this.getToday())
                      .then(dt=>{
                        this.M_SM_SalesEntry.vono = dt.RunningCode
                        this.fn_save()
                      })
                })
            })
        },
        fn_save(){
              var param = {			
                    OptionSeq: this.getOptionSeq().OptionSeq,
                    LineNo: this.$parent.data.page_order,
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
                    OrderNo: this.M_SM_SalesEntry.orderno,
                    OrderDate: this.M_SM_SalesEntry.orderdate == '' || this.M_SM_SalesEntry.orderdate == null ? 'NULL' : this.M_SM_SalesEntry.orderdate ,
                    SnPNo: this.M_SM_SalesEntry.snpno,
                    SnPDate: this.M_SM_SalesEntry.snpdate == '' || this.M_SM_SalesEntry.snpdate == null ? 'NULL' : this.M_SM_SalesEntry.snpdate ,
                    VONo: this.M_SM_SalesEntry.vono,
                    VODate: this.M_SM_SalesEntry.vodate == '' || this.M_SM_SalesEntry.vodate == null ? 'NULL' : this.M_SM_SalesEntry.vodate ,
                    ReferenceNo: this.M_SM_SalesEntry.referenceno,
                    SalesTypeCd: this.M_SM_SalesEntry.salestypecd == '' || this.M_SM_SalesEntry.salestypecd == null ? 'NULL' : this.M_SM_SalesEntry.salestypecd ,
                    ContactID: this.M_SM_SalesEntry.contactid == '' || this.M_SM_SalesEntry.contactid == null ? 'NULL' : this.M_SM_SalesEntry.contactid ,
                    MarketingID: this.M_SM_SalesEntry.marketingid == '' || this.M_SM_SalesEntry.marketingid == null ? 'NULL' : this.M_SM_SalesEntry.marketingid ,
                    HandOverDate: this.M_SM_SalesEntry.handoverdate == '' || this.M_SM_SalesEntry.handoverdate == null ? 'NULL' : this.M_SM_SalesEntry.handoverdate ,
                    MediaCd: this.M_SM_SalesEntry.mediacd == '' || this.M_SM_SalesEntry.mediacd == null ? 'NULL' : this.M_SM_SalesEntry.mediacd ,
                    SolicitorID: this.M_SM_SalesEntry.solicitorid == '' || this.M_SM_SalesEntry.solicitorid == null ? 'NULL' : this.M_SM_SalesEntry.solicitorid ,
                    FinancierID: this.M_SM_SalesEntry.financierid == '' || this.M_SM_SalesEntry.financierid == null ? 'NULL' : this.M_SM_SalesEntry.financierid ,
                    LotNo: this.M_SM_SalesEntry.lotno == '' || this.M_SM_SalesEntry.lotno == null ? 'NULL' : this.M_SM_SalesEntry.lotno ,
                    CurrencyCd: this.M_SM_SalesEntry.currencycd == '' || this.M_SM_SalesEntry.currencycd == null ? 'NULL' : this.M_SM_SalesEntry.currencycd ,
                    X0: 'NULL', //this.M_SM_SalesEntry.x0,
                    X1: 'NULL', //this.M_SM_SalesEntry.x1,
                    X2: 'NULL', //this.M_SM_SalesEntry.x2,
                    X3: 'NULL', //this.M_SM_SalesEntry.x3,
                    X4: 'NULL', //this.M_SM_SalesEntry.x4,
                    X5: 'NULL', //this.M_SM_SalesEntry.x5,
                    X6: 'NULL', //this.M_SM_SalesEntry.x6,
                    X7: 'NULL', //this.M_SM_SalesEntry.x7,
                    X8: 'NULL', //this.M_SM_SalesEntry.x8,
                    X9: 'NULL', //this.M_SM_SalesEntry.x9,
                    Remarks: this.M_SM_SalesEntry.remarks,
                    UserInput: this.getDataUser().user_id ,
                    ReferralID: this.M_SM_SalesEntry.referralid == '' || this.M_SM_SalesEntry.referralid == null ? 'NULL' : this.M_SM_SalesEntry.referralid ,
                    AgentID: this.M_SM_SalesEntry.agentid == '' || this.M_SM_SalesEntry.agentid == null ? 'NULL' : this.M_SM_SalesEntry.agentid                 
                }

                this.postJSON(this.getUrlInsert(), param)
                .then((response) => {
                    if(response == null) return

            //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                    this.$parent.resultInsert(response.Message)
              
            
                })
            
        },
        M_Insert() {            
            this.fn_generate()
            
        },
        M_Update() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfoliocd: this.getDataUser().subportfolio_cd,
                OrderNo: this.M_SM_SalesEntry.orderno,
                OrderDate: this.M_SM_SalesEntry.orderdate == '' || this.M_SM_SalesEntry.orderdate == null ? 'NULL' : this.M_SM_SalesEntry.orderdate ,
                SnPNo: this.M_SM_SalesEntry.snpno,
                SnPDate: this.M_SM_SalesEntry.snpdate == '' || this.M_SM_SalesEntry.snpdate == null ? 'NULL' : this.M_SM_SalesEntry.snpdate ,
                VONo: this.M_SM_SalesEntry.vono,
                VODate: this.M_SM_SalesEntry.vodate == '' || this.M_SM_SalesEntry.vodate == null ? 'NULL' : this.M_SM_SalesEntry.vodate ,
                ReferenceNo: this.M_SM_SalesEntry.referenceno,
                ContactID: this.M_SM_SalesEntry.contactid == '' || this.M_SM_SalesEntry.contactid == null ? 'NULL' : this.M_SM_SalesEntry.contactid ,
                MarketingID: this.M_SM_SalesEntry.marketingid == '' || this.M_SM_SalesEntry.marketingid == null ? 'NULL' : this.M_SM_SalesEntry.marketingid ,
                HandOverDate: this.M_SM_SalesEntry.handoverdate == '' || this.M_SM_SalesEntry.handoverdate == null ? 'NULL' : this.M_SM_SalesEntry.handoverdate ,
                SalesTypeCd: this.M_SM_SalesEntry.salestypecd == '' || this.M_SM_SalesEntry.salestypecd == null ? 'NULL' : this.M_SM_SalesEntry.salestypecd ,
                MediaCd: this.M_SM_SalesEntry.mediacd == '' || this.M_SM_SalesEntry.mediacd == null ? 'NULL' : this.M_SM_SalesEntry.mediacd ,
                SolicitorID: this.M_SM_SalesEntry.solicitorid == '' || this.M_SM_SalesEntry.solicitorid == null ? 'NULL' : this.M_SM_SalesEntry.solicitorid ,
                FinancierID: this.M_SM_SalesEntry.financierid == '' || this.M_SM_SalesEntry.financierid == null ? 'NULL' : this.M_SM_SalesEntry.financierid ,
                LotNo: this.M_SM_SalesEntry.lotno == '' || this.M_SM_SalesEntry.lotno == null ? 'NULL' : this.M_SM_SalesEntry.lotno ,
                PreviousLotNo: this.M_SM_SalesEntry.previouslotno,
                CurrencyCd: this.M_SM_SalesEntry.currencycd == '' || this.M_SM_SalesEntry.currencycd == null ? 'NULL' : this.M_SM_SalesEntry.currencycd ,
                ReferralID: this.M_SM_SalesEntry.referralid == '' || this.M_SM_SalesEntry.referralid == null ? 'NULL' : this.M_SM_SalesEntry.referralid ,
                X0: 'NULL', //this.M_SM_SalesEntry.x0,
                X1: 'NULL', //this.M_SM_SalesEntry.x1,
                X2: 'NULL', //this.M_SM_SalesEntry.x2,
                X3: 'NULL', //this.M_SM_SalesEntry.x3,
                X4: 'NULL', //this.M_SM_SalesEntry.x4,
                X5: 'NULL', //this.M_SM_SalesEntry.x5,
                X6: 'NULL', //this.M_SM_SalesEntry.x6,
                X7: 'NULL', //this.M_SM_SalesEntry.x7,
                X8: 'NULL', //this.M_SM_SalesEntry.x8,
                X9: 'NULL', //this.M_SM_SalesEntry.x9,
                Remarks: this.M_SM_SalesEntry.remarks,
                UserInput: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_SalesEntry.lastupdatestamp,
                AgentID: this.M_SM_SalesEntry.agentid == '' || this.M_SM_SalesEntry.agentid == null ? 'NULL' : this.M_SM_SalesEntry.agentid               
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_SalesEntry = {
                orderno: '',
                agentid: '',
                orderdate: '',
                marketingid: '',
                mediacd: '',
                lotno: '',
                solicitorid: '',
                salestypecd: '',
                financierid: '',
                snpno: '',
                referenceno: '',
                snpdate: '',
                vono: '',
                currencycd: '',
                vodate: '',
                commisionstatusdescs: '',
                contactid: '',
                referralid: '',
                remarks: '',
                el1: '',
                el2: '',
                el3: '',
                el4: '',
                el5: '',
                votrxamt: '0',
                vonetamt: '0',
                vovatamt: '0',
                vototalamt: '0',
                voreceivedamt: '0',
                othertrxamt: '0',
                unittrxamt: '0',
                unitnetamt: '0',
                unitvatamt: '0',
                unittotalamt: '0',
                unitreceivedamt: '0',
                othertrxamt: '0',
                othernetamt: '0',
                othervatamt: '0',
                othertotalamt: '0',
                otherreceivedamt: '0',
                totaltrxamt: '0',
                totalnetamt: '0',
                totalvatamt: '0',
                grandtotal: '0',
                totalreceivedamt: '0',
                handoverdate: ''
                    }
            	
	
		},
        M_New(){
          if (this.inputStatus != "VIEW") {
            
          }
          if(this.dataSpec.OrderRunningCd != ''){
            this.M_SM_SalesEntry.orderno = "(Auto Number)"
            this.PI_orderno.cProtect = true
          }else{
            this.M_SM_SalesEntry.orderno = ""
            this.PI_orderno.cProtect = false
          }

          if(this.dataSpec.SnPRunningCd != ''){
            this.M_SM_SalesEntry.snpno = "(Auto Number)"
            this.PI_snpno.cProtect = true
          }else{
            this.M_SM_SalesEntry.snpno = ""
            this.PI_snpno.cProtect = false
          }
          
          if(this.dataSpec.VORunningCd != ''){
            this.M_SM_SalesEntry.vono = "(Auto Number)"
            this.PI_vono.cProtect = true
          }else{
            this.M_SM_SalesEntry.vono = ""
            this.PI_vono.cProtect = false
          }

          this.M_SM_SalesEntry.currencycd = this.dataSpec.CurrencyCd
          this.M_SM_SalesEntry.currencycdLabel = this.dataSpec.CurrencyCd
          //this.dataSpec
          
        },
        M_Edit(){
        },
        M_Delete(dt){       
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				
				dataDelete.push({
					_Message_:'',
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
                    LotNo: value.LotNo == '' || value.LotNo == null ? 'NULL' : value.LotNo ,
                    OrderNo: value.OrderNo,
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
                LineNo: this.$parent.data.page_order
,                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                orderno: record.OrderNo
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                console.log(data)
this.M_SM_SalesEntry = {
                orderno: data.orderno,
                agentid: data.principleid,
                orderdate: data.orderdate,
                marketingid: data.marketingid,
                mediacd: data.mediacd,
                lotno: data.lotno,
                solicitorid: data.solicitorid,
                salestypecd: data.salestypecd,
                financierid: data.financierid,
                snpno: data.snpno,
                referenceno: data.referenceno,
                snpdate: data.snpdate,
                vono: data.vono,
                currencycd: data.currencycd,
                vodate: data.vodate,
                commisionstatusdescs: data.commisionstatusdescs,
                contactid: data.contactid,
                referralid: data.referralid,
                remarks: data.remarks,
                el1: data.el1,
                el2: data.el2,
                el3: data.el3,
                el4: data.el4,
                el5: data.el5,
                votrxamt: this.isCurrency(data.vopriceafterdiscount, this.decimal),
                vonetamt: this.isCurrency(data.vobaseamt, this.decimal),
                vovatamt: this.isCurrency(data.votaxamt, this.decimal),
                vototalamt: this.isCurrency(data.vototalamt, this.decimal),
                voreceivedamt: this.isCurrency(data.receivedv, this.decimal),
                // othertrxamt: this.isCurrency(data.otherpriceafterdiscount, this.decimal),
                unittrxamt: this.isCurrency(data.lotpriceafterdiscount, this.decimal),
                unitnetamt: this.isCurrency(data.lotbaseamt, this.decimal),
                unitvatamt: this.isCurrency(data.lottaxamt, this.decimal),
                unittotalamt: this.isCurrency(data.lottotalamt, this.decimal),
                unitreceivedamt: this.isCurrency(data.receivedu, this.decimal),
                othertrxamt: this.isCurrency(data.otherpriceafterdiscount, this.decimal),
                othernetamt: this.isCurrency(data.otherbaseamt, this.decimal),
                othervatamt: this.isCurrency(data.othertaxamt, this.decimal),
                othertotalamt: this.isCurrency(data.othertotalamt, this.decimal),
                otherreceivedamt: this.isCurrency(data.receivedo, this.decimal),
                totaltrxamt: this.isCurrency(data.totalafterdiscountamt, this.decimal),
                totalnetamt: this.isCurrency(data.totalnetamt, this.decimal),
                totalvatamt: this.isCurrency(data.totalvatamt, this.decimal),
                grandtotal: this.isCurrency(data.grandtotal, this.decimal),
                totalreceivedamt: this.isCurrency(data.receivedtotal, this.decimal),
                handoverdate: data.handoverdate,
                previouslotno: data.lotno,
                lastupdatestamp: record.LastUpdateStamp
                    }
                 

                this.M_SM_SalesEntry.agentidLabel = this.M_SM_SalesEntry.agentid != null && this.M_SM_SalesEntry.agentid != '' ? data.principleid + this.separator  + data.principlename:'' 
                this.M_SM_SalesEntry.marketingidLabel = this.M_SM_SalesEntry.marketingid != null && this.M_SM_SalesEntry.marketingid != '' ? data.marketingid + this.separator + data.marketingname :'' 
                this.M_SM_SalesEntry.mediacdLabel = this.M_SM_SalesEntry.mediacd != null && this.M_SM_SalesEntry.mediacd != '' ? data.mediacd + this.separator + data.mediadescs :'' 
                this.M_SM_SalesEntry.lotnoLabel = this.M_SM_SalesEntry.lotno != null && this.M_SM_SalesEntry.lotno != '' ? data.lotno + this.separator + data.lotdescs :'' 
                this.M_SM_SalesEntry.solicitoridLabel = this.M_SM_SalesEntry.solicitorid != null && this.M_SM_SalesEntry.solicitorid != '' ? data.solicitorid + this.separator + data.solicitorname  :'' 
                this.M_SM_SalesEntry.salestypecdLabel = this.M_SM_SalesEntry.salestypecd != null && this.M_SM_SalesEntry.salestypecd != '' ? data.salestypecd + this.separator + data.paymentdescs :'' 
                this.M_SM_SalesEntry.financieridLabel = this.M_SM_SalesEntry.financierid != null && this.M_SM_SalesEntry.financierid != '' ? data.financierid + this.separator + data.financiername :'' 
                this.M_SM_SalesEntry.currencycdLabel = this.M_SM_SalesEntry.currencycd != null && this.M_SM_SalesEntry.currencycd != '' ? data.currencycd + this.separator + data.currencydescs :'' 
                this.M_SM_SalesEntry.contactidLabel = this.M_SM_SalesEntry.contactid != null && this.M_SM_SalesEntry.contactid != '' ? data.contactid + this.separator + data.contactname  :'' 
                this.M_SM_SalesEntry.referralidLabel = this.M_SM_SalesEntry.referralid != null && this.M_SM_SalesEntry.referralid != '' ? data.referralid + this.separator + data.referralname :'' 
         

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

            })
        },
        GetSpecificationData(){ 
          var param = {
            OptionFunctionCd: "GetSMSpecification",
            ModuleCd: this.Module,
            SubPortfolioCd: this.getDataUser().subportfolio_cd
          }

          this.FnDynamicFunction(param)
            .then(ress => {
                if (ress == null || ress.length==0) {
                  this.alertError('Please setup the Sales Specification first.')
                  this.isError = true
                  return
                }else{
                  this.isError = false
                }
                // var data = ress[0]
                this.dataSpec = ress[0]

              
            })
        }

    },
    beforeCreate: function () {
    },
    created: function() {
      this.GetSpecificationData()
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

