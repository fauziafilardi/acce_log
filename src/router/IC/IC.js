import IC_SubportfolioStockMasterFile_Master from  '@/views/IC/IC_SubportfolioStockMasterFile/IC_SubportfolioStockMasterFile_Master'
import IC_AssignStockToSubportfolio_Master from  '@/views/IC/IC_AssignStockToSubportfolio/IC_AssignStockToSubportfolio_Master'
import IC_StockMasterFile_Master from  '@/views/IC/IC_StockMasterFile/IC_StockMasterFile_Master'
import IC_SubportfolioStockGroup_Master from  '@/views/IC/IC_SubportfolioStockGroup/IC_SubportfolioStockGroup_Master'
import IC_AssignStockGroupToSubportfolio_Master from  '@/views/IC/IC_AssignStockGroupToSubportfolio/IC_AssignStockGroupToSubportfolio_Master'
import IC_StockGroupMasterFile_Master from  '@/views/IC/IC_StockGroupMasterFile/IC_StockGroupMasterFile_Master'
import IC_StockAnalysis_Master from  '@/views/IC/IC_StockAnalysis/IC_StockAnalysis_Master'
import IC_LocationMasterFile_Master from  '@/views/IC/IC_LocationMasterFile/IC_LocationMasterFile_Master'
import IC_StockMeasurementConversion_Master from  '@/views/IC/IC_StockMeasurementConversion/IC_StockMeasurementConversion_Master'
import IC_TransactionTypeSubPortfolioMaintenance_Master from  '@/views/IC/IC_TransactionTypeSubPortfolioMaintenance/IC_TransactionTypeSubPortfolioMaintenance_Master'
import IC_AssignTransactionTypeToSubPortfolio_Master from  '@/views/IC/IC_AssignTransactionTypeToSubPortfolio/IC_AssignTransactionTypeToSubPortfolio_Master'
import IC_TransactionType_Master from  '@/views/IC/IC_TransactionType/IC_TransactionType_Master'
import IC_Specification_Master from  '@/views/IC/IC_Specification/IC_Specification_Master'
import IC_InventoryRequisitionMonitoring_Master from  '@/views/IC/IC_InventoryRequisitionMonitoring/IC_InventoryRequisitionMonitoring_Master'
import IC_InventoryRequisitionApproval_Master from  '@/views/IC/IC_InventoryRequisitionApproval/IC_InventoryRequisitionApproval_Master'
import IC_InventoryRequisitionEntry_Master from  '@/views/IC/IC_InventoryRequisitionEntry/IC_InventoryRequisitionEntry_Master'
import IC_BlockBinMapping_Master from  '@/views/IC/IC_BlockBinMapping/IC_BlockBinMapping_Master'
import IC_AssignStockToNewLocation_Master from  '@/views/IC/IC_AssignStockToNewLocation/IC_AssignStockToNewLocation_Master'
import IC_SerialNumberPosting_Master from  '@/views/IC/IC_SerialNumberPosting/IC_SerialNumberPosting_Master'
import IC_SerialNumberEntry_Master from  '@/views/IC/IC_SerialNumberEntry/IC_SerialNumberEntry_Master'
import IC_BlockOrBinPosting_Master from  '@/views/IC/IC_BlockOrBinPosting/IC_BlockOrBinPosting_Master'
import IC_BlockOrBinAllocation_Master from  '@/views/IC/IC_BlockOrBinAllocation/IC_BlockOrBinAllocation_Master'
import IC_StockReceiptPosting_Master from  '@/views/IC/IC_StockReceiptPosting/IC_StockReceiptPosting_Master'
import IC_StockReceiptEntry_Master from  '@/views/IC/IC_StockReceiptEntry/IC_StockReceiptEntry_Master'
import IC_StockTransferPosting_Master from  '@/views/IC/IC_StockTransferPosting/IC_StockTransferPosting_Master'
import IC_StockTransferEntry_Master from  '@/views/IC/IC_StockTransferEntry/IC_StockTransferEntry_Master'
import IC_StockAdjustmentPosting_Master from  '@/views/IC/IC_StockAdjustmentPosting/IC_StockAdjustmentPosting_Master'
import IC_StockAdjustmentEntry_Master from  '@/views/IC/IC_StockAdjustmentEntry/IC_StockAdjustmentEntry_Master'
import IC_StockReturnMonitoring_Master from  '@/views/IC/IC_StockReturnMonitoring/IC_StockReturnMonitoring_Master'
import IC_StockReturnPosting_Master from  '@/views/IC/IC_StockReturnPosting/IC_StockReturnPosting_Master'
import IC_StockReturnEntry_Master from  '@/views/IC/IC_StockReturnEntry/IC_StockReturnEntry_Master'
import IC_CycleCountPosting_Master from  '@/views/IC/IC_CycleCountPosting/IC_CycleCountPosting_Master'
import IC_CycleCountEntry_Master from  '@/views/IC/IC_CycleCountEntry/IC_CycleCountEntry_Master'
import IC_GenerateCycleCountWorkSheet_Master from  '@/views/IC/IC_GenerateCycleCountWorkSheet/IC_GenerateCycleCountWorkSheet_Master'
import IC_StockUsageProjection_Master from  '@/views/IC/IC_StockUsageProjection/IC_StockUsageProjection_Master'
import IC_StockIssuePosting_Master from  '@/views/IC/IC_StockIssuePosting/IC_StockIssuePosting_Master'
import IC_StockIssueMaintenance_Master from  '@/views/IC/IC_StockIssueMaintenance/IC_StockIssueMaintenance_Master'
import IC_GenerateStockIssue_Master from  '@/views/IC/IC_GenerateStockIssue/IC_GenerateStockIssue_Master'
import IC_InventoryRequisitionApprovalMaintenance_Master from  '@/views/IC/IC_InventoryRequisitionApprovalMaintenance/IC_InventoryRequisitionApprovalMaintenance_Master'
import IC_InventoryRequisitionApproval2_Master from  '@/views/IC/IC_InventoryRequisitionApproval2/IC_InventoryRequisitionApproval2_Master'
import IC_InventoryRequisitionApproval3_Master from  '@/views/IC/IC_InventoryRequisitionApproval3/IC_InventoryRequisitionApproval3_Master'
import IC_DraftStockRequisition_Mapping_Master from  '@/views/IC/IC_DraftStockRequisition_Mapping/IC_DraftStockRequisition_Mapping_Master'
import IC_StockReturnUpdatePosting_Master from  '@/views/IC/IC_StockReturnUpdatePosting/IC_StockReturnUpdatePosting_Master'
import IC_StockReturnMonitoring2_Master from  '@/views/IC/IC_StockReturnMonitoring2/IC_StockReturnMonitoring2_Master'
import IC_Stock_ItemCodeCopy_Master from  '@/views/IC/IC_Stock_ItemCodeCopy/IC_Stock_ItemCodeCopy_Master'
import IC_SubportfolioStockGroupAccounting_Master from  '@/views/IC/IC_SubportfolioStockGroupAccounting/IC_SubportfolioStockGroupAccounting_Master'
import IC_StockGroupMasterFileAccounting_Master from  '@/views/IC/IC_StockGroupMasterFileAccounting/IC_StockGroupMasterFileAccounting_Master'


export const ICRender = {
    path: '/IC',
    component: {
      render (c) { return c('router-view') }
    },
    children: [
        {
            path: '/IC/IC_SubportfolioStockMasterFile',
            name: 'IC_SubportfolioStockMasterFile',
            component: IC_SubportfolioStockMasterFile_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_AssignStockToSubportfolio',
            name: 'IC_AssignStockToSubportfolio',
            component: IC_AssignStockToSubportfolio_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_StockMasterFile',
            name: 'IC_StockMasterFile',
            component: IC_StockMasterFile_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_SubportfolioStockGroup',
            name: 'IC_SubportfolioStockGroup',
            component: IC_SubportfolioStockGroup_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_AssignStockGroupToSubportfolio',
            name: 'IC_AssignStockGroupToSubportfolio',
            component: IC_AssignStockGroupToSubportfolio_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_StockGroupMasterFile',
            name: 'IC_StockGroupMasterFile',
            component: IC_StockGroupMasterFile_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_StockAnalysis',
            name: 'IC_StockAnalysis',
            component: IC_StockAnalysis_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_LocationMasterFile',
            name: 'IC_LocationMasterFile',
            component: IC_LocationMasterFile_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_StockMeasurementConversion',
            name: 'IC_StockMeasurementConversion',
            component: IC_StockMeasurementConversion_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_TransactionTypeSubPortfolioMaintenance',
            name: 'IC_TransactionTypeSubPortfolioMaintenance',
            component: IC_TransactionTypeSubPortfolioMaintenance_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_AssignTransactionTypeToSubPortfolio',
            name: 'IC_AssignTransactionTypeToSubPortfolio',
            component: IC_AssignTransactionTypeToSubPortfolio_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_TransactionType',
            name: 'IC_TransactionType',
            component: IC_TransactionType_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_Specification',
            name: 'IC_Specification',
            component: IC_Specification_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_InventoryRequisitionMonitoring',
            name: 'IC_InventoryRequisitionMonitoring',
            component: IC_InventoryRequisitionMonitoring_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_InventoryRequisitionApproval',
            name: 'IC_InventoryRequisitionApproval',
            component: IC_InventoryRequisitionApproval_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_InventoryRequisitionEntry',
            name: 'IC_InventoryRequisitionEntry',
            component: IC_InventoryRequisitionEntry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_BlockBinMapping',
            name: 'IC_BlockBinMapping',
            component: IC_BlockBinMapping_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_AssignStockToNewLocation',
            name: 'IC_AssignStockToNewLocation',
            component: IC_AssignStockToNewLocation_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_SerialNumberPosting',
            name: 'IC_SerialNumberPosting',
            component: IC_SerialNumberPosting_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_SerialNumberEntry',
            name: 'IC_SerialNumberEntry',
            component: IC_SerialNumberEntry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_BlockOrBinPosting',
            name: 'IC_BlockOrBinPosting',
            component: IC_BlockOrBinPosting_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_BlockOrBinAllocation',
            name: 'IC_BlockOrBinAllocation',
            component: IC_BlockOrBinAllocation_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_StockReceiptPosting',
            name: 'IC_StockReceiptPosting',
            component: IC_StockReceiptPosting_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_StockReceiptEntry',
            name: 'IC_StockReceiptEntry',
            component: IC_StockReceiptEntry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_StockTransferPosting',
            name: 'IC_StockTransferPosting',
            component: IC_StockTransferPosting_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_StockTransferEntry',
            name: 'IC_StockTransferEntry',
            component: IC_StockTransferEntry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_StockAdjustmentPosting',
            name: 'IC_StockAdjustmentPosting',
            component: IC_StockAdjustmentPosting_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_StockAdjustmentEntry',
            name: 'IC_StockAdjustmentEntry',
            component: IC_StockAdjustmentEntry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_StockReturnMonitoring',
            name: 'IC_StockReturnMonitoring',
            component: IC_StockReturnMonitoring_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_StockReturnPosting',
            name: 'IC_StockReturnPosting',
            component: IC_StockReturnPosting_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_StockReturnEntry',
            name: 'IC_StockReturnEntry',
            component: IC_StockReturnEntry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_CycleCountPosting',
            name: 'IC_CycleCountPosting',
            component: IC_CycleCountPosting_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_CycleCountEntry',
            name: 'IC_CycleCountEntry',
            component: IC_CycleCountEntry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_GenerateCycleCountWorkSheet',
            name: 'IC_GenerateCycleCountWorkSheet',
            component: IC_GenerateCycleCountWorkSheet_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_StockUsageProjection',
            name: 'IC_StockUsageProjection',
            component: IC_StockUsageProjection_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_StockIssuePosting',
            name: 'IC_StockIssuePosting',
            component: IC_StockIssuePosting_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_StockIssueMaintenance',
            name: 'IC_StockIssueMaintenance',
            component: IC_StockIssueMaintenance_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_GenerateStockIssue',
            name: 'IC_GenerateStockIssue',
            component: IC_GenerateStockIssue_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_InventoryRequisitionApprovalMaintenance',
            name: 'IC_InventoryRequisitionApprovalMaintenance',
            component: IC_InventoryRequisitionApprovalMaintenance_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_InventoryRequisitionApproval2',
            name: 'IC_InventoryRequisitionApproval2',
            component: IC_InventoryRequisitionApproval2_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_InventoryRequisitionApproval3',
            name: 'IC_InventoryRequisitionApproval3',
            component: IC_InventoryRequisitionApproval3_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_DraftStockRequisition_Mapping',
            name: 'IC_DraftStockRequisition_Mapping',
            component: IC_DraftStockRequisition_Mapping_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_StockReturnUpdatePosting',
            name: 'IC_StockReturnUpdatePosting',
            component: IC_StockReturnUpdatePosting_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_StockReturnMonitoring2',
            name: 'IC_StockReturnMonitoring2',
            component: IC_StockReturnMonitoring2_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_Stock_ItemCodeCopy',
            name: 'IC_Stock_ItemCodeCopy',
            component: IC_Stock_ItemCodeCopy_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_SubportfolioStockGroupAccounting',
            name: 'IC_SubportfolioStockGroupAccounting',
            component: IC_SubportfolioStockGroupAccounting_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/IC/IC_StockGroupMasterFileAccounting',
            name: 'IC_StockGroupMasterFileAccounting',
            component: IC_StockGroupMasterFileAccounting_Master,
            meta: {
                requiresAuth: true
            }
        }
    ]
}