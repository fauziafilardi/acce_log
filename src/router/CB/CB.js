import CB_BatchMaster_Master from  '@/views/CB/CB_BatchMaster/CB_BatchMaster_Master'
import CB_Bank_Master from  '@/views/CB/CB_Bank/CB_Bank_Master'
import CB_SubPortofolioTransType_Master from  '@/views/CB/CB_SubPortofolioTransType/CB_SubPortofolioTransType_Master'
import CB_AssignTransactionTypeToSubPortfolio_Master from  '@/views/CB/CB_AssignTransactionTypeToSubPortfolio/CB_AssignTransactionTypeToSubPortfolio_Master'
import CB_TransactionTypeMaster_Master from  '@/views/CB/CB_TransactionTypeMaster/CB_TransactionTypeMaster_Master'
import CB_Specification_Master from  '@/views/CB/CB_Specification/CB_Specification_Master'
// import CB_DebtorInquiry_Master from  '@/views/CB/CB_DebtorInquiry/CB_DebtorInquiry_Master'
import CB_DebtorInquiry from  '@/views/CB/CB_DebtorInquiry/CB_DebtorInquiry'
import CB_DebtorInquiryDetail from  '@/views/CB/CB_DebtorInquiry/CB_DebtorInquiryDetail'
import CB_ChangeDebtorAfterPosting_Master from  '@/views/CB/CB_ChangeDebtorAfterPosting/CB_ChangeDebtorAfterPosting_Master'
// import CB_PostingPayment_Master from  '@/views/CB/CB_PostingPayment/CB_PostingPayment_Master'
import CB_PostingCashPurchase from  '@/views/CB/CB_PostingCashPurchase/CB_PostingCashPurchase'
import CB_CashPurchase_Master from  '@/views/CB/CB_CashPurchase/CB_CashPurchase_Master'
import CB_CashPurchaseNonBudget_Master from '@/views/CB/CB_CashPurchaseNonBudget/CB_CashPurchaseNonBudget_Master'
import CB_PostingCashPurchaseNonMandatoryBudget from '@/views/CB/CB_PostingCashPurchaseNonMandatoryBudget/CB_PostingCashPurchaseNonMandatoryBudget'
// import CB_PostingBankTransfer_Master from  '@/views/CB/CB_PostingBankTransfer/CB_PostingBankTransfer_Master'
import CB_BankTransfer_Master from  '@/views/CB/CB_BankTransfer/CB_BankTransfer_Master'
import CB_GIBankReconcile_Master from  '@/views/CB/CB_GIBankReconcile/CB_GIBankReconcile_Master'
import CB_CashAllocation_Master from  '@/views/CB/CB_CashAllocation/CB_CashAllocation_Master'
// import CB_PostingBankStatCtrl_Master from  '@/views/CB/CB_PostingBankStatCtrl/CB_PostingBankStatCtrl_Master'
import CB_BankStatControl_Master from  '@/views/CB/CB_BankStatControl/CB_BankStatControl_Master'
import CB_ChequeControl_Master from  '@/views/CB/CB_ChequeControl/CB_ChequeControl_Master'
import CB_PostingRevaluation_Master from  '@/views/CB/CB_PostingRevaluation/CB_PostingRevaluation_Master'
// import CB_PostBankReceipt_Master from  '@/views/CB/CB_PostBankReceipt/CB_PostBankReceipt_Master'
import CB_BankReceipt_Master from  '@/views/CB/CB_BankReceipt/CB_BankReceipt_Master'
import CB_Payment_Master from  '@/views/CB/CB_Payment/CB_Payment_Master'
import CB_Revaluation_Master from  '@/views/CB/CB_Revaluation/PageLevel_1/CB_Revaluation'
import CB_SplitPayment_Master from  '@/views/CB/CB_SplitPayment/CB_SplitPayment_Master'
import CB_RevaluationMaint_Master from  '@/views/CB/CB_RevaluationMaint/CB_RevaluationMaint_Master'
import CB_VirtualAccountUpload_Master from  '@/views/CB/CB_VirtualAccountUpload/PageLevel_1/CB_VirtualAccountUpload'
import CB_AdvanceReceiverPersonnel_Master from  '@/views/CB/CB_AdvanceReceiverPersonnel/CB_AdvanceReceiverPersonnel_Master'
import CB_AdvancePaymentMaintenance_Master from  '@/views/CB/CB_AdvancePaymentMaintenance/CB_AdvancePaymentMaintenance_Master'
import CB_AdvanceReceived_Master from  '@/views/CB/CB_AdvanceReceived/CB_AdvanceReceived_Master'
import CB_GenerateAdvancePayment from  '@/views/CB/CB_GenerateAdvancePayment/CB_GenerateAdvancePayment'
import CB_GeneratePaymentAdvice from  '@/views/CB/CB_GeneratePaymentAdvice/CB_GeneratePaymentAdvice'
import CB_PaymentAdviceMaintenance_Master from  '@/views/CB/CB_PaymentAdviceMaintenance/CB_PaymentAdviceMaintenance_Master'
import CB_PaymentAdviceSettlement from  '@/views/CB/CB_PaymentAdviceSettlement/CB_PaymentAdviceSettlement'
import CB_PaymentVoucher_Master from  '@/views/CB/CB_PaymentVoucher/CB_PaymentVoucher_Master'
import CB_PostAdvancePayment from  '@/views/CB/CB_PostAdvancePayment/CB_PostAdvancePayment'
import CB_PostAdvanceReceived from  '@/views/CB/CB_PostAdvanceReceived/CB_PostAdvanceReceived'
import CB_PostPaymentVoucher from  '@/views/CB/CB_PostPaymentVoucher/CB_PostPaymentVoucher'
import CB_RevaluationMaintPerSubportfolio_Master from  '@/views/CB/CB_RevaluationMaintPerSubportfolio/CB_RevaluationMaintPerSubportfolio_Master'
// import CB_PaymentAllSub_Master from  '@/views/CB/CB_PaymentAllSub/CB_PaymentAllSub_Master'
// import CB_PostingPaymentAllSub_Master from  '@/views/CB/CB_PostingPaymentAllSub/CB_PostingPaymentAllSub_Master'
import CB_BankGroup_Master from  '@/views/CB/CB_BankGroup/CB_BankGroup_Master'
import CB_ChequeStatusUpdate_Master from  '@/views/CB/CB_ChequeStatusUpdate/CB_ChequeStatusUpdate_Master'
// import CB_PostingRevaluationBank_Master from  '@/views/CB/CB_PostingRevaluationBank/CB_PostingRevaluationBank_Master'


export const CBRender = {
    path: '/CB',
    component: {
      render (c) { return c('router-view') }
    },
    children: [
        {
            path: '/CB/CB_BatchMaster',
            name: 'CB_BatchMaster',
            component: CB_BatchMaster_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_Bank',
            name: 'CB_Bank',
            component: CB_Bank_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_SubPortofolioTransType',
            name: 'CB_SubPortofolioTransType',
            component: CB_SubPortofolioTransType_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_AssignTransactionTypeToSubPortfolio',
            name: 'CB_AssignTransactionTypeToSubPortfolio',
            component: CB_AssignTransactionTypeToSubPortfolio_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_TransactionTypeMaster',
            name: 'CB_TransactionTypeMaster',
            component: CB_TransactionTypeMaster_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_Specification',
            name: 'CB_Specification',
            component: CB_Specification_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_DebtorInquiry',
            name: 'CB_DebtorInquiry',
            component: CB_DebtorInquiry,
            meta: {
                requiresAuth: true
            }
        }
        ,
        {
            path: '/CB/CB_DebtorInquiryDetail',
            name: 'CB_DebtorInquiryDetail',
            component: CB_DebtorInquiryDetail,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_ChangeDebtorAfterPosting',
            name: 'CB_ChangeDebtorAfterPosting',
            component: CB_ChangeDebtorAfterPosting_Master,
            meta: {
                requiresAuth: true
            }
        }
        
//         ,
//         {
//             path: '/CB/CB_PostingPayment',
//             name: 'CB_PostingPayment',
//             component: CB_PostingPayment_Master,
//             meta: {
//                 requiresAuth: true
//             }
//         }
        
        ,
        {
            path: '/CB/CB_PostingCashPurchase',
            name: 'CB_PostingCashPurchase',
            component: CB_PostingCashPurchase,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_CashPurchase',
            name: 'CB_CashPurchase',
            component: CB_CashPurchase_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_CashPurchaseNonBudget',
            name: 'CB_CashPurchaseNonBudget',
            component: CB_CashPurchaseNonBudget_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_PostingCashPurchaseNonMandatoryBudget',
            name: 'CB_PostingCashPurchaseNonMandatoryBudget',
            component: CB_PostingCashPurchaseNonMandatoryBudget,
            meta: {
                requiresAuth: true
            }
        }
        
        
//         ,
//         {
//             path: '/CB/CB_PostingBankTransfer',
//             name: 'CB_PostingBankTransfer',
//             component: CB_PostingBankTransfer_Master,
//             meta: {
//                 requiresAuth: true
//             }
//         }
        
        ,
        {
            path: '/CB/CB_BankTransfer',
            name: 'CB_BankTransfer',
            component: CB_BankTransfer_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_GIBankReconcile',
            name: 'CB_GIBankReconcile',
            component: CB_GIBankReconcile_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_CashAllocation',
            name: 'CB_CashAllocation',
            component: CB_CashAllocation_Master,
            meta: {
                requiresAuth: true
            }
        }
        
//         ,
//         {
//             path: '/CB/CB_PostingBankStatCtrl',
//             name: 'CB_PostingBankStatCtrl',
//             component: CB_PostingBankStatCtrl_Master,
//             meta: {
//                 requiresAuth: true
//             }
//         }
        
        ,
        {
            path: '/CB/CB_BankStatControl',
            name: 'CB_BankStatControl',
            component: CB_BankStatControl_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_ChequeControl',
            name: 'CB_ChequeControl',
            component: CB_ChequeControl_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_PostingRevaluation',
            name: 'CB_PostingRevaluation',
            component: CB_PostingRevaluation_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        // ,
        // {
        //     path: '/CB/CB_PostBankReceipt',
        //     name: 'CB_PostBankReceipt',
        //     component: CB_PostBankReceipt_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        ,
        {
            path: '/CB/CB_BankReceipt',
            name: 'CB_BankReceipt',
            component: CB_BankReceipt_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_Payment',
            name: 'CB_Payment',
            component: CB_Payment_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_Revaluation',
            name: 'CB_Revaluation',
            component: CB_Revaluation_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_SplitPayment',
            name: 'CB_SplitPayment',
            component: CB_SplitPayment_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_RevaluationMaint',
            name: 'CB_RevaluationMaint',
            component: CB_RevaluationMaint_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_VirtualAccountUpload',
            name: 'CB_VirtualAccountUpload',
            component: CB_VirtualAccountUpload_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_AdvanceReceiverPersonnel',
            name: 'CB_AdvanceReceiverPersonnel',
            component: CB_AdvanceReceiverPersonnel_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_AdvancePaymentMaintenance',
            name: 'CB_AdvancePaymentMaintenance',
            component: CB_AdvancePaymentMaintenance_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_AdvanceReceived',
            name: 'CB_AdvanceReceived',
            component: CB_AdvanceReceived_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_GenerateAdvancePayment',
            name: 'CB_GenerateAdvancePayment',
            component: CB_GenerateAdvancePayment,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_GeneratePaymentAdvice',
            name: 'CB_GeneratePaymentAdvice',
            component: CB_GeneratePaymentAdvice,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_PaymentAdviceMaintenance',
            name: 'CB_PaymentAdviceMaintenance',
            component: CB_PaymentAdviceMaintenance_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_PaymentAdviceSettlement',
            name: 'CB_PaymentAdviceSettlement',
            component: CB_PaymentAdviceSettlement,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_PaymentVoucher',
            name: 'CB_PaymentVoucher',
            component: CB_PaymentVoucher_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_PostAdvancePayment',
            name: 'CB_PostAdvancePayment',
            component: CB_PostAdvancePayment,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_PostAdvanceReceived',
            name: 'CB_PostAdvanceReceived',
            component: CB_PostAdvanceReceived,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_PostPaymentVoucher',
            name: 'CB_PostPaymentVoucher',
            component: CB_PostPaymentVoucher,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_RevaluationMaintPerSubportfolio',
            name: 'CB_RevaluationMaintPerSubportfolio',
            component: CB_RevaluationMaintPerSubportfolio_Master,
            meta: {
                requiresAuth: true
            }
        }
        
//         ,
//         {
//             path: '/CB/CB_PaymentAllSub',
//             name: 'CB_PaymentAllSub',
//             component: CB_PaymentAllSub_Master,
//             meta: {
//                 requiresAuth: true
//             }
//         }
        
//         ,
//         {
//             path: '/CB/CB_PostingPaymentAllSub',
//             name: 'CB_PostingPaymentAllSub',
//             component: CB_PostingPaymentAllSub_Master,
//             meta: {
//                 requiresAuth: true
//             }
//         }
        
        ,
        {
            path: '/CB/CB_BankGroup',
            name: 'CB_BankGroup',
            component: CB_BankGroup_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CB/CB_ChequeStatusUpdate',
            name: 'CB_ChequeStatusUpdate',
            component: CB_ChequeStatusUpdate_Master,
            meta: {
                requiresAuth: true
            }
        }
        
//         ,
//         {
//             path: '/CB/CB_PostingRevaluationBank',
//             name: 'CB_PostingRevaluationBank',
//             component: CB_PostingRevaluationBank_Master,
//             meta: {
//                 requiresAuth: true
//             }
//         }
    ]
}