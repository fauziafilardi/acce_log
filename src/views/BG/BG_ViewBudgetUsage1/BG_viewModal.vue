<template>
  <div>
    <b-row class="size-modal-content">
                <b-col sm="12" style="margin-left: 4px; margin-bottom: 10px; margin-top: 10px;">
                  <div class="modal-customize-abs__modal-header">
                  <div class="modal-customize-abs__modal-header--title">
                    View Budget Usage Detail
                  </div>
                  <div
                    class="modal-customize-abs__modal-header--icon"
                    @click="$emit('close')"
                  >
                    <i class="icon-close"></i>
                  </div>
                  <!-- <div 
                    class="modal-customize-abs__modal-header--icon"                   
                    @click="MaxModal"
                  >
                    <i class="icon-close"></i>
                  </div> -->
                </div>
                  <div class="modal-customize-abs__modal-body" style="padding-right: 0px;">
                    <!-- <p>Select data</p> -->
                    <div class="box-category">
                      <div class="table--list" style="max-height: 500px; width:100%;">  
                        <b-row>
                          <b-col md="6">
                              <ABSCompute :prop="PI_budgetcd" v-model="M_BG_ViewBudgetUsage.BudgetCd" />
                          </b-col>
                          <b-col md="6">
                              <ABSCompute :prop="PI_budgetcddescs" v-model="M_BG_ViewBudgetUsage.Descs" />
                          </b-col>
                        </b-row>
                        <!--table Header-->
                        <b-row style="padding-bottom:10px;">
                            <b-col md="12">
                                <b-container class="bv-example-row">
                                    <table style="font-size: 11px;">
                                        <thead style="text-align:center !important; background-color:#e9ecef;">
                                            <tr>
                                                <!-- <th style="min-width:50px; font-weight: normal !important;">Month</th>
                                                <th style="min-width:50px; font-weight: normal !important;">Year</th>
                                                <th style="min-width:150px; font-weight: normal !important;">SR</th>
                                                <th style="min-width:50px; font-weight: normal !important;">PO</th>
                                                <th style="min-width:50px; font-weight: normal !important;">GRN</th>
                                                <th style="min-width:200px; font-weight: normal !important;">InvoiceGRN</th>
                                                <th style="min-width:200px; font-weight: normal !important;">Invoice Manual</th>
                                                <th style="min-width:200px; font-weight: normal !important;">PO Contract</th>
                                                <th style="min-width:200px; font-weight: normal !important;">Invoice Contract</th>
                                                <th style="min-width:200px; font-weight: normal !important;">Cash Purchase</th>
                                                <th style="min-width:200px; font-weight: normal !important;">Stock Issue Manual</th>
                                                <th style="min-width:200px; font-weight: normal !important;">Payment</th>
                                                <th style="min-width:200px; font-weight: normal !important;">Debit Note</th>
                                                <th style="min-width:200px; font-weight: normal !important;">Total AMount</th> -->
                                                <th style="font-weight: normal !important;">Month</th>
                                                <th style="font-weight: normal !important;">Year</th>
                                                <th style="min-width:50px; font-weight: normal !important;">SR</th>
                                                <th style="min-width:50px; font-weight: normal !important;">PO</th>
                                                <th style="min-width:50px; font-weight: normal !important;">GRN</th>
                                                <th style="min-width:50px; font-weight: normal !important;">InvoiceGRN</th>
                                                <th style="min-width:50px; font-weight: normal !important;">Invoice Manual</th>
                                                <th style="min-width:50px; font-weight: normal !important;">PO Contract</th>
                                                <th style="min-width:50px; font-weight: normal !important;">Invoice Contract</th>
                                                <th style="min-width:50px; font-weight: normal !important;">Cash Purchase</th>
                                                <th style="min-width:50px; font-weight: normal !important;">Stock Issue Manual</th>
                                                <th style="min-width:50px; font-weight: normal !important;">Payment</th>
                                                <th style="min-width:50px; font-weight: normal !important;">Debit Note</th>
                                                <th style="min-width:50px; font-weight: normal !important;">Total AMount</th>
                                            </tr>
                                        </thead>
                                        <tbody v-for="(dataH,index) in dataModalHeader">
                                            <tr>
                                                <td style="text-align:center;"><span>{{dataH.BudgetMonth}}</span></td>
                                                <td style="text-align:center;"><span>{{dataH.BudgetYear}}</span></td>
                                                <td style="text-align:right;"><span>{{dataH.SRAmt}}</span></td>
                                                <td style="text-align:right;"><span>{{dataH.POAmt}}</span></td>
                                                <td style="text-align:right;"><span>{{dataH.GRNAmt}}</span></td>
                                                <td style="text-align:right;"><span>{{dataH.InvoiceGRNAmt}}</span></td>
                                                <td style="text-align:right;"><span>{{dataH.InvoiceManualAmt}}</span></td>
                                                <td style="text-align:right;"><span>{{dataH.PoContractAmt}}</span></td>
                                                <td style="text-align:right;"><span>{{dataH.InvoiceContractAmt}}</span></td>
                                                <td style="text-align:right;"><span>{{dataH.CashPurchaseAmt}}</span></td>
                                                <td style="text-align:right;"><span>{{dataH.StockIssueAmt}}</span></td>
                                                <td style="text-align:right;"><span>{{dataH.PaymentAmt}}</span></td>
                                                <td style="text-align:right;"><span>{{dataH.DebitNoteAmt}}</span></td>
                                                <td style="text-align:right;"><span>{{dataH.TotalAmt}}</span></td>
                                            </tr>
                                        </tbody>                                                                  
                                    </table>
                                </b-container>
                            </b-col>                            
                        </b-row>
                        <!--table Detail -->
                        <b-row>
                            <b-col md="12">
                                <b-container class="bv-example-row">
                                    <table style="font-size: 11px;">
                                        <thead style="text-align:center !important; background-color:#e9ecef;">
                                            <tr>
                                                <!-- <th style="min-width:50px; font-weight: normal !important;">Month</th>
                                                <th style="min-width:50px; font-weight: normal !important;">Year</th>
                                                <th style="min-width:150px; font-weight: normal !important;">Prev. Process</th>
                                                <th style="min-width:150px; font-weight: normal !important;">Curr. Process</th>
                                                <th style="min-width:150px; font-weight: normal !important;">Prev Seq. No</th>
                                                <th style="min-width:150px; font-weight: normal !important;">Curr. Seq. No</th>
                                                <th style="min-width:200px; font-weight: normal !important;">Prev Trans. No</th>
                                                <th style="min-width:200px; font-weight: normal !important;">Curr. Trans. No</th>
                                                <th style="min-width:150px; font-weight: normal !important;">Previous Amount</th>
                                                <th style="min-width:150px; font-weight: normal !important;">Current Amount</th> -->
                                                <th style=" font-weight: normal !important;">Month</th>
                                                <th style=" font-weight: normal !important;">Year</th>
                                                <th style="min-width:50px; font-weight: normal !important;">Prev. Process</th>
                                                <th style="min-width:50px; font-weight: normal !important;">Curr. Process</th>
                                                <th style="min-width:50px; font-weight: normal !important;">Prev Seq. No</th>
                                                <th style="min-width:50px; font-weight: normal !important;">Curr. Seq. No</th>
                                                <th style="min-width:50px; font-weight: normal !important;">Prev Trans. No</th>
                                                <th style="min-width:50px; font-weight: normal !important;">Curr. Trans. No</th>
                                                <th style="min-width:50px; font-weight: normal !important;">Previous Amount</th>
                                                <th style="min-width:50px; font-weight: normal !important;">Current Amount</th>
                                            </tr>
                                        </thead>
                                        <tbody v-for="(dataD,index) in dataModalDetail">
                                            <tr>
                                                <td style="text-align:center;"><span>{{dataD.BudgetMonth}}</span></td>
                                                <td style="text-align:center;"><span>{{dataD.BudgetYear}}</span></td>
                                                <td style="text-align:center;"><span>{{dataD.PreviousProcess}}</span></td>
                                                <td style="text-align:center;"><span>{{dataD.CurrentProcess}}</span></td>
                                                <td style="text-align:center;"><span>{{dataD.PreviousBudgetSequenceNo}}</span></td>
                                                <td style="text-align:center;"><span>{{dataD.BudgetSequenceNo}}</span></td>
                                                <td style="text-align:center;"><span>{{dataD.PreviousTransactionNo}}</span></td>
                                                <td style="text-align:center;"><span>{{dataD.CurrentTransactionNo}}</span></td>
                                                <td style="text-align:right;"><span>{{dataD.PreviousAmt}}</span></td>
                                                <td style="text-align:right;"><span>{{dataD.CurrentAmt}}</span></td>
                                            </tr>
                                        </tbody>                                        
                                    </table>
                                </b-container>
                            </b-col>                            
                        </b-row>
                      </div>
                    </div>
                  </div>
                </b-col>
              </b-row>
  </div>
</template>

<script>


export default {
    props: {dataModal:[]},
  data() {
    return {
        
        dataModalHeader: [],
        dataModalDetail: [],
        M_BG_ViewBudgetUsage: {
              Month: "",
              Year: "",
              BudgetCd:"",
              Descs:"",
              Userinput: "",
              UserEdit: this.getDataUser().user_id,
              TimeInput: "",
              TimeEdit: "",
              LastUpdateStamp: 0,
              RowId: 0
            },
        PI_budgetcd: { 
            cLabel:'Budget Code', 
            cValue:'', 
            cPageLevel: 1, 
            cTabIndex: 1, 
        }, 
        PI_budgetcddescs: { 
            cLabel:'Description ', 
            cValue:'', 
            cPageLevel: 1, 
            cTabIndex: 1, 
        }

    };
  },
  methods: {
    getDataModalH(record){
          var param = {
                OptionSeq:this.getOptionSeq().OptionSeq,
                UserId:this.getDataUser().user_id,
                PortfolioCd:this.getDataUser().portfolio_cd,              
                SubPortfolioCd:this.getDataUser().subportfolio_cd,
                LineNo:1,
                InitialWhere:"SubportfolioCd = '"+this.getDataUser().subportfolio_cd+"' and BudgetCd = '"+record.BudgetCd+"'",
                SortField:'',
                ParamView: ""
            }
            // alert(JSON.stringify(param))
              this.postEncode(this.getUrlDataList(), param).then(response => {
                  // response from API
                  if (response == null) return
                  this.dataModalHeader = response.Data
              })
        },
        getDataModalD(record){
          var param = {
               OptionSeq:this.getOptionSeq().OptionSeq,
                UserId:this.getDataUser().user_id,
                PortfolioCd:this.getDataUser().portfolio_cd,              
                SubPortfolioCd:this.getDataUser().subportfolio_cd,
                LineNo:2,
                InitialWhere:"SubportfolioCd = '"+this.getDataUser().subportfolio_cd+"' and BudgetCd = '"+record.BudgetCd+"'",
                SortField:'BudgetSequenceNo ASC',
                ParamView: ""
            }
            this.postEncode(this.getUrlDataList(), param).then(response => {
                // response from API
                if (response == null) return
                this.dataModalDetail = response.Data
            })
        },
  },
  beforeCreate: function () {
      
  },
  created: function() {
      this.M_BG_ViewBudgetUsage.BudgetCd = this.dataModal.BudgetCd
      this.M_BG_ViewBudgetUsage.Descs = this.dataModal.Descs
    //   console.log(JSON.stringify(this.dataModal,null,2))
      this.getDataModalH(this.dataModal)
    this.getDataModalD(this.dataModal)
  },
  beforeMount: function() {
  },
  mounted: function() {
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
    table {
    border-collapse: collapse;
    }

    table, td, th {
        border: 1px solid black;
        padding: 0px 5px 0px 5px;
    }
      .size-modal-content {
            padding: 10px;
            font-style: 13px;
        }
        .v--modal-overlay[data-modal="size-modal"] {
            background: rgba(0, 0, 0, 0.5);
        }
        .demo-modal-class {
            border-radius: 5px;
            background: #F7F7F7;
            box-shadow: 5px 5px 30px 0px rgba(46,61,73, 0.6);
        }
        .container{
            margin-left: 0px !important;
        }
</style>