import AR_BatchMaster_Master from '@/views/AR/AR_BatchMaster/AR_BatchMaster_Master'
import AR_Debtor_Master from '@/views/AR/AR_Debtor/AR_Debtor_Master'
import AR_DebtorAnalysis_Master from '@/views/AR/AR_DebtorAnalysis/AR_DebtorAnalysis_Master'
import AR_TransactionTypeSubPortfolioMaintenance_Master from '@/views/AR/AR_TransactionTypeSubPortfolioMaintenance/AR_TransactionTypeSubPortfolioMaintenance_Master'
import AR_AssignTransactionTypeToSubPortfolio_Master from '@/views/AR/AR_AssignTransactionTypeToSubPortfolio/AR_AssignTransactionTypeToSubPortfolio_Master'
import AR_TransactionTypeMaster_Master from '@/views/AR/AR_TransactionTypeMaster/AR_TransactionTypeMaster_Master'
import AR_Specification_Master from '@/views/AR/AR_Specification/AR_Specification_Master'
import AR_PostingScheduleBillingByDebtor from '@/views/AR/AR_PostingScheduleBillingByDebtor/AR_PostingScheduleBillingByDebtor'
import AR_PostingScheduleBilling from '@/views/AR/AR_PostingScheduleBilling/AR_PostingScheduleBilling'
import AR_MassBillingMaintenance_Master from '@/views/AR/AR_MassBillingMaintenance/AR_MassBillingMaintenance_Master'
// import AR_PostingInvoice_Master from '@/views/AR/AR_PostingInvoice/AR_PostingInvoice_Master'
import AR_Invoice_Master from '@/views/AR/AR_Invoice/AR_Invoice_Master'
import AR_PostingWithholdingTaxInv from '@/views/AR/AR_PostingWithholdingTaxInv/AR_PostingWithholdingTaxInv'
import AR_PostingVATInvoice from '@/views/AR/AR_PostingVATInvoice/AR_PostingVATInvoice'
import AR_CancelTaxInv_Master from '@/views/AR/AR_CancelTaxInv/AR_CancelTaxInv_Master'
import AR_CancelReportedTaxInv_Master from '@/views/AR/AR_CancelReportedTaxInv/AR_CancelReportedTaxInv_Master'
import AR_CustomerVATMaintenance_Master from '@/views/AR/AR_CustomerVATMaintenance/AR_CustomerVATMaintenance_Master'
import AR_CustVATInvMonitoring_Master from '@/views/AR/AR_CustVATInvMonitoring/AR_CustVATInvMonitoring_Master'
import AR_WInvAssignment_Master from '@/views/AR/AR_WInvAssignment/AR_WInvAssignment_Master'
import AR_VATInvAssignment_Master from '@/views/AR/AR_VATInvAssignment/AR_VATInvAssignment_Master'
// import AR_PostingOR_Master from '@/views/AR/AR_PostingOR/AR_PostingOR_Master'
import AR_OfficialReceiptDirectFromCashier_Master from '@/views/AR/AR_OfficialReceiptDirectFromCashier/AR_OfficialReceiptDirectFromCashier_Master'
// import AR_PostingDepositReceipt_Master from '@/views/AR/AR_PostingDepositReceipt/AR_PostingDepositReceipt_Master'
// import AR_PostingInvoiceDeposit_Master from '@/views/AR/AR_PostingInvoiceDeposit/AR_PostingInvoiceDeposit_Master'
import AR_InvoiceDepositCancellation_Master from '@/views/AR/AR_InvoiceDepositCancellation/AR_InvoiceDepositCancellation_Master'
import AR_DepositReceiptDirectFromCashier_Master from '@/views/AR/AR_DepositReceiptDirectFromCashier/AR_DepositReceiptDirectFromCashier_Master'
// import AR_InvoiceDeposit_Master from '@/views/AR/AR_InvoiceDeposit/AR_InvoiceDeposit_Master'
// import AR_PostingAdvance_Master from '@/views/AR/AR_PostingAdvance/AR_PostingAdvance_Master'
import AR_AdvReceiptDirectFromCashier_Master from '@/views/AR/AR_AdvReceiptDirectFromCashier/AR_AdvReceiptDirectFromCashier_Master'
// import AR_PostingRefund_Master from '@/views/AR/AR_PostingRefund/AR_PostingRefund_Master'
import AR_Refund_Master from '@/views/AR/AR_Refund/AR_Refund_Master'
// import AR_PostingDN_Master from '@/views/AR/AR_PostingDN/AR_PostingDN_Master'
import AR_DebitNote_Master from '@/views/AR/AR_DebitNote/AR_DebitNote_Master'
// import AR_PostingCN_Master from '@/views/AR/AR_PostingCN/AR_PostingCN_Master'
import AR_CNChargeToAccount_Master from '@/views/AR/AR_CNChargeToAccount/AR_CNChargeToAccount_Master'
import AR_CNChargeToInv_Master from '@/views/AR/AR_CNChargeToInv/AR_CNChargeToInv_Master'
// import AR_PostingAllocation_Master from '@/views/AR/AR_PostingAllocation/AR_PostingAllocation_Master'
import AR_Allocation_Master from '@/views/AR/AR_Allocation/AR_Allocation_Master'
import AR_PostingAmortization from '@/views/AR/AR_PostingAmortization/AR_PostingAmortization'
import AR_GenAmortizeMaint_Master from '@/views/AR/AR_GenAmortizeMaint/AR_GenAmortizeMaint_Master'
import AR_GenerateAmortization_Master from '@/views/AR/AR_GenerateAmortization/PageLevel_1/AR_GenerateAmortization'
import AR_AmortizeMaint_Master from '@/views/AR/AR_AmortizeMaint/AR_AmortizeMaint_Master'
// import AR_PostingAmortizationSchedule_Master from '@/views/AR/AR_PostingAmortizationSchedule/AR_PostingAmortizationSchedule_Master'
import AR_PostingPenalty from '@/views/AR/AR_PostingPenalty/AR_PostingPenalty'
import AR_PenaltyMaint_Master from '@/views/AR/AR_PenaltyMaint/AR_PenaltyMaint_Master'
import AR_GeneratePenalty from '@/views/AR/AR_GeneratePenalty/AR_GeneratePenalty'
import AR_ReminderMaint_Master from '@/views/AR/AR_ReminderMaint/AR_ReminderMaint_Master'
import AR_GenerateReminder from '@/views/AR/AR_GenerateReminder/AR_GenerateReminder'
import AR_PostingRevaluation from '@/views/AR/AR_PostingRevaluation/PageLevel_1/AR_PostingRevaluation'
import AR_RevaluationInquiry_Master from '@/views/AR/AR_RevaluationInquiry/PageLevel_1/AR_RevaluationInquiry'
import AR_GenerateRevaluation_Master from '@/views/AR/AR_GenerateRevaluation/AR_GenerateRevaluation_Master'
import AR_SingleBillingMaintenanceByDebtor_Master from '@/views/AR/AR_SingleBillingMaintenanceByDebtor/AR_SingleBillingMaintenanceByDebtor_Master'
import AR_SingleBillingMaintenance_Master from '@/views/AR/AR_SingleBillingMaintenance/AR_SingleBillingMaintenance_Master'
import AR_CancelIndirectInvoice_Master from '@/views/AR/AR_CancelIndirectInvoice/AR_CancelIndirectInvoice_Master'
import AR_UnidentifiedTransactionMaintenance_Master from '@/views/AR/AR_UnidentifiedTransactionMaintenance/AR_UnidentifiedTransactionMaintenance_Master'
import AR_GenerateWTaxInv from '@/views/AR/AR_GenerateWTaxInv/AR_GenerateWTaxInv'
import AR_AmortizeSchedule_Master from '@/views/AR/AR_AmortizeSchedule/AR_AmortizeSchedule_Master'
import AR_MassGenerateBilling_Master from '@/views/AR/AR_MassGenerateBilling/AR_MassGenerateBilling_Master'
// import AR_MassGenerateBilling from '@/views/AR/AR_MassGenerateBilling/AR_MassGenerateBilling'
import AR_GenerateScheduleBillingByDebtor from '@/views/AR/AR_GenerateScheduleBillingByDebtor/AR_GenerateScheduleBillingByDebtor'
// import AR_GenerateScheduleBilling_Master from '@/views/AR/AR_GenerateScheduleBilling/AR_GenerateScheduleBilling_Master'
import AR_GenerateScheduleBilling from '@/views/AR/AR_GenerateScheduleBilling/AR_GenerateScheduleBilling'
import AR_BillingSchedMaintByDebtor_Master from '@/views/AR/AR_BillingSchedMaintByDebtor/AR_BillingSchedMaintByDebtor_Master'
import AR_BillingSchedMaint_Master from '@/views/AR/AR_BillingSchedMaint/AR_BillingSchedMaint_Master'
import AR_GenerateVATInv from '@/views/AR/AR_GenerateVATInv/AR_GenerateVATInv'
import AR_TaxInvoiceMasterMaintenance_Master from '@/views/AR/AR_TaxInvoiceMasterMaintenance/AR_TaxInvoiceMasterMaintenance_Master'
import AR_GenerateTaxInvNo_Master from '@/views/AR/AR_GenerateTaxInvNo/AR_GenerateTaxInvNo_Master'
import AR_ChangeTaxPaidBy_Master from '@/views/AR/AR_ChangeTaxPaidBy/AR_ChangeTaxPaidBy_Master'
import AR_SplitUnidentifiedAdvance_Master from '@/views/AR/AR_SplitUnidentifiedAdvance/AR_SplitUnidentifiedAdvance_Master'
import AR_TaxInvReplacement from '@/views/AR/AR_TaxInvReplacement/PageLevel_1/AR_TaxInvReplacement'
import AR_PostingWithholdingOthersTaxInv from '@/views/AR/AR_PostingWithholdingOthersTaxInv/AR_PostingWithholdingOthersTaxInv'
import AR_CustomerWithholdingOthersMaintenance_Master from '@/views/AR/AR_CustomerWithholdingOthersMaintenance/AR_CustomerWithholdingOthersMaintenance_Master'
import AR_CustWOthersInvMonitoring_Master from '@/views/AR/AR_CustWOthersInvMonitoring/AR_CustWOthersInvMonitoring_Master'
// import AR_PostingDepositCancellation_Master from '@/views/AR/AR_PostingDepositCancellation/AR_PostingDepositCancellation_Master'
import AR_GenerateScheduleBillingByTrxTypeGroup from '@/views/AR/AR_GenerateScheduleBillingByTrxTypeGroup/AR_GenerateScheduleBillingByTrxTypeGroup'
import AR_UnpostVATInvoice from '@/views/AR/AR_UnpostVATInvoice/AR_UnpostVATInvoice'
import AR_MassCustomerWithholdingOthersMonitoring from '@/views/AR/AR_MassCustomerWithholdingOthersMonitoring/AR_MassCustomerWithholdingOthersMonitoring'
import AR_CNAllocation_Master from '@/views/AR/AR_CNAllocation/AR_CNAllocation_Master'
// import AR_PostingCNAllocation_Master from '@/views/AR/AR_PostingCNAllocation/AR_PostingCNAllocation_Master'
import AR_UpdateTenantDebtor_Master from '@/views/AR/AR_UpdateTenantDebtor/AR_UpdateTenantDebtor_Master'
// import AR_VATNoMaintenance2013_Master from '@/views/AR/AR_VATNoMaintenance2013/AR_VATNoMaintenance2013_Master'
// import AR_GenerateVATNo2013_Master from '@/views/AR/AR_GenerateVATNo2013/AR_GenerateVATNo2013_Master'
// import AR_AssignVATNoToDoc2013_Master from '@/views/AR/AR_AssignVATNoToDoc2013/AR_AssignVATNoToDoc2013_Master'
// import AR_TaxSettlementConfirmationVAT_Master from '@/views/AR/AR_TaxSettlementConfirmationVAT/AR_TaxSettlementConfirmationVAT_Master'
import AR_TaxSettlementVAT_Master from '@/views/AR/AR_TaxSettlementVAT/AR_TaxSettlementVAT_Master'
import AR_TaxSettlementCancellationVAT_Master from '@/views/AR/AR_TaxSettlementCancellationVAT/AR_TaxSettlementCancellationVAT_Master'
// import AR_TaxSettlementCancellationConfirmationVAT_Master from '@/views/AR/AR_TaxSettlementCancellationConfirmationVAT/AR_TaxSettlementCancellationConfirmationVAT_Master'
// import AR_TaxSettlementCancellationConfirmationWH_Master from '@/views/AR/AR_TaxSettlementCancellationConfirmationWH/AR_TaxSettlementCancellationConfirmationWH_Master'
import AR_TaxSettlementWH_Master from '@/views/AR/AR_TaxSettlementWH/AR_TaxSettlementWH_Master'
// import AR_TaxSettlementConfirmationWH_Master from '@/views/AR/AR_TaxSettlementConfirmationWH/AR_TaxSettlementConfirmationWH_Master'
import AR_TaxSettlementCancellationWH_Master from '@/views/AR/AR_TaxSettlementCancellationWH/AR_TaxSettlementCancellationWH_Master'
import AR_TaxBatchMasterEntry_Master from '@/views/AR/AR_TaxBatchMasterEntry/AR_TaxBatchMasterEntry_Master'
import AR_TaxBatchMasterMaintenance_Master from '@/views/AR/AR_TaxBatchMasterMaintenance/AR_TaxBatchMasterMaintenance'
import AR_TaxBatchMasterPosting_Master from '@/views/AR/AR_TaxBatchMasterPosting/AR_TaxBatchMasterPosting'
import AR_TaxBatchMonitoring_Master from '@/views/AR/AR_TaxBatchMonitoring/AR_TaxBatchMonitoring'
import AR_GenerateVATTaxBatchMaster_Master from '@/views/AR/AR_GenerateVATTaxBatchMaster/AR_GenerateVATTaxBatchMaster'
import AR_VATBatchAssignment_Master from '@/views/AR/AR_VATBatchAssignment/AR_VATBatchAssignment_Master'
import AR_PostingVATBatchMaster_Master from '@/views/AR/AR_PostingVATBatchMaster/AR_PostingVATBatchMaster'
import AR_GenerateAmortizeRevenue from '@/views/AR/AR_GenerateAmortizeRevenue/AR_GenerateAmortizeRevenue'
import AR_AmortizeRevenueMaintenance_Master from '@/views/AR/AR_AmortizeRevenueMaintenance/AR_AmortizeRevenueMaintenance_Master'
import AR_AmortizeRevenueConfirmation_Master from '@/views/AR/AR_AmortizeRevenueConfirmation/AR_AmortizeRevenueConfirmation'
import AR_AmortizeRevenueDebitAllocation_Master from '@/views/AR/AR_AmortizeRevenueDebitAllocation/AR_AmortizeRevenueDebitAllocation_Master'
import AR_AmortizeRevenueCreditAllocation_Master from '@/views/AR/AR_AmortizeRevenueCreditAllocation/AR_AmortizeRevenueCreditAllocation_Master'
// import AR_AmortizeRevenueDebitAllocationConfirmation_Master from '@/views/AR/AR_AmortizeRevenueDebitAllocationConfirmation/AR_AmortizeRevenueDebitAllocationConfirmation_Master'
// import AR_AmortizeRevenueCreditAllocationConfirmation_Master from '@/views/AR/AR_AmortizeRevenueCreditAllocationConfirmation/AR_AmortizeRevenueCreditAllocationConfirmation_Master'
import AR_CancelReportedTaxBatchMaster_Master from '@/views/AR/AR_CancelReportedTaxBatchMaster/AR_CancelReportedTaxBatchMaster_Master'
import AR_CancelTaxBatchMaster_Master from '@/views/AR/AR_CancelTaxBatchMaster/AR_CancelTaxBatchMaster_Master'
import AR_PostingScheduleBillingNew from '@/views/AR/AR_PostingScheduleBillingNew/AR_PostingScheduleBillingNew'
import AR_DebtorBalance_Master from '@/views/AR/AR_DebtorBalance/AR_DebtorBalance_Master'
import AR_GenerateScheduleBillingStrata from '@/views/AR/AR_GenerateScheduleBillingStrata/PageLevel_1/AR_GenerateScheduleBillingStrata'
import AR_UpdateTenantDebtorByLot_Master from '@/views/AR/AR_UpdateTenantDebtorByLot/AR_UpdateTenantDebtorByLot_Master'
import AR_PostingScheduleBillingFromStrata from '@/views/AR/AR_PostingScheduleBillingFromStrata/AR_PostingScheduleBillingFromStrata'
import AR_BillingSchedMaintFromStrata_Master from '@/views/AR/AR_BillingSchedMaintFromStrata/AR_BillingSchedMaintFromStrata_Master'
import AR_GenerateScheduleBilling_Subportfolio_Master from '@/views/AR/AR_GenerateScheduleBilling_Subportfolio/AR_GenerateScheduleBilling_Subportfolio_Master'
import AR_WriteOffVAT_Master from '@/views/AR/AR_WriteOffVAT/AR_WriteOffVAT'
import AR_SingleBillingMaintenanceFromStrata_Master from '@/views/AR/AR_SingleBillingMaintenanceFromStrata/AR_SingleBillingMaintenanceFromStrata_Master'
import AR_ExportVATOutToEFaktur_Master from '@/views/AR/AR_ExportVATOutToEFaktur/AR_ExportVATOutToEFaktur'
import AR_PostingScheduleBillingByDebtorNew from '@/views/AR/AR_PostingScheduleBillingByDebtorNew/AR_PostingScheduleBillingByDebtorNew'
import AR_PostingScheduleBillingFromStrataNew from '@/views/AR/AR_PostingScheduleBillingFromStrataNew/AR_PostingScheduleBillingFromStrataNew'
import AR_Contract_Inquiry_Master from '@/views/AR/AR_Contract_Inquiry/AR_Contract_Inquiry_Master'
import AR_ImportVATOutEFakturResult from '@/views/AR/AR_ImportVATOutEFakturResult/AR_ImportVATOutEFakturResult'
import AR_ChangeVATPaidBy_Master from '@/views/AR/AR_ChangeVATPaidBy/AR_ChangeVATPaidBy_Master'
import AR_ChangeWithholdingPaidBy_Master from '@/views/AR/AR_ChangeWithholdingPaidBy/AR_ChangeWithholdingPaidBy_Master'
import AR_PostingScheduleBillingCollection from '@/views/AR/AR_PostingScheduleBillingCollection/AR_PostingScheduleBillingCollection'
// import AR_BillingSchedMaint_All_Master from '@/views/AR/AR_BillingSchedMaint_All/AR_BillingSchedMaint_All_Master'
// import AR_BillingSchedMaintByDebtor_All_Master from '@/views/AR/AR_BillingSchedMaintByDebtor_All/AR_BillingSchedMaintByDebtor_All_Master'
// import AR_MassBillingMaintenance_All_Master from '@/views/AR/AR_MassBillingMaintenance_All/AR_MassBillingMaintenance_All_Master'
// import AR_GenerateScheduleBilling_All_Master from '@/views/AR/AR_GenerateScheduleBilling_All/AR_GenerateScheduleBilling_All_Master'
// import AR_GenerateScheduleBillingByTrxTypeGroup_All_Master from '@/views/AR/AR_GenerateScheduleBillingByTrxTypeGroup_All/AR_GenerateScheduleBillingByTrxTypeGroup_All_Master'
// import AR_GenerateScheduleBillingByDebtor_All_Master from '@/views/AR/AR_GenerateScheduleBillingByDebtor_All/AR_GenerateScheduleBillingByDebtor_All_Master'
// import AR_MassGenerateBilling_All_Master from '@/views/AR/AR_MassGenerateBilling_All/AR_MassGenerateBilling_All_Master'
// import AR_PostingScheduleBillingByDebtor_All_Master from '@/views/AR/AR_PostingScheduleBillingByDebtor_All/AR_PostingScheduleBillingByDebtor_All_Master'
// import AR_SingleBillingMaintenance_All_Master from '@/views/AR/AR_SingleBillingMaintenance_All/AR_SingleBillingMaintenance_All_Master'
// import AR_SingleBillingMaintenanceByDebtor_All_Master from '@/views/AR/AR_SingleBillingMaintenanceByDebtor_All/AR_SingleBillingMaintenanceByDebtor_All_Master'
// import AR_PostingScheduleBilling_All_Master from '@/views/AR/AR_PostingScheduleBilling_All/AR_PostingScheduleBilling_All_Master'
// import AR_UpdateTenantDebtor_All_Master from '@/views/AR/AR_UpdateTenantDebtor_All/AR_UpdateTenantDebtor_All_Master'
// import AR_BillingSchedMaintFromStrata_All_Master from '@/views/AR/AR_BillingSchedMaintFromStrata_All/AR_BillingSchedMaintFromStrata_All_Master'
// import AR_GenerateScheduleBillingStrata_All_Master from '@/views/AR/AR_GenerateScheduleBillingStrata_All/AR_GenerateScheduleBillingStrata_All_Master'
// import AR_SingleBillingMaintenanceFromStrata_All_Master from '@/views/AR/AR_SingleBillingMaintenanceFromStrata_All/AR_SingleBillingMaintenanceFromStrata_All_Master'
// import AR_PostingScheduleBillingFromStrata_All_Master from '@/views/AR/AR_PostingScheduleBillingFromStrata_All/AR_PostingScheduleBillingFromStrata_All_Master'
// import AR_UpdateTenantDebtorByLot_All_Master from '@/views/AR/AR_UpdateTenantDebtorByLot_All/AR_UpdateTenantDebtorByLot_All_Master'
import AR_AutoGenerateBillingSchedule_Master from '@/views/AR/AR_AutoGenerateBillingSchedule/AR_AutoGenerateBillingSchedule_Master'
import AR_AutoGenerateBillingScheduleDetail_Master from  '@/views/AR/AR_AutoGenerateBillingSchedule/PageLevel_1/AR_AutoGenerateBillingScheduleDetail'
// import AR_AutoGenerateBillingScheduleAll_Master from '@/views/AR/AR_AutoGenerateBillingScheduleAll/AR_AutoGenerateBillingScheduleAll_Master'
import AR_AutoGenerateBillingScheduleByDebtor_Master from '@/views/AR/AR_AutoGenerateBillingScheduleByDebtor/AR_AutoGenerateBillingScheduleByDebtor_Master'
// import AR_AutoGenerateBillingScheduleByDebtorAll_Master from '@/views/AR/AR_AutoGenerateBillingScheduleByDebtorAll/AR_AutoGenerateBillingScheduleByDebtorAll_Master'
import AR_AutoGenerateBillingScheduleFromStrata_Master from '@/views/AR/AR_AutoGenerateBillingScheduleFromStrata/AR_AutoGenerateBillingScheduleFromStrata_Master'
// import AR_AutoGenerateBillingScheduleFromStrataAll_Master from '@/views/AR/AR_AutoGenerateBillingScheduleFromStrataAll/AR_AutoGenerateBillingScheduleFromStrataAll_Master'
// import AR_OfficialReceiptDirectFromCashierAllSub_Master from '@/views/AR/AR_OfficialReceiptDirectFromCashierAllSub/AR_OfficialReceiptDirectFromCashierAllSub_Master'
// import AR_PostingORAllSub_Master from '@/views/AR/AR_PostingORAllSub/AR_PostingORAllSub_Master'
// import AR_DepositReceiptDirectFromCashierAllSub_Master from '@/views/AR/AR_DepositReceiptDirectFromCashierAllSub/AR_DepositReceiptDirectFromCashierAllSub_Master'
// import AR_PostingDepositReceiptAllSub_Master from '@/views/AR/AR_PostingDepositReceiptAllSub/AR_PostingDepositReceiptAllSub_Master'
// import AR_AdvReceiptDirectFromCashierAllSub_Master from '@/views/AR/AR_AdvReceiptDirectFromCashierAllSub/AR_AdvReceiptDirectFromCashierAllSub_Master'
// import AR_PostingAdvanceAllSub_Master from '@/views/AR/AR_PostingAdvanceAllSub/AR_PostingAdvanceAllSub_Master'
import AR_UploadDataVirtualAccountBank_Master from '@/views/AR/AR_UploadDataVirtualAccountBank/PageLevel_1/AR_UploadDataVirtualAccountBank'
import AR_ExportVATOutToEFakturLippo from '@/views/AR/AR_ExportVATOutToEFakturLippo/AR_ExportVATOutToEFakturLippo'
import AR_ExportVATOutToEFakturNWP from '@/views/AR/AR_ExportVATOutToEFakturNWP/AR_ExportVATOutToEFakturNWP'
import AR_TransferSecDep_Master from '@/views/AR/AR_TransferSecDep/AR_TransferSecDep_Master'
import AR_TransferSecDepMaintenance_Master from '@/views/AR/AR_TransferSecDepMaintenance/AR_TransferSecDepMaintenance_Master'
import AR_TransferSecDepPosting from '@/views/AR/AR_TransferSecDepPosting/AR_TransferSecDepPosting'
// import AR_TransferSecDepPosting from '@/views/AR/AR_TransferSecDepPosting/AR_TransferSecDepPosting_Master'
import AR_MappingDebtorSecurityDeposit_Master from '@/views/AR/AR_MappingDebtorSecurityDeposit/AR_MappingDebtorSecurityDeposit_Master'

import AR_InvoiceDeposit_MasterVuex from '@/views/AR/AR_InvoiceDepositVuex/AR_InvoiceDeposit_Master'

export const ARRender = {
    path: '/AR',
    component: {
      render (c) { return c('router-view') }
    },
    children: [
        {
            path: '/AR/AR_InvoiceDeposit',
            name: 'AR_InvoiceDeposit',
            component: AR_InvoiceDeposit_MasterVuex,
            meta: {
                requiresAuth: true
            }
        }
        // ,
        // {
        //     path: '/AR/AR_PostingInvoice',
        //     name: 'AR_PostingInvoice',
        //     component: AR_PostingInvoice_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        ,
        {
            path: '/AR/AR_BatchMaster',
            name: 'AR_BatchMaster',
            component: AR_BatchMaster_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_Debtor',
            name: 'AR_Debtor',
            component: AR_Debtor_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_DebtorAnalysis',
            name: 'AR_DebtorAnalysis',
            component: AR_DebtorAnalysis_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_TransactionTypeSubPortfolioMaintenance',
            name: 'AR_TransactionTypeSubPortfolioMaintenance',
            component: AR_TransactionTypeSubPortfolioMaintenance_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_AssignTransactionTypeToSubPortfolio',
            name: 'AR_AssignTransactionTypeToSubPortfolio',
            component: AR_AssignTransactionTypeToSubPortfolio_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_TransactionTypeMaster',
            name: 'AR_TransactionTypeMaster',
            component: AR_TransactionTypeMaster_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_Specification',
            name: 'AR_Specification',
            component: AR_Specification_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_PostingScheduleBillingByDebtor',
            name: 'AR_PostingScheduleBillingByDebtor',
            component: AR_PostingScheduleBillingByDebtor,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_PostingScheduleBilling',
            name: 'AR_PostingScheduleBilling',
            component: AR_PostingScheduleBilling,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_MassBillingMaintenance',
            name: 'AR_MassBillingMaintenance',
            component: AR_MassBillingMaintenance_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        // ,
        // {
        //     path: '/AR/AR_PostingInvoice',
        //     name: 'AR_PostingInvoice',
        //     component: AR_PostingInvoice_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        ,
        {
            path: '/AR/AR_Invoice',
            name: 'AR_Invoice',
            component: AR_Invoice_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_PostingWithholdingTaxInv',
            name: 'AR_PostingWithholdingTaxInv',
            component: AR_PostingWithholdingTaxInv,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_PostingVATInvoice',
            name: 'AR_PostingVATInvoice',
            component: AR_PostingVATInvoice,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_CancelTaxInv',
            name: 'AR_CancelTaxInv',
            component: AR_CancelTaxInv_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_CancelReportedTaxInv',
            name: 'AR_CancelReportedTaxInv',
            component: AR_CancelReportedTaxInv_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_CustomerVATMaintenance',
            name: 'AR_CustomerVATMaintenance',
            component: AR_CustomerVATMaintenance_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_CustVATInvMonitoring',
            name: 'AR_CustVATInvMonitoring',
            component: AR_CustVATInvMonitoring_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_WInvAssignment',
            name: 'AR_WInvAssignment',
            component: AR_WInvAssignment_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_VATInvAssignment',
            name: 'AR_VATInvAssignment',
            component: AR_VATInvAssignment_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        // ,
        // {
        //     path: '/AR/AR_PostingOR',
        //     name: 'AR_PostingOR',
        //     component: AR_PostingOR_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        ,
        {
            path: '/AR/AR_OfficialReceiptDirectFromCashier',
            name: 'AR_OfficialReceiptDirectFromCashier',
            component: AR_OfficialReceiptDirectFromCashier_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        // ,
        // {
        //     path: '/AR/AR_PostingDepositReceipt',
        //     name: 'AR_PostingDepositReceipt',
        //     component: AR_PostingDepositReceipt_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_PostingInvoiceDeposit',
        //     name: 'AR_PostingInvoiceDeposit',
        //     component: AR_PostingInvoiceDeposit_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        ,
        {
            path: '/AR/AR_InvoiceDepositCancellation',
            name: 'AR_InvoiceDepositCancellation',
            component: AR_InvoiceDepositCancellation_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_DepositReceiptDirectFromCashier',
            name: 'AR_DepositReceiptDirectFromCashier',
            component: AR_DepositReceiptDirectFromCashier_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        // ,
        // {
        //     path: '/AR/AR_InvoiceDeposit',
        //     name: 'AR_InvoiceDeposit',
        //     component: AR_InvoiceDeposit_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_PostingAdvance',
        //     name: 'AR_PostingAdvance',
        //     component: AR_PostingAdvance_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        ,
        {
            path: '/AR/AR_AdvReceiptDirectFromCashier',
            name: 'AR_AdvReceiptDirectFromCashier',
            component: AR_AdvReceiptDirectFromCashier_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        // ,
        // {
        //     path: '/AR/AR_PostingRefund',
        //     name: 'AR_PostingRefund',
        //     component: AR_PostingRefund_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        ,
        {
            path: '/AR/AR_Refund',
            name: 'AR_Refund',
            component: AR_Refund_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        // ,
        // {
        //     path: '/AR/AR_PostingDN',
        //     name: 'AR_PostingDN',
        //     component: AR_PostingDN_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        ,
        {
            path: '/AR/AR_DebitNote',
            name: 'AR_DebitNote',
            component: AR_DebitNote_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        // ,
        // {
        //     path: '/AR/AR_PostingCN',
        //     name: 'AR_PostingCN',
        //     component: AR_PostingCN_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        ,
        {
            path: '/AR/AR_CNChargeToAccount',
            name: 'AR_CNChargeToAccount',
            component: AR_CNChargeToAccount_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_CNChargeToInv',
            name: 'AR_CNChargeToInv',
            component: AR_CNChargeToInv_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        // ,
        // {
        //     path: '/AR/AR_PostingAllocation',
        //     name: 'AR_PostingAllocation',
        //     component: AR_PostingAllocation_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        ,
        {
            path: '/AR/AR_Allocation',
            name: 'AR_Allocation',
            component: AR_Allocation_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_PostingAmortization',
            name: 'AR_PostingAmortization',
            component: AR_PostingAmortization,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_GenAmortizeMaint',
            name: 'AR_GenAmortizeMaint',
            component: AR_GenAmortizeMaint_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_GenerateAmortization',
            name: 'AR_GenerateAmortization',
            component: AR_GenerateAmortization_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_AmortizeMaint',
            name: 'AR_AmortizeMaint',
            component: AR_AmortizeMaint_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        // ,
        // {
        //     path: '/AR/AR_PostingAmortizationSchedule',
        //     name: 'AR_PostingAmortizationSchedule',
        //     component: AR_PostingAmortizationSchedule_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        ,
        {
            path: '/AR/AR_PostingPenalty',
            name: 'AR_PostingPenalty',
            component: AR_PostingPenalty,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_PenaltyMaint',
            name: 'AR_PenaltyMaint',
            component: AR_PenaltyMaint_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_GeneratePenalty',
            name: 'AR_GeneratePenalty',
            component: AR_GeneratePenalty,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_ReminderMaint',
            name: 'AR_ReminderMaint',
            component: AR_ReminderMaint_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_GenerateReminder',
            name: 'AR_GenerateReminder',
            component: AR_GenerateReminder,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_PostingRevaluation',
            name: 'AR_PostingRevaluation',
            component: AR_PostingRevaluation,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_RevaluationInquiry',
            name: 'AR_RevaluationInquiry',
            component: AR_RevaluationInquiry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_GenerateRevaluation',
            name: 'AR_GenerateRevaluation',
            component: AR_GenerateRevaluation_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_SingleBillingMaintenanceByDebtor',
            name: 'AR_SingleBillingMaintenanceByDebtor',
            component: AR_SingleBillingMaintenanceByDebtor_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_SingleBillingMaintenance',
            name: 'AR_SingleBillingMaintenance',
            component: AR_SingleBillingMaintenance_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_CancelIndirectInvoice',
            name: 'AR_CancelIndirectInvoice',
            component: AR_CancelIndirectInvoice_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_UnidentifiedTransactionMaintenance',
            name: 'AR_UnidentifiedTransactionMaintenance',
            component: AR_UnidentifiedTransactionMaintenance_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_GenerateWTaxInv',
            name: 'AR_GenerateWTaxInv',
            component: AR_GenerateWTaxInv,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_AmortizeSchedule',
            name: 'AR_AmortizeSchedule',
            component: AR_AmortizeSchedule_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_MassGenerateBilling',
            name: 'AR_MassGenerateBilling',
            component: AR_MassGenerateBilling_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_GenerateScheduleBillingByDebtor',
            name: 'AR_GenerateScheduleBillingByDebtor',
            component: AR_GenerateScheduleBillingByDebtor,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_GenerateScheduleBilling',
            name: 'AR_GenerateScheduleBilling',
            component: AR_GenerateScheduleBilling,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_BillingSchedMaintByDebtor',
            name: 'AR_BillingSchedMaintByDebtor',
            component: AR_BillingSchedMaintByDebtor_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_BillingSchedMaint',
            name: 'AR_BillingSchedMaint',
            component: AR_BillingSchedMaint_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_GenerateVATInv',
            name: 'AR_GenerateVATInv',
            component: AR_GenerateVATInv,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_TaxInvoiceMasterMaintenance',
            name: 'AR_TaxInvoiceMasterMaintenance',
            component: AR_TaxInvoiceMasterMaintenance_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_GenerateTaxInvNo',
            name: 'AR_GenerateTaxInvNo',
            component: AR_GenerateTaxInvNo_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_ChangeTaxPaidBy',
            name: 'AR_ChangeTaxPaidBy',
            component: AR_ChangeTaxPaidBy_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_SplitUnidentifiedAdvance',
            name: 'AR_SplitUnidentifiedAdvance',
            component: AR_SplitUnidentifiedAdvance_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_TaxInvReplacement',
            name: 'AR_TaxInvReplacement',
            component: AR_TaxInvReplacement,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_PostingWithholdingOthersTaxInv',
            name: 'AR_PostingWithholdingOthersTaxInv',
            component: AR_PostingWithholdingOthersTaxInv,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_CustomerWithholdingOthersMaintenance',
            name: 'AR_CustomerWithholdingOthersMaintenance',
            component: AR_CustomerWithholdingOthersMaintenance_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_CustWOthersInvMonitoring',
            name: 'AR_CustWOthersInvMonitoring',
            component: AR_CustWOthersInvMonitoring_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        // ,
        // {
        //     path: '/AR/AR_PostingDepositCancellation',
        //     name: 'AR_PostingDepositCancellation',
        //     component: AR_PostingDepositCancellation_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        ,
        {
            path: '/AR/AR_GenerateScheduleBillingByTrxTypeGroup',
            name: 'AR_GenerateScheduleBillingByTrxTypeGroup',
            component: AR_GenerateScheduleBillingByTrxTypeGroup,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_UnpostVATInvoice',
            name: 'AR_UnpostVATInvoice',
            component: AR_UnpostVATInvoice,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_MassCustomerWithholdingOthersMonitoring',
            name: 'AR_MassCustomerWithholdingOthersMonitoring',
            component: AR_MassCustomerWithholdingOthersMonitoring,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_CNAllocation',
            name: 'AR_CNAllocation',
            component: AR_CNAllocation_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        // ,
        // {
        //     path: '/AR/AR_PostingCNAllocation',
        //     name: 'AR_PostingCNAllocation',
        //     component: AR_PostingCNAllocation_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        ,
        {
            path: '/AR/AR_UpdateTenantDebtor',
            name: 'AR_UpdateTenantDebtor',
            component: AR_UpdateTenantDebtor_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        // ,
        // {
        //     path: '/AR/AR_VATNoMaintenance2013',
        //     name: 'AR_VATNoMaintenance2013',
        //     component: AR_VATNoMaintenance2013_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_GenerateVATNo2013',
        //     name: 'AR_GenerateVATNo2013',
        //     component: AR_GenerateVATNo2013_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_AssignVATNoToDoc2013',
        //     name: 'AR_AssignVATNoToDoc2013',
        //     component: AR_AssignVATNoToDoc2013_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_TaxSettlementConfirmationVAT',
        //     name: 'AR_TaxSettlementConfirmationVAT',
        //     component: AR_TaxSettlementConfirmationVAT_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        ,
        {
            path: '/AR/AR_TaxSettlementVAT',
            name: 'AR_TaxSettlementVAT',
            component: AR_TaxSettlementVAT_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_TaxSettlementCancellationVAT',
            name: 'AR_TaxSettlementCancellationVAT',
            component: AR_TaxSettlementCancellationVAT_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        // {
        //     path: '/AR/AR_TaxSettlementCancellationConfirmationVAT',
        //     name: 'AR_TaxSettlementCancellationConfirmationVAT',
        //     component: AR_TaxSettlementCancellationConfirmationVAT_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_TaxSettlementCancellationConfirmationWH',
        //     name: 'AR_TaxSettlementCancellationConfirmationWH',
        //     component: AR_TaxSettlementCancellationConfirmationWH_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        ,
        {
            path: '/AR/AR_TaxSettlementWH',
            name: 'AR_TaxSettlementWH',
            component: AR_TaxSettlementWH_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        // {
        //     path: '/AR/AR_TaxSettlementConfirmationWH',
        //     name: 'AR_TaxSettlementConfirmationWH',
        //     component: AR_TaxSettlementConfirmationWH_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        ,
        {
            path: '/AR/AR_TaxSettlementCancellationWH',
            name: 'AR_TaxSettlementCancellationWH',
            component: AR_TaxSettlementCancellationWH_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_TaxBatchMasterEntry',
            name: 'AR_TaxBatchMasterEntry',
            component: AR_TaxBatchMasterEntry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_TaxBatchMasterMaintenance',
            name: 'AR_TaxBatchMasterMaintenance',
            component: AR_TaxBatchMasterMaintenance_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_TaxBatchMasterPosting',
            name: 'AR_TaxBatchMasterPosting',
            component: AR_TaxBatchMasterPosting_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_TaxBatchMonitoring',
            name: 'AR_TaxBatchMonitoring',
            component: AR_TaxBatchMonitoring_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_GenerateVATTaxBatchMaster',
            name: 'AR_GenerateVATTaxBatchMaster',
            component: AR_GenerateVATTaxBatchMaster_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_VATBatchAssignment',
            name: 'AR_VATBatchAssignment',
            component: AR_VATBatchAssignment_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_PostingVATBatchMaster',
            name: 'AR_PostingVATBatchMaster',
            component: AR_PostingVATBatchMaster_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_GenerateAmortizeRevenue',
            name: 'AR_GenerateAmortizeRevenue',
            component: AR_GenerateAmortizeRevenue,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_AmortizeRevenueMaintenance',
            name: 'AR_AmortizeRevenueMaintenance',
            component: AR_AmortizeRevenueMaintenance_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_AmortizeRevenueConfirmation',
            name: 'AR_AmortizeRevenueConfirmation',
            component: AR_AmortizeRevenueConfirmation_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_AmortizeRevenueDebitAllocation',
            name: 'AR_AmortizeRevenueDebitAllocation',
            component: AR_AmortizeRevenueDebitAllocation_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_AmortizeRevenueCreditAllocation',
            name: 'AR_AmortizeRevenueCreditAllocation',
            component: AR_AmortizeRevenueCreditAllocation_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        // {
        //     path: '/AR/AR_AmortizeRevenueDebitAllocationConfirmation',
        //     name: 'AR_AmortizeRevenueDebitAllocationConfirmation',
        //     component: AR_AmortizeRevenueDebitAllocationConfirmation_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_AmortizeRevenueCreditAllocationConfirmation',
        //     name: 'AR_AmortizeRevenueCreditAllocationConfirmation',
        //     component: AR_AmortizeRevenueCreditAllocationConfirmation_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        ,
        {
            path: '/AR/AR_CancelReportedTaxBatchMaster',
            name: 'AR_CancelReportedTaxBatchMaster',
            component: AR_CancelReportedTaxBatchMaster_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_CancelTaxBatchMaster',
            name: 'AR_CancelTaxBatchMaster',
            component: AR_CancelTaxBatchMaster_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_PostingScheduleBillingNew',
            name: 'AR_PostingScheduleBillingNew',
            component: AR_PostingScheduleBillingNew,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_DebtorBalance',
            name: 'AR_DebtorBalance',
            component: AR_DebtorBalance_Master,
            meta: {
                requiresAuth: true
            }
        }   
        
        ,
        {
            path: '/AR/AR_GenerateScheduleBillingStrata',
            name: 'AR_GenerateScheduleBillingStrata',
            component: AR_GenerateScheduleBillingStrata,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_UpdateTenantDebtorByLot',
            name: 'AR_UpdateTenantDebtorByLot',
            component: AR_UpdateTenantDebtorByLot_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_PostingScheduleBillingFromStrata',
            name: 'AR_PostingScheduleBillingFromStrata',
            component: AR_PostingScheduleBillingFromStrata,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_BillingSchedMaintFromStrata',
            name: 'AR_BillingSchedMaintFromStrata',
            component: AR_BillingSchedMaintFromStrata_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_GenerateScheduleBilling_Subportfolio',
            name: 'AR_GenerateScheduleBilling_Subportfolio',
            component: AR_GenerateScheduleBilling_Subportfolio_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_WriteOffVAT',
            name: 'AR_WriteOffVAT',
            component: AR_WriteOffVAT_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_SingleBillingMaintenanceFromStrata',
            name: 'AR_SingleBillingMaintenanceFromStrata',
            component: AR_SingleBillingMaintenanceFromStrata_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_ExportVATOutToEFaktur',
            name: 'AR_ExportVATOutToEFaktur',
            component: AR_ExportVATOutToEFaktur_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_PostingScheduleBillingByDebtorNew',
            name: 'AR_PostingScheduleBillingByDebtorNew',
            component: AR_PostingScheduleBillingByDebtorNew,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_PostingScheduleBillingFromStrataNew',
            name: 'AR_PostingScheduleBillingFromStrataNew',
            component: AR_PostingScheduleBillingFromStrataNew,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_Contract_Inquiry',
            name: 'AR_Contract_Inquiry',
            component: AR_Contract_Inquiry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_ImportVATOutEFakturResult',
            name: 'AR_ImportVATOutEFakturResult',
            component: AR_ImportVATOutEFakturResult,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_ChangeVATPaidBy',
            name: 'AR_ChangeVATPaidBy',
            component: AR_ChangeVATPaidBy_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_ChangeWithholdingPaidBy',
            name: 'AR_ChangeWithholdingPaidBy',
            component: AR_ChangeWithholdingPaidBy_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_PostingScheduleBillingCollection',
            name: 'AR_PostingScheduleBillingCollection',
            component: AR_PostingScheduleBillingCollection,
            meta: {
                requiresAuth: true
            }
        }
        
        // ,
        // {
        //     path: '/AR/AR_BillingSchedMaint_All',
        //     name: 'AR_BillingSchedMaint_All',
        //     component: AR_BillingSchedMaint_All_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_BillingSchedMaintByDebtor_All',
        //     name: 'AR_BillingSchedMaintByDebtor_All',
        //     component: AR_BillingSchedMaintByDebtor_All_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_MassBillingMaintenance_All',
        //     name: 'AR_MassBillingMaintenance_All',
        //     component: AR_MassBillingMaintenance_All_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_GenerateScheduleBilling_All',
        //     name: 'AR_GenerateScheduleBilling_All',
        //     component: AR_GenerateScheduleBilling_All_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_GenerateScheduleBillingByTrxTypeGroup_All',
        //     name: 'AR_GenerateScheduleBillingByTrxTypeGroup_All',
        //     component: AR_GenerateScheduleBillingByTrxTypeGroup_All_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_GenerateScheduleBillingByDebtor_All',
        //     name: 'AR_GenerateScheduleBillingByDebtor_All',
        //     component: AR_GenerateScheduleBillingByDebtor_All_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_MassGenerateBilling_All',
        //     name: 'AR_MassGenerateBilling_All',
        //     component: AR_MassGenerateBilling_All_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_PostingScheduleBillingByDebtor_All',
        //     name: 'AR_PostingScheduleBillingByDebtor_All',
        //     component: AR_PostingScheduleBillingByDebtor_All_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_SingleBillingMaintenance_All',
        //     name: 'AR_SingleBillingMaintenance_All',
        //     component: AR_SingleBillingMaintenance_All_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_SingleBillingMaintenanceByDebtor_All',
        //     name: 'AR_SingleBillingMaintenanceByDebtor_All',
        //     component: AR_SingleBillingMaintenanceByDebtor_All_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_PostingScheduleBilling_All',
        //     name: 'AR_PostingScheduleBilling_All',
        //     component: AR_PostingScheduleBilling_All_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_UpdateTenantDebtor_All',
        //     name: 'AR_UpdateTenantDebtor_All',
        //     component: AR_UpdateTenantDebtor_All_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_BillingSchedMaintFromStrata_All',
        //     name: 'AR_BillingSchedMaintFromStrata_All',
        //     component: AR_BillingSchedMaintFromStrata_All_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_GenerateScheduleBillingStrata_All',
        //     name: 'AR_GenerateScheduleBillingStrata_All',
        //     component: AR_GenerateScheduleBillingStrata_All_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_SingleBillingMaintenanceFromStrata_All',
        //     name: 'AR_SingleBillingMaintenanceFromStrata_All',
        //     component: AR_SingleBillingMaintenanceFromStrata_All_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_PostingScheduleBillingFromStrata_All',
        //     name: 'AR_PostingScheduleBillingFromStrata_All',
        //     component: AR_PostingScheduleBillingFromStrata_All_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_UpdateTenantDebtorByLot_All',
        //     name: 'AR_UpdateTenantDebtorByLot_All',
        //     component: AR_UpdateTenantDebtorByLot_All_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        ,
        {
            path: '/AR/AR_AutoGenerateBillingSchedule',
            name: 'AR_AutoGenerateBillingSchedule',
            component: AR_AutoGenerateBillingSchedule_Master,
            meta: {
                requiresAuth: true
            }
        }
        ,
        {
            path: '/AR/AR_AutoGenerateBillingScheduleDetail',
            name: 'AR_AutoGenerateBillingScheduleDetail',
            component: AR_AutoGenerateBillingScheduleDetail_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        // ,
        // {
        //     path: '/AR/AR_AutoGenerateBillingScheduleAll',
        //     name: 'AR_AutoGenerateBillingScheduleAll',
        //     component: AR_AutoGenerateBillingScheduleAll_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        ,
        {
            path: '/AR/AR_AutoGenerateBillingScheduleByDebtor',
            name: 'AR_AutoGenerateBillingScheduleByDebtor',
            component: AR_AutoGenerateBillingScheduleByDebtor_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        // ,
        // {
        //     path: '/AR/AR_AutoGenerateBillingScheduleByDebtorAll',
        //     name: 'AR_AutoGenerateBillingScheduleByDebtorAll',
        //     component: AR_AutoGenerateBillingScheduleByDebtorAll_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        ,
        {
            path: '/AR/AR_AutoGenerateBillingScheduleFromStrata',
            name: 'AR_AutoGenerateBillingScheduleFromStrata',
            component: AR_AutoGenerateBillingScheduleFromStrata_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        // ,
        // {
        //     path: '/AR/AR_AutoGenerateBillingScheduleFromStrataAll',
        //     name: 'AR_AutoGenerateBillingScheduleFromStrataAll',
        //     component: AR_AutoGenerateBillingScheduleFromStrataAll_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_OfficialReceiptDirectFromCashierAllSub',
        //     name: 'AR_OfficialReceiptDirectFromCashierAllSub',
        //     component: AR_OfficialReceiptDirectFromCashierAllSub_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_PostingORAllSub',
        //     name: 'AR_PostingORAllSub',
        //     component: AR_PostingORAllSub_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_DepositReceiptDirectFromCashierAllSub',
        //     name: 'AR_DepositReceiptDirectFromCashierAllSub',
        //     component: AR_DepositReceiptDirectFromCashierAllSub_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_PostingDepositReceiptAllSub',
        //     name: 'AR_PostingDepositReceiptAllSub',
        //     component: AR_PostingDepositReceiptAllSub_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_AdvReceiptDirectFromCashierAllSub',
        //     name: 'AR_AdvReceiptDirectFromCashierAllSub',
        //     component: AR_AdvReceiptDirectFromCashierAllSub_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/AR/AR_PostingAdvanceAllSub',
        //     name: 'AR_PostingAdvanceAllSub',
        //     component: AR_PostingAdvanceAllSub_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        ,
        {
            path: '/AR/AR_UploadDataVirtualAccountBank',
            name: 'AR_UploadDataVirtualAccountBank',
            component: AR_UploadDataVirtualAccountBank_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_ExportVATOutToEFakturLippo',
            name: 'AR_ExportVATOutToEFakturLippo',
            component: AR_ExportVATOutToEFakturLippo,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_ExportVATOutToEFakturNWP',
            name: 'AR_ExportVATOutToEFakturNWP',
            component: AR_ExportVATOutToEFakturNWP,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_TransferSecDep',
            name: 'AR_TransferSecDep',
            component: AR_TransferSecDep_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_TransferSecDepMaintenance',
            name: 'AR_TransferSecDepMaintenance',
            component: AR_TransferSecDepMaintenance_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        // ,
        // {
        //     path: '/AR/AR_TransferSecDepPosting',
        //     name: 'AR_TransferSecDepPosting',
        //     component: AR_TransferSecDepPosting_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }

        ,
        {
            path: '/AR/AR_TransferSecDepPosting',
            name: 'AR_TransferSecDepPosting',
            component: AR_TransferSecDepPosting,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/AR/AR_MappingDebtorSecurityDeposit',
            name: 'AR_MappingDebtorSecurityDeposit',
            component: AR_MappingDebtorSecurityDeposit_Master,
            meta: {
                requiresAuth: true
            }
        }
    ]
}