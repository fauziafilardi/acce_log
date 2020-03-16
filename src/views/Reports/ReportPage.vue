<template>
  <div class="height--full">
    <div class="header--content">
      <div class="header--content__breadcrumbs">
        Invoice direct allocation
      </div>
    </div>

    <!-- body -->
    <!-- <div class="content-app__body"> -->
      <!-- <div class="content-app-form__body" style="background-color: white;padding-top: 1px !important;margin-left: 15px;margin-right: 15px;height: 95%;overflow-y: auto;overflow-x: hidden;padding-bottom: 1%;"> -->
        <div class="form-report">
        <!-- <div> -->
        <!-- coding body is here -->
        <!-- <b-row>
          <b-col md="12">
            <ABSinputTextVuex :prop="PI_TaxCd" v-model="M_CM_TaxMaster.TaxCd"/>
          </b-col>
        </b-row>
        <b-row>
          <b-col> -->
            <!-- <ABSPreviewReport
                cVisible="true"
                :cSrc="dataUrl" /> -->
          <!-- </b-col>
        </b-row> -->
        <b-collapse id="collapse1" :visible="true">
        <b-row style="margin-left:20px;margin-top: 20px;">					
          <b-col md="12" id="col-left">
              {{PageLevel}}
            <b-row>
              <b-col md="6">
                <ABSInputSelectList @change="OnDebitNoFromChange" :prop="PI_FromDebitNo" :value="InvoiceAllocationDirect.FromDebitNo" :label="InvoiceAllocationDirect.FromDebitNoLabel"/>
              </b-col>
              <b-col md="6">
                <ABSInputSelectList @change="OnDebitNoToChange" :prop="PI_ToDebitNo" :value="InvoiceAllocationDirect.ToDebitNo" :label="InvoiceAllocationDirect.ToDebitNoLabel"/>
              </b-col>
            </b-row>

            <b-row>
              <b-col md="6">
                <ABSinputDateRangeVuex :prop="PI_DebitDate" :valueFrom="InvoiceAllocationDirect.FromDebitDate" :valueTo="InvoiceAllocationDirect.ToDebitDate" @from="OnFromDebitDate" @to="OnToDebitDate" />
              </b-col>
            </b-row>

            <b-row>
              <b-col md="6">
                <ABSInputSelectList @change="OnDebtorCdFromChange" :prop="PI_FromDebtorCd" :value="InvoiceAllocationDirect.FromDebtorCd" :label="InvoiceAllocationDirect.FromDebtorCdLabel"/>
              </b-col>
              <b-col md="6">
                <ABSInputSelectList @change="OnDebtorCdToChange" :prop="PI_ToDebtorCd" :value="InvoiceAllocationDirect.ToDebtorCd" :label="InvoiceAllocationDirect.ToDebtorCdLabel"/>
              </b-col>
            </b-row>

            <b-row>
              <b-col md="6">
                <ABSInputSelectList @change="OnTrxTypeFromChange" :prop="PI_TrxTypeFrom" :value="InvoiceAllocationDirect.FromTrxType" :label="InvoiceAllocationDirect.FromTrxTypeLabel"/>
              </b-col>
              <b-col md="6">
                <ABSInputSelectList @change="OnTrxTypeToChange" :prop="PI_TrxTypeTo" :value="InvoiceAllocationDirect.ToTrxType" :label="InvoiceAllocationDirect.ToTrxTypeLabel"/>
              </b-col>
            </b-row>

            <b-row>
              <b-col md="6">
                <ABSInputSelectList @change="OnCashierNoFromChange" :prop="PI_FromCashierNo" :value="InvoiceAllocationDirect.FromCashierNo" :label="InvoiceAllocationDirect.FromCashierNoLabel"/>
              </b-col>
              <b-col md="6">
                <ABSInputSelectList @change="OnCashierNoToChange" :prop="PI_ToCashierNo" :value="InvoiceAllocationDirect.ToCashierNo" :label="InvoiceAllocationDirect.ToCashierNoLabel"/>
              </b-col>
            </b-row>

            <b-row>
              <b-col md="6">
                <ABSInputSelectList @change="OnCreditNoFromChange" :prop="PI_FromCreditNo" :value="InvoiceAllocationDirect.FromCreditNo" :label="InvoiceAllocationDirect.FromCreditNoLabel"/>
              </b-col>
              <b-col md="6">
                <ABSInputSelectList @change="OnCreditNoToChange" :prop="PI_ToCreditNo" :value="InvoiceAllocationDirect.ToCreditNo" :label="InvoiceAllocationDirect.ToCreditNoLabel"/>
              </b-col>
            </b-row>

            <b-row>
              <b-col md="6">
                <ABSinputDateRangeVuex :prop="PI_CreditDate" :valueFrom="InvoiceAllocationDirect.FromCreditDate" :valueTo="InvoiceAllocationDirect.ToCreditDate" @from="OnFromCreditDate" @to="OnToCreditDate" />
              </b-col>
            </b-row>

            <b-row>
              <b-col md="6">
                <ABSInputSelectList @change="OnContactIdFromChange" :prop="PI_FromContactId" :value="InvoiceAllocationDirect.FromContactId" :label="InvoiceAllocationDirect.FromContactIdLabel"/>
              </b-col>
              <b-col md="6">
                <ABSInputSelectList @change="OnContactIdToChange" :prop="PI_ToContactId" :value="InvoiceAllocationDirect.ToContactId" :label="InvoiceAllocationDirect.ToContactIdLabel"/>
              </b-col>
            </b-row>

            <b-row>
              <b-col md="6">
                <ABSInputSelect2 @change="OnSortByChange" :prop="PI_SortBy" :value="InvoiceAllocationDirect.SortBy" ref="ref_sortBy" />
              </b-col>
            </b-row>



            <b-row>
              <b-col md="12" style="text-align:center;padding-top:10px;padding-bottom:10px">
                <ABSButton
                  text="Generate Report"
                  icon="list"
                  classButton="button button--refresh"
                  classIcon="icon-style-1"
                  @click="M_GenerateReport"
                  styleButton="width: 200px !important;"
                />
              </b-col>
            </b-row>
          </b-col>
        </b-row>
        </b-collapse>
        <div class="div-collapse" v-b-toggle.collapse1>
          <span class="master-span">
            <!-- nput By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}}--> <font-awesome-icon icon="sort-down" class="icon-style-1__master" />  
          </span>
        </div>
        <!-- <b-collapse id="collapse1" :visible="true"> -->
          <ABSPreviewReport :cVisible="reportVisible" :cSrc="dataUrl" />
        <!-- </b-collapse> -->
        <!-- <b-row>
          <b-col md="12" style="margin-left: 15px;"> -->
            <!-- <ABSPreviewReport :cVisible="reportVisible" :cSrc="dataUrl" /> -->
          <!-- </b-col>
        </b-row> -->
    </div>
    <!-- <ABSPreviewReport :cVisible="reportVisible" :cSrc="dataUrl" /> -->
  </div>
</template>

<script>

export default {
  data() {
    return {
      dataUrl:'http://192.168.6.98/ReportPams/ReportsTemplate?oid='+this.getOptionSeq().OptionSeq+'&ParamWhere=',
      // xx: 'http://192.168.6.98/ReportPams/ReportsTemplate?oid=cfcd208495d565ef66e7dff9f98764da&ParamWhere=PortfolioName:PT. Absolute Connection^SubPortfolioName:PT. Absolute Connection^SubportfolioAddress:^SubportfolioCd:001',
      // field: null,
      // fieldArray: [],
      // html: [],
      PageLevel: '',
      TabIndex: '',
      reportParam: null,
      reportVisible: false,
      InvoiceAllocationDirect : {
        // PortfolioName: this.getDataUser().PortfolioName,
        // SubPortfolioName: this.getDataUser().SubPortfolioName,
        // SubportfolioAddress: '',
        // SubportfolioCd: this.getDataUser().subportfolio_cd,
        // DateFormat: 'dd-MMM-yyyy',
        // FormatNumber: '###,##0.00',
        // UserName: this.getDataUser().user_name,
        // LogoUrl: '',

        // param screen
        FromDebitNo: '', FromDebitNoLabel: '',
        ToDebitNo: '',  ToDebitNoLabel: '',

        FromDebtorCd: '', FromDebtorCdLabel: '',
        ToDebtorCd: '', ToDebtorCdLabel: '',

        FromTrxType: '', FromTrxTypeLabel: '',
        ToTrxType: '', ToTrxTypeLabel: '',

        FromCreditDate: '',
        ToCreditDate: '',

        FromDebitDate: '',
        ToDebitDate: '',

        FromCashierNo: '', FromCashierNoLabel: '',
        ToCashierNo: '', ToCashierNoLabel: '',

        FromCreditNo: '', FromCreditNoLabel: '',
        ToCreditNo: '', ToCreditNoLabel: '',

        SortBy: '', SortByLabel: '',

        FromContactId: '', FromContactIdLabel: '',
        ToContactId: '', ToContactIdLabel: ''
      },
      PI_FromDebitNo: {
        dataLookUp: {
          LookUpCd: 'GetLookupARDebitNo_Listing',
          ColumnDB: 'DebitNo',
          InitialWhere: "Status = 'P' AND JournalCategory = 'D' AND SUBPORTFOLIOCD='" + this.getDataUser().subportfolio_cd + "'",
          ParamWhere: ''
        },
        cValidate :'',
        cName:'FromDebitNo',
        cLabel:'Invoice No From',
        cOrder:1,
        cKey: true,
        cPageLevel: this.PageLevel,
        cAsync: true,
        cTabIndex: this.TabIndex,
        cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
        cDisplayColumn:'DebitNo,DebitDate'
      },
      PI_ToDebitNo: {
        dataLookUp: {
          LookUpCd: 'GetLookupARDebitNo_Listing',
          ColumnDB: 'DebitNo',
          InitialWhere: "Status = 'P' AND JournalCategory = 'D' AND SUBPORTFOLIOCD='" + this.getDataUser().subportfolio_cd + "'",
          ParamWhere: ''
        },
        cValidate :'',
        cName:'ToDebitNo',
        cLabel:'To',
        cOrder:2,
        cKey: true,
        cPageLevel: this.PageLevel,
        cAsync: true,
        cTabIndex: this.TabIndex,
        cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
        cDisplayColumn:'DebitNo,DebitDate'
      },

      PI_DebitDate: {
        cName:'DebitDate',
        cLabel:'Invoice Date',
        cOrder:3,
        cKey:false,
        cProtect: false,
        cPageLevel: this.PageLevel,
        cTabIndex: this.TabIndex,
        cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
      },

      PI_FromDebtorCd: {
        dataLookUp: {
          LookUpCd: 'GetLookupARDebtor',
          ColumnDB: 'DebtorCd',
          InitialWhere: "Status = 'Y' AND SUBPORTFOLIOCD='" + this.getDataUser().subportfolio_cd + "'",
          ParamWhere: ''
        },
        cValidate :'',
        cName:'FromDebtorCd',
        cLabel:'Debtor Code From',
        cOrder:5,
        cKey: true,
        cPageLevel: this.PageLevel,
        cAsync: true,
        cTabIndex: this.TabIndex,
        cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
        cDisplayColumn:'DebtorCd,DebtorName'
      },
      PI_ToDebtorCd: {
        dataLookUp: {
          LookUpCd: 'GetLookupARDebtor',
          ColumnDB: 'DebtorCd',
          InitialWhere: "Status = 'Y' AND SUBPORTFOLIOCD='" + this.getDataUser().subportfolio_cd + "'",
          ParamWhere: ''
        },
        cValidate :'',
        cName:'ToDebtorCd',
        cLabel:'To',
        cOrder:6,
        cKey: true,
        cPageLevel: this.PageLevel,
        cAsync: true,
        cTabIndex: this.TabIndex,
        cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
        cDisplayColumn:'DebtorCd,DebtorName'
      },

      PI_TrxTypeFrom: {
        dataLookUp: {
          LookUpCd: 'GetLookupCMTransTypeBySubPortfolio',
          ColumnDB: 'TrxType',
          InitialWhere: "ModuleCd = 'AR' AND TrxClass IN ('I','D') AND SUBPORTFOLIOCD='" + this.getDataUser().subportfolio_cd + "'",
          ParamWhere: ''
        },
        cValidate :'',
        cName:'TrxTypeFrom',
        cLabel:'Trans. Type From',
        cOrder:7,
        cKey: true,
        cPageLevel: this.PageLevel,
        cAsync: true,
        cTabIndex: this.TabIndex,
        cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
        cDisplayColumn:'TrxType,Descs'
      },
      PI_TrxTypeTo: {
        dataLookUp: {
          LookUpCd: 'GetLookupCMTransTypeBySubPortfolio',
          ColumnDB: 'TrxType',
          InitialWhere: "ModuleCd = 'AR' AND TrxClass IN ('I','D') AND SUBPORTFOLIOCD='" + this.getDataUser().subportfolio_cd + "'",
          ParamWhere: ''
        },
        cValidate :'',
        cName:'TrxTypeTo',
        cLabel:'To',
        cOrder:8,
        cKey: true,
        cPageLevel: this.PageLevel,
        cAsync: true,
        cTabIndex: this.TabIndex,
        cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
        cDisplayColumn:'TrxType,Descs'
      },

      
      PI_FromCashierNo: {
        dataLookUp: {
          LookUpCd: 'GetLookupARCashierNo',
          ColumnDB: 'CashierNo',
          InitialWhere: "PaymentAllocationStatus='T' And DebtorCd IS NOT NULL And PaymentCategory='I' And LedgerHStatus='Y' AND SUBPORTFOLIOCD='" + this.getDataUser().subportfolio_cd + "'",
          ParamWhere: ''
        },
        cValidate :'',
        cName:'FromCashierNo',
        cLabel:'Cashier No From',
        cOrder:9,
        cKey: true,
        cPageLevel: this.PageLevel,
        cAsync: true,
        cTabIndex: this.TabIndex,
        cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
        cDisplayColumn:'CashierNo,PaymentCategoryDescs'
      },
      PI_ToCashierNo: {
        dataLookUp: {
          LookUpCd: 'GetLookupARCashierNo',
          ColumnDB: 'CashierNo',
          InitialWhere: "PaymentAllocationStatus='T' And DebtorCd IS NOT NULL And PaymentCategory='I' And LedgerHStatus='Y' AND SUBPORTFOLIOCD='" + this.getDataUser().subportfolio_cd + "'",
          ParamWhere: ''
        },
        cValidate :'',
        cName:'ToCashierNo',
        cLabel:'To',
        cOrder:10,
        cKey: true,
        cPageLevel: this.PageLevel,
        cAsync: true,
        cTabIndex: this.TabIndex,
        cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
        cDisplayColumn:'CashierNo,PaymentCategoryDescs'
      },

      PI_FromCreditNo: {
        dataLookUp: {
          LookUpCd: 'GetLookupARCreditNoIn',
          ColumnDB: 'CreditNo',
          InitialWhere: "Source In ('L','R','E','Z') AND SUBPORTFOLIOCD='" + this.getDataUser().subportfolio_cd + "'",
          ParamWhere: ''
        },
        cValidate :'',
        cName:'FromCreditNo',
        cLabel:'OR / Allocation /CN No From',
        cOrder:11,
        cKey: true,
        cPageLevel: this.PageLevel,
        cAsync: true,
        cTabIndex: this.TabIndex,
        cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
        cDisplayColumn:'CreditNo,CreditDate'
      },
      PI_ToCreditNo: {
        dataLookUp: {
          LookUpCd: 'GetLookupARCreditNoIn',
          ColumnDB: 'CreditNo',
          InitialWhere: "Source In ('L','R','E','Z') AND SUBPORTFOLIOCD='" + this.getDataUser().subportfolio_cd + "'",
          ParamWhere: ''
        },
        cValidate :'',
        cName:'ToCreditNo',
        cLabel:'To',
        cOrder:12,
        cKey: true,
        cPageLevel: this.PageLevel,
        cAsync: true,
        cTabIndex: this.TabIndex,
        cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
        cDisplayColumn:'CreditNo,CreditDate'
      },
      
      PI_CreditDate: {
        cName:'CreditDate',
        cLabel:'OR / Allocation / CN Date From',
        cOrder:13,
        cKey:false,
        cProtect: false,
        cPageLevel: this.PageLevel,
        cTabIndex: this.TabIndex,
        cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
      },

      PI_FromContactId: {
        dataLookUp: {
          LookUpCd: 'GetLookupCMContact',
          ColumnDB: 'ContactId',
          InitialWhere: "",
          ParamWhere: ''
        },
        cValidate :'',
        cName:'FromContactId',
        cLabel:'From Contact ID',
        cOrder:15,
        cKey: true,
        cPageLevel: this.PageLevel,
        cAsync: true,
        cTabIndex: this.TabIndex,
        cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
        cDisplayColumn:'ContactId,Name'
      },
      PI_ToContactId: {
        dataLookUp: {
          LookUpCd: 'GetLookupCMContact',
          ColumnDB: 'ContactId',
          InitialWhere: "",
          ParamWhere: ''
        },
        cValidate :'',
        cName:'ToContactId',
        cLabel:'To',
        cOrder:16,
        cKey: true,
        cPageLevel: this.PageLevel,
        cAsync: true,
        cTabIndex: this.TabIndex,
        cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
        cDisplayColumn:'ContactId,Name'
      },
      PI_SortBy: { 
        dataLookUp: null, 
        cValidate :'', 
        cName: 'sortBy', 
        cLabel: 'Sort By', 
        cLabelSize: 4, 
        cOrder: 24, 
        cKey: false, 
        cTriggered: false, 
        cDefault: 'A.DebitNo', 
        cProtect: false, 
        cVisible:  true, 
        cAsync:  false, 
        cFilter: true, 
        cPageLevel: this.PageLevel, 
        cTabIndex: this.TabIndex, 
        cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
        cStatic: true, 
        cOption: [{ label: 'Invoice No', id: 'A.DebitNo' },{ label: 'Application No', id: 'A.ApplicationNo' }], 
        cMasterUrl: '' ,
        cDisplayColumn: '' ,
      }, 
      debtorawal:'',
    }
  },
  methods: {
    OnDebitNoFromChange (data) {
      this.InvoiceAllocationDirect.FromDebitNo = data.id
      this.InvoiceAllocationDirect.FromDebitNoLabel = data.label
      this.debtorawal = data.DebtorCd
      this.InvoiceAllocationDirect.ToDebitNo = data.id
      this.InvoiceAllocationDirect.ToDebitNoLabel = data.label
    },
    OnDebitNoToChange (data) {
      this.InvoiceAllocationDirect.ToDebitNo = data.id
      this.InvoiceAllocationDirect.ToDebitNoLabel = data.label
      this.PI_FromDebtorCd.dataLookUp.InitialWhere = "Status = 'Y' AND SUBPORTFOLIOCD='" + this.getDataUser().subportfolio_cd + "' AND ( DebtorCd Between '"+this.debtorawal+"' AND '"+data.DebtorCd+"' )"
    },
    OnFromDebitDate (data) {
      this.InvoiceAllocationDirect.FromDebitDate = data

      this.InvoiceAllocationDirect.ToDebitDate = data
    },
    OnToDebitDate (data) {
      this.InvoiceAllocationDirect.ToDebitDate = data
    },
    OnDebtorCdFromChange (data) {
      this.InvoiceAllocationDirect.FromDebtorCd = data.id
      this.InvoiceAllocationDirect.FromDebtorCdLabel = data.label

      this.InvoiceAllocationDirect.ToDebtorCd = data.id
      this.InvoiceAllocationDirect.ToDebtorCdLabel = data.label
    },
    OnDebtorCdToChange (data) {
      this.InvoiceAllocationDirect.ToDebtorCd = data.id
      this.InvoiceAllocationDirect.ToDebtorCdLabel = data.label
    },
    OnTrxTypeFromChange (data) {
      this.InvoiceAllocationDirect.FromTrxType = data.id
      this.InvoiceAllocationDirect.FromTrxTypeLabel = data.label

      this.InvoiceAllocationDirect.ToTrxType = data.id
      this.InvoiceAllocationDirect.ToTrxTypeLabel = data.label
    },
    OnTrxTypeToChange (data) {
      this.InvoiceAllocationDirect.ToTrxType = data.id
      this.InvoiceAllocationDirect.ToTrxTypeLabel = data.label
    },
    OnCashierNoFromChange (data) {
      this.InvoiceAllocationDirect.FromCashierNo = data.id
      this.InvoiceAllocationDirect.FromCashierNoLabel = data.label

      this.InvoiceAllocationDirect.ToCashierNo = data.id
      this.InvoiceAllocationDirect.ToCashierNoLabel = data.label
    },
    OnCashierNoToChange (data) {
      this.InvoiceAllocationDirect.ToCashierNo = data.id
      this.InvoiceAllocationDirect.ToCashierNoLabel = data.label
    },
    OnCreditNoFromChange (data) {
      this.InvoiceAllocationDirect.FromCreditNo = data.id
      this.InvoiceAllocationDirect.FromCreditNoLabel = data.label

      this.InvoiceAllocationDirect.ToCreditNo = data.id
      this.InvoiceAllocationDirect.ToCreditNoLabel = data.label
    },
    OnCreditNoToChange (data) {
      this.InvoiceAllocationDirect.ToCreditNo = data.id
      this.InvoiceAllocationDirect.ToCreditNoLabel = data.label
    },
    OnFromCreditDate (data) {
      this.InvoiceAllocationDirect.FromCreditDate = data

      this.InvoiceAllocationDirect.ToCreditDate = data
    },
    OnToCreditDate (data) {
      this.InvoiceAllocationDirect.ToCreditDate = data
    },
    OnContactIdFromChange (data) {
      this.InvoiceAllocationDirect.FromContactId = data.id
      this.InvoiceAllocationDirect.FromContactIdLabel = data.label

      this.InvoiceAllocationDirect.ToContactId = data.id
      this.InvoiceAllocationDirect.ToContactIdLabel = data.label
    },
    OnContactIdToChange (data) {
      this.InvoiceAllocationDirect.ToContactId = data.id
      this.InvoiceAllocationDirect.ToContactIdLabel = data.label
    },
    OnSortByChange (data) {
      this.InvoiceAllocationDirect.SortBy = data.id
      this.InvoiceAllocationDirect.SortByLabel = data.label
    },
    M_ClearForm () {
      this.InvoiceAllocationDirect = {
        // PortfolioName: this.getDataUser().PortfolioName,
        // SubPortfolioName: this.getDataUser().SubPortfolioName,
        // SubportfolioAddress: '',
        // SubportfolioCd: this.getDataUser().subportfolio_cd,
        // DateFormat: 'dd-MMM-yyyy',
        // FormatNumber: '###,##0.00',
        // UserName: this.getDataUser().user_name,
        // LogoUrl: '',

        // param screen
        FromDebitNo: '', FromDebitNoLabel: '',
        ToDebitNo: '',  ToDebitNoLabel: '',

        FromDebtorCd: '',
        ToDebtorCd: '',

        FromTrxType: '',
        ToTrxType: '',

        FromCreditDate: '',
        ToCreditDate: '',

        FromDebitDate: '',
        ToDebitDate: '',

        FromCashierNo: '',
        ToCashierNo: '',

        FromCreditNo: '',
        ToCreditNo: '',

        SortBy: '',
        FromContactId: '',
        ToContactId: ''
      }
    },
    M_GenerateReport () {
      // var param = {
      //   PortfolioName: this.getDataUser().PortfolioName,
      //   SubPortfolioName: this.getDataUser().SubPortfolioName,
      //   SubportfolioAddress: '',
      //   SubportfolioCd: this.getDataUser().subportfolio_cd,
      //   DateFormat: 'dd-MMM-yyyy',
      //   FormatNumber: '###,##0.00',
      //   UserName: this.getDataUser().user_name,
      //   LogoUrl: '',

      //   // param screen
      //   FromDebitNo: this.InvoiceAllocationDirect.FromDebitNo,
      //   ToDebitNo: this.InvoiceAllocationDirect.ToDebitNo,

      //   FromDebtorCd: this.InvoiceAllocationDirect.FromDebtorCd,
      //   ToDebtorCd: this.InvoiceAllocationDirect.ToDebtorCd,

      //   FromTrxType: this.InvoiceAllocationDirect.FromTrxType,
      //   ToTrxType: this.InvoiceAllocationDirect.ToTrxType,

      //   FromCreditDate: this.InvoiceAllocationDirect.FromCreditDate,
      //   ToCreditDate: this.InvoiceAllocationDirect.ToCreditDate,

      //   FromDebitDate: this.InvoiceAllocationDirect.FromDebitDate,
      //   ToDebitDate: this.InvoiceAllocationDirect.ToDebitDate,

      //   FromCashierNo: this.InvoiceAllocationDirect.FromCashierNo,
      //   ToCashierNo: this.InvoiceAllocationDirect.ToCashierNo,

      //   FromCreditNo: this.InvoiceAllocationDirect.FromCreditNo,
      //   ToCreditNo: this.InvoiceAllocationDirect.ToCreditNo,

      //   SortBy: this.InvoiceAllocationDirect.SortBy,
      //   FromContactId: this.InvoiceAllocationDirect.FromContactId,
      //   ToContactId: this.InvoiceAllocationDirect.ToContactId
      // }

      var params = ""
      params += "PortfolioName:" + this.getDataUser().PortfolioName + "^"
      params += "SubPortfolioName:" + this.getDataUser().SubPortfolioName + "^"
      params += "SubportfolioAddress:^"
      params += "SubportfolioCd:" + this.getDataUser().subportfolio_cd + "^"
      params += "DateFormat:dd-MMM-yyyy^"
      params += "FormatNumber:###,##0.00^"
      params += "UserName:" + this.getDataUser().user_name + "^"
      params += "LogoUrl:^"
      params += "FromDebitNo:" + this.InvoiceAllocationDirect.FromDebitNo + "^"
      params += "ToDebitNo:" + this.InvoiceAllocationDirect.ToDebitNo + "^"
      params += "FromDebtorCd:" + this.InvoiceAllocationDirect.FromDebtorCd + "^"
      params += "ToDebtorCd:" + this.InvoiceAllocationDirect.ToDebtorCd + "^"
      params += "FromTrxType:" + this.InvoiceAllocationDirect.FromTrxType + "^"
      params += "ToTrxType:" + this.InvoiceAllocationDirect.ToTrxType + "^"
      params += "FromCreditDate:" + this.InvoiceAllocationDirect.FromCreditDate + "^"
      params += "ToCreditDate:" + this.InvoiceAllocationDirect.ToCreditDate + "^"
      params += "FromDebitDate:" + this.InvoiceAllocationDirect.FromDebitDate + "^"
      params += "ToDebitDate:" + this.InvoiceAllocationDirect.ToDebitDate + "^"
      params += "FromCashierNo:" + this.InvoiceAllocationDirect.FromCashierNo + "^"
      params += "ToCashierNo:" + this.InvoiceAllocationDirect.ToCashierNo + "^"
      params += "FromCreditNo:" + this.InvoiceAllocationDirect.FromCreditNo + "^"
      params += "ToCreditNo:" + this.InvoiceAllocationDirect.ToCreditNo + "^"
      params += "SortBy:" + this.InvoiceAllocationDirect.SortBy + "^"
      params += "FromContactId:" + this.InvoiceAllocationDirect.FromContactId + "^"
      params += "ToContactId:" + this.InvoiceAllocationDirect.ToContactId + ""

      var param = {
        OptionSeq : this.getOptionSeq().OptionSeq,
        ParamWhere: params
      }

      this.postEncode(this.getUrlSaveParamTemp(), param)
      .then((response) => {
          if(response == null) return
          var data = response.Data[0].Id
          this.dataUrl = 'http://192.168.6.98/ReportPams/ReportsTemplate?oid='+this.getOptionSeq().OptionSeq+'&ParamWhere=' + data+'&rs:Command=Render&rs:ClearSession=true&rc:Toolbar=false'
          console.log(this.dataUrl)
          this.reportVisible = true
      })
    }

    // doGetHtml () {
    //   var param = {			
    //     OptionSeq: this.getOptionSeq().OptionSeq,
    //   }

    //   this.postEncode(this.getUrlParamHTML(), param)
    //   .then((response) => {
    //       if(response == null) return
    //       console.log(response)
    //       this.html = response.Data
          
    //   })
    // }
  },
  beforeCreate: function () {
    this.PageLevel = 1
    this.TabIndex = 1
  },
  created: function() {
  },
  beforeMount: function() {
  },
  mounted: function() {
    this.hideSideBarMenu()
    // this.doGetHtml()

    this.$store.commit('setStatus', 'new')
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
  .button {
    width: 200px !important;
  }

  #ReportViewer1 .ToolBarButtonsCell{
    position: fixed !important;
    width: 100% !important;
  }

</style>
