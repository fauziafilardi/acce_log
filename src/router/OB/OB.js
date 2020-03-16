// import OB_AssignSubPortfolioOneBill_Master from  '@/views/OB/OB_AssignSubPortfolioOneBill/OB_AssignSubPortfolioOneBill_Master'
// import OB_SortSubPortfolioOneBill_Master from  '@/views/OB/OB_SortSubPortfolioOneBill/OB_SortSubPortfolioOneBill_Master'
// import OB_Specification_Master from  '@/views/OB/OB_Specification/OB_Specification_Master'
import CB_Bank_OneBill_Master from  '@/views/OB/CB_Bank_OneBill/CB_Bank_OneBill_Master'
import AR_Debtor_OneBill_Master from  '@/views/OB/AR_Debtor_OneBill/AR_Debtor_OneBill_Master'
// import OB_MarkContacttoOneBill_Master from  '@/views/OB/OB_MarkContacttoOneBill/OB_MarkContacttoOneBill_Master'
// import OB_GenerateScheduleBilling_OneBill_Master from  '@/views/OB/OB_GenerateScheduleBilling_OneBill/OB_GenerateScheduleBilling_OneBill_Master'
// import OB_GenerateScheduleBillingMaintenance_OneBill_Master from  '@/views/OB/OB_GenerateScheduleBillingMaintenance_OneBill/OB_GenerateScheduleBillingMaintenance_OneBill_Master'
// import OB_PostingScheduleBilling_OneBill_Master from  '@/views/OB/OB_PostingScheduleBilling_OneBill/OB_PostingScheduleBilling_OneBill_Master'
// import OB_GenerateVATTaxBatchMaster_OneBill_Master from  '@/views/OB/OB_GenerateVATTaxBatchMaster_OneBill/OB_GenerateVATTaxBatchMaster_OneBill_Master'
// import OB_PostingVATTaxBatchMaster_OneBill_Master from  '@/views/OB/OB_PostingVATTaxBatchMaster_OneBill/OB_PostingVATTaxBatchMaster_OneBill_Master'
// import CB_VirtualAccountUploadOneBill_Master from  '@/views/OB/CB_VirtualAccountUploadOneBill/CB_VirtualAccountUploadOneBill_Master'
// import OB_ManualRescheduler_Master from  '@/views/OB/OB_ManualRescheduler/OB_ManualRescheduler_Master'
// import OB_TaxBatchMonitoring_Master from  '@/views/OB/OB_TaxBatchMonitoring/OB_TaxBatchMonitoring_Master'
// import OB_CancelReportedTaxBatchMaster_OneBill_Master from  '@/views/OB/OB_CancelReportedTaxBatchMaster_OneBill/OB_CancelReportedTaxBatchMaster_OneBill_Master'
// import CB_Payment_OneBill_Master from  '@/views/OB/CB_Payment_OneBill/CB_Payment_OneBill_Master'
// import OB_InquirySchedulerResult_Master from  '@/views/OB/OB_InquirySchedulerResult/OB_InquirySchedulerResult_Master'
// import OB_CancelTaxBatchMaster_Master from  '@/views/OB/OB_CancelTaxBatchMaster/OB_CancelTaxBatchMaster_Master'
// import OB_VATExemptionReversalJournal_OneBill_Master from  '@/views/OB/OB_VATExemptionReversalJournal_OneBill/OB_VATExemptionReversalJournal_OneBill_Master'
// import OB_BankReceiptSummary_OneBill_Master from  '@/views/OB/OB_BankReceiptSummary_OneBill/OB_BankReceiptSummary_OneBill_Master'
// import OB_ExportVATOutToEFaktur_Master from  '@/views/OB//OB_ExportVATOutToEFaktur//OB_ExportVATOutToEFaktur_Master'
// import OB_AdvanceReceiptSummary_OneBill_Master from  '@/views/OB/OB_AdvanceReceiptSummary_OneBill/OB_AdvanceReceiptSummary_OneBill_Master'
// import OB_VATBatchAssignment_Master from  '@/views/OB/OB_VATBatchAssignment/OB_VATBatchAssignment_Master'
// import CB_PostingPayment_OneBill_Master from  '@/views/OB/CB_PostingPayment_OneBill/CB_PostingPayment_OneBill_Master'
// import AR_Allocation_Master from  '@/views/OB/AR_Allocation/AR_Allocation_Master'
// import AR_PostingAllocation_Master from  '@/views/OB/AR_PostingAllocation/AR_PostingAllocation_Master'
// import AR_UploadCustomerWithholdingOthers_Master from  '@/views/OB/AR_UploadCustomerWithholdingOthers/AR_UploadCustomerWithholdingOthers_Master'

export const OBRender = {
    path: '/OB',
    component: {
      render (c) { return c('router-view') }
    },
    children: [
        // {
        //     path: '/OB/OB_AssignSubPortfolioOneBill',
        //     name: 'OB_AssignSubPortfolioOneBill',
        //     component: OB_AssignSubPortfolioOneBill_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB/OB_SortSubPortfolioOneBill',
        //     name: 'OB_SortSubPortfolioOneBill',
        //     component: OB_SortSubPortfolioOneBill_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB/OB_Specification',
        //     name: 'OB_Specification',
        //     component: OB_Specification_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        {
            path: '/OB/CB_Bank_OneBill',
            name: 'CB_Bank_OneBill',
            component: CB_Bank_OneBill_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/OB/AR_Debtor_OneBill',
            name: 'AR_Debtor_OneBill',
            component: AR_Debtor_OneBill_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        // ,
        // {
        //     path: '/OB/OB_MarkContacttoOneBill',
        //     name: 'OB_MarkContacttoOneBill',
        //     component: OB_MarkContacttoOneBill_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB/OB_GenerateScheduleBilling_OneBill',
        //     name: 'OB_GenerateScheduleBilling_OneBill',
        //     component: OB_GenerateScheduleBilling_OneBill_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB/OB_GenerateScheduleBillingMaintenance_OneBill',
        //     name: 'OB_GenerateScheduleBillingMaintenance_OneBill',
        //     component: OB_GenerateScheduleBillingMaintenance_OneBill_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB/OB_PostingScheduleBilling_OneBill',
        //     name: 'OB_PostingScheduleBilling_OneBill',
        //     component: OB_PostingScheduleBilling_OneBill_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB/OB_GenerateVATTaxBatchMaster_OneBill',
        //     name: 'OB_GenerateVATTaxBatchMaster_OneBill',
        //     component: OB_GenerateVATTaxBatchMaster_OneBill_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB/OB_PostingVATTaxBatchMaster_OneBill',
        //     name: 'OB_PostingVATTaxBatchMaster_OneBill',
        //     component: OB_PostingVATTaxBatchMaster_OneBill_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB/CB_VirtualAccountUploadOneBill',
        //     name: 'CB_VirtualAccountUploadOneBill',
        //     component: CB_VirtualAccountUploadOneBill_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB/OB_ManualRescheduler',
        //     name: 'OB_ManualRescheduler',
        //     component: OB_ManualRescheduler_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB/OB_TaxBatchMonitoring',
        //     name: 'OB_TaxBatchMonitoring',
        //     component: OB_TaxBatchMonitoring_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB/OB_CancelReportedTaxBatchMaster_OneBill',
        //     name: 'OB_CancelReportedTaxBatchMaster_OneBill',
        //     component: OB_CancelReportedTaxBatchMaster_OneBill_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB/CB_Payment_OneBill',
        //     name: 'CB_Payment_OneBill',
        //     component: CB_Payment_OneBill_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB/OB_InquirySchedulerResult',
        //     name: 'OB_InquirySchedulerResult',
        //     component: OB_InquirySchedulerResult_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB/OB_CancelTaxBatchMaster',
        //     name: 'OB_CancelTaxBatchMaster',
        //     component: OB_CancelTaxBatchMaster_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB/OB_VATExemptionReversalJournal_OneBill',
        //     name: 'OB_VATExemptionReversalJournal_OneBill',
        //     component: OB_VATExemptionReversalJournal_OneBill_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB/OB_BankReceiptSummary_OneBill',
        //     name: 'OB_BankReceiptSummary_OneBill',
        //     component: OB_BankReceiptSummary_OneBill_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB//OB_ExportVATOutToEFaktur',
        //     name: '/OB_ExportVATOutToEFaktur',
        //     component: OB_ExportVATOutToEFaktur_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB/OB_AdvanceReceiptSummary_OneBill',
        //     name: 'OB_AdvanceReceiptSummary_OneBill',
        //     component: OB_AdvanceReceiptSummary_OneBill_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB/OB_VATBatchAssignment',
        //     name: 'OB_VATBatchAssignment',
        //     component: OB_VATBatchAssignment_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB/CB_PostingPayment_OneBill',
        //     name: 'CB_PostingPayment_OneBill',
        //     component: CB_PostingPayment_OneBill_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB/AR_Allocation',
        //     name: 'AR_Allocation',
        //     component: AR_Allocation_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB/AR_PostingAllocation',
        //     name: 'AR_PostingAllocation',
        //     component: AR_PostingAllocation_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/OB/AR_UploadCustomerWithholdingOthers',
        //     name: 'AR_UploadCustomerWithholdingOthers',
        //     component: AR_UploadCustomerWithholdingOthers_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
    ]
}