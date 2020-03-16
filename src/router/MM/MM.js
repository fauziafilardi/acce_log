import MM_TagGenerator_Master from  '@/views/MM/MM_TagGenerator/MM_TagGenerator_Master'
import MM_TagMasterFile_Master from  '@/views/MM/MM_TagMasterFile/MM_TagMasterFile_Master'
import MM_TagGroupMasterFile_Master from  '@/views/MM/MM_TagGroupMasterFile/MM_TagGroupMasterFile_Master'
import MM_TagAnalysis_Master from  '@/views/MM/MM_TagAnalysis/MM_TagAnalysis_Master'
import MM_LaborMasterFile_Master from  '@/views/MM/MM_LaborMasterFile/MM_LaborMasterFile_Master'
import MM_LaborCategoryMasterFile_Master from  '@/views/MM/MM_LaborCategoryMasterFile/MM_LaborCategoryMasterFile_Master'
import MM_FaultCategoryMasterFile_Master from  '@/views/MM/MM_FaultCategoryMasterFile/MM_FaultCategoryMasterFile_Master'
import MM_ItemChargesMasterFile_Master from  '@/views/MM/MM_ItemChargesMasterFile/MM_ItemChargesMasterFile_Master'
import MM_InstructionMasterFile_Master from  '@/views/MM/MM_InstructionMasterFile/MM_InstructionMasterFile_Master'
import MM_TransactionTypeSubPortfolioMaintenance_Master from  '@/views/MM/MM_TransactionTypeSubPortfolioMaintenance/MM_TransactionTypeSubPortfolioMaintenance_Master'
import MM_AssignTransactionTypeToSubPortfolio_Master from  '@/views/MM/MM_AssignTransactionTypeToSubPortfolio/MM_AssignTransactionTypeToSubPortfolio_Master'
import MM_TransactionTypeMaster_Master from  '@/views/MM/MM_TransactionTypeMaster/MM_TransactionTypeMaster_Master'
import MM_Specification_Master from  '@/views/MM/MM_Specification/MM_Specification_Master'
import MM_MaintenanceContractCancellation_Master from  '@/views/MM/MM_MaintenanceContractCancellation/MM_MaintenanceContractCancellation_Master'
import MM_MaintenanceContractApproval_Master from  '@/views/MM/MM_MaintenanceContractApproval/MM_MaintenanceContractApproval_Master'
import MM_MaintenanceContractEntryA_Master from  '@/views/MM/MM_MaintenanceContractEntryA/MM_MaintenanceContractEntryA_Master'
import MM_PreventiveMaintenanceCancellation_Master from  '@/views/MM/MM_PreventiveMaintenanceCancellation/MM_PreventiveMaintenanceCancellation_Master'
import MM_GeneratePreventiveMaintenance_Master from  '@/views/MM/MM_GeneratePreventiveMaintenance/MM_GeneratePreventiveMaintenance_Master'
import MM_PreventiveMaintenanceEntry_Master from  '@/views/MM/MM_PreventiveMaintenanceEntry/MM_PreventiveMaintenanceEntry_Master'
import MM_WorkOrderClosing_Master from  '@/views/MM/MM_WorkOrderClosing/MM_WorkOrderClosing_Master'
import MM_WorkOrderUpdate_Master from  '@/views/MM/MM_WorkOrderUpdate/MM_WorkOrderUpdate_Master'
import MM_WorkOrderCancellation_Master from  '@/views/MM/MM_WorkOrderCancellation/MM_WorkOrderCancellation_Master'
import MM_WorkOrderApproval_Master from  '@/views/MM/MM_WorkOrderApproval/MM_WorkOrderApproval_Master'
import MM_WorkOrderEntry_Master from  '@/views/MM/MM_WorkOrderEntry/MM_WorkOrderEntry_Master'
import MM_GenerateWorkOrder2_Master from  '@/views/MM/MM_GenerateWorkOrder2/MM_GenerateWorkOrder2_Master'
import MM_PostingTagMeterReading_Master from  '@/views/MM/MM_PostingTagMeterReading/MM_PostingTagMeterReading_Master'
import MM_TagMeterReadingEntry_Master from  '@/views/MM/MM_TagMeterReadingEntry/MM_TagMeterReadingEntry_Master'
import MM_GenerateWOBilling_Master from  '@/views/MM/MM_GenerateWOBilling/MM_GenerateWOBilling_Master'
import MM_GenerateStockRequest_Master from  '@/views/MM/MM_GenerateStockRequest/MM_GenerateStockRequest_Master'
import MM_WorkOrderForecast_Master from  '@/views/MM/MM_WorkOrderForecast/MM_WorkOrderForecast_Master'
import MM_GenerateMaintenanceSchedule_Master from  '@/views/MM/MM_GenerateMaintenanceSchedule/MM_GenerateMaintenanceSchedule_Master'
import MM_CustomerRequest_Master from  '@/views/MM/MM_CustomerRequest/MM_CustomerRequest_Master'
import MM_PostingPreventiveMeterReading_Master from  '@/views/MM/MM_PostingPreventiveMeterReading/MM_PostingPreventiveMeterReading_Master'
import MM_PreventiveMeterReading_Master from  '@/views/MM/MM_PreventiveMeterReading/MM_PreventiveMeterReading_Master'
import MM_ScheduleStaff_Calendar_Master from  '@/views/MM/MM_ScheduleStaff_Calendar/MM_ScheduleStaff_Calendar_Master'
import MM_Accessory_Master from  '@/views/MM/MM_Accessory/MM_Accessory_Master'
import MM_SecurityTeamMasterH_Master from  '@/views/MM/MM_SecurityTeamMasterH/MM_SecurityTeamMasterH_Master'
import MM_Shift_Master from  '@/views/MM/MM_Shift/MM_Shift_Master'
import MM_PatrolLocation_Master from  '@/views/MM/MM_PatrolLocation/MM_PatrolLocation_Master'


export const MMRender = {
    path: '/MM',
    component: {
      render (c) { return c('router-view') }
    },
    children: [
        {
            path: '/MM/MM_TagGenerator',
            name: 'MM_TagGenerator',
            component: MM_TagGenerator_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_TagMasterFile',
            name: 'MM_TagMasterFile',
            component: MM_TagMasterFile_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_TagGroupMasterFile',
            name: 'MM_TagGroupMasterFile',
            component: MM_TagGroupMasterFile_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_TagAnalysis',
            name: 'MM_TagAnalysis',
            component: MM_TagAnalysis_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_LaborMasterFile',
            name: 'MM_LaborMasterFile',
            component: MM_LaborMasterFile_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_LaborCategoryMasterFile',
            name: 'MM_LaborCategoryMasterFile',
            component: MM_LaborCategoryMasterFile_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_FaultCategoryMasterFile',
            name: 'MM_FaultCategoryMasterFile',
            component: MM_FaultCategoryMasterFile_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_ItemChargesMasterFile',
            name: 'MM_ItemChargesMasterFile',
            component: MM_ItemChargesMasterFile_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_InstructionMasterFile',
            name: 'MM_InstructionMasterFile',
            component: MM_InstructionMasterFile_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_TransactionTypeSubPortfolioMaintenance',
            name: 'MM_TransactionTypeSubPortfolioMaintenance',
            component: MM_TransactionTypeSubPortfolioMaintenance_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_AssignTransactionTypeToSubPortfolio',
            name: 'MM_AssignTransactionTypeToSubPortfolio',
            component: MM_AssignTransactionTypeToSubPortfolio_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_TransactionTypeMaster',
            name: 'MM_TransactionTypeMaster',
            component: MM_TransactionTypeMaster_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_Specification',
            name: 'MM_Specification',
            component: MM_Specification_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_MaintenanceContractCancellation',
            name: 'MM_MaintenanceContractCancellation',
            component: MM_MaintenanceContractCancellation_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_MaintenanceContractApproval',
            name: 'MM_MaintenanceContractApproval',
            component: MM_MaintenanceContractApproval_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_MaintenanceContractEntryA',
            name: 'MM_MaintenanceContractEntryA',
            component: MM_MaintenanceContractEntryA_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_PreventiveMaintenanceCancellation',
            name: 'MM_PreventiveMaintenanceCancellation',
            component: MM_PreventiveMaintenanceCancellation_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_GeneratePreventiveMaintenance',
            name: 'MM_GeneratePreventiveMaintenance',
            component: MM_GeneratePreventiveMaintenance_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_PreventiveMaintenanceEntry',
            name: 'MM_PreventiveMaintenanceEntry',
            component: MM_PreventiveMaintenanceEntry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_WorkOrderClosing',
            name: 'MM_WorkOrderClosing',
            component: MM_WorkOrderClosing_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_WorkOrderUpdate',
            name: 'MM_WorkOrderUpdate',
            component: MM_WorkOrderUpdate_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_WorkOrderCancellation',
            name: 'MM_WorkOrderCancellation',
            component: MM_WorkOrderCancellation_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_WorkOrderApproval',
            name: 'MM_WorkOrderApproval',
            component: MM_WorkOrderApproval_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_WorkOrderEntry',
            name: 'MM_WorkOrderEntry',
            component: MM_WorkOrderEntry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_GenerateWorkOrder2',
            name: 'MM_GenerateWorkOrder2',
            component: MM_GenerateWorkOrder2_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_PostingTagMeterReading',
            name: 'MM_PostingTagMeterReading',
            component: MM_PostingTagMeterReading_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_TagMeterReadingEntry',
            name: 'MM_TagMeterReadingEntry',
            component: MM_TagMeterReadingEntry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_GenerateWOBilling',
            name: 'MM_GenerateWOBilling',
            component: MM_GenerateWOBilling_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_GenerateStockRequest',
            name: 'MM_GenerateStockRequest',
            component: MM_GenerateStockRequest_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_WorkOrderForecast',
            name: 'MM_WorkOrderForecast',
            component: MM_WorkOrderForecast_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_GenerateMaintenanceSchedule',
            name: 'MM_GenerateMaintenanceSchedule',
            component: MM_GenerateMaintenanceSchedule_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_CustomerRequest',
            name: 'MM_CustomerRequest',
            component: MM_CustomerRequest_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_PostingPreventiveMeterReading',
            name: 'MM_PostingPreventiveMeterReading',
            component: MM_PostingPreventiveMeterReading_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_PreventiveMeterReading',
            name: 'MM_PreventiveMeterReading',
            component: MM_PreventiveMeterReading_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_Accessory',
            name: 'MM_Accessory',
            component: MM_Accessory_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_ScheduleStaff_Calendar',
            name: 'MM_ScheduleStaff_Calendar',
            component: MM_ScheduleStaff_Calendar_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_SecurityTeamMasterH',
            name: 'MM_SecurityTeamMasterH',
            component: MM_SecurityTeamMasterH_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_Shift',
            name: 'MM_Shift',
            component: MM_Shift_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MM/MM_PatrolLocation',
            name: 'MM_PatrolLocation',
            component: MM_PatrolLocation_Master,
            meta: {
                requiresAuth: true
            }
        }
    ]
}