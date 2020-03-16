import FA_AcquisitionPosting_Master from  '@/views/FA/FA_AcquisitionPosting/FA_AcquisitionPosting_Master'
import FA_Acquisition_Master from  '@/views/FA/FA_Acquisition/FA_Acquisition_Master'
import FA_TransferPosting_Master from  '@/views/FA/FA_TransferPosting/FA_TransferPosting_Master'
import FA_RevaluationPosting_Master from  '@/views/FA/FA_RevaluationPosting/FA_RevaluationPosting_Master'
import FA_DisposalPosting_Master from  '@/views/FA/FA_DisposalPosting/FA_DisposalPosting_Master'
import FA_GenerateDisposal_Master from  '@/views/FA/FA_GenerateDisposal/FA_GenerateDisposal_Master'
import FA_Disposal_Master from  '@/views/FA/FA_Disposal/FA_Disposal_Master'
import FA_WriteOffPosting_Master from  '@/views/FA/FA_WriteOffPosting/FA_WriteOffPosting_Master'
import FA_WriteOff_Master from  '@/views/FA/FA_WriteOff/FA_WriteOff_Master'
import FA_AssetInProgress_Master from  '@/views/FA/FA_AssetInProgress/FA_AssetInProgress_Master'
import FA_FixedAsset_Master from  '@/views/FA/FA_FixedAsset/FA_FixedAsset_Master'
import FA_Analysis_Master from  '@/views/FA/FA_Analysis/FA_Analysis_Master'
import FA_Location_Master from  '@/views/FA/FA_Location/FA_Location_Master'
import FA_Group_Master from  '@/views/FA/FA_Group/FA_Group_Master'
import FA_SubportfolioAssetClassMaintenance_Master from  '@/views/FA/FA_SubportfolioAssetClassMaintenance/FA_SubportfolioAssetClassMaintenance_Master'
import FA_Revaluation_Master from  '@/views/FA/FA_Revaluation/FA_Revaluation_Master'
import FA_LocationSearch_Master from  '@/views/FA/FA_LocationSearch/FA_LocationSearch_Master'
import FA_PostingDepreciation_Master from  '@/views/FA/FA_PostingDepreciation/FA_PostingDepreciation_Master'
import FA_DepreciationScheduleMaintCommercial_Master from  '@/views/FA/FA_DepreciationScheduleMaintCommercial/FA_DepreciationScheduleMaintCommercial_Master'
import FA_DepreciationScheduleMaintFiscal_Master from  '@/views/FA/FA_DepreciationScheduleMaintFiscal/FA_DepreciationScheduleMaintFiscal_Master'
import FA_TempNonDeprPosting_Master from  '@/views/FA/FA_TempNonDeprPosting/FA_TempNonDeprPosting_Master'
import FA_AssignAssetClassToSubPortfolio_Master from  '@/views/FA/FA_AssignAssetClassToSubPortfolio/FA_AssignAssetClassToSubPortfolio_Master'
import FA_TempNonDeprAssetMaint_Master from  '@/views/FA/FA_TempNonDeprAssetMaint/FA_TempNonDeprAssetMaint_Master'
import FA_Class_Master from  '@/views/FA/FA_Class/FA_Class_Master'
import FA_GenerateDepreciation_Master from  '@/views/FA/FA_GenerateDepreciation/FA_GenerateDepreciation_Master'
import FA_RegistrationPrefix_Master from  '@/views/FA/FA_RegistrationPrefix/FA_RegistrationPrefix_Master'
import FA_Specification_Master from  '@/views/FA/FA_Specification/FA_Specification_Master'
import FA_NonDeprAsset_Master from  '@/views/FA/FA_NonDeprAsset/FA_NonDeprAsset_Master'
import FA_NonDepreciableAnalysis_Master from  '@/views/FA/FA_NonDepreciableAnalysis/FA_NonDepreciableAnalysis_Master'
import FA_Transfer_Master from  '@/views/FA/FA_Transfer/FA_Transfer_Master'
import FA_NonDepreciableAssetGroup_Master from  '@/views/FA/FA_NonDepreciableAssetGroup/FA_NonDepreciableAssetGroup_Master'
import FA_PrintBarcode_Master from  '@/views/FA/FA_PrintBarcode/FA_PrintBarcode_Master'
import FA_ChangeNonDepreciableAssetCd_Master from  '@/views/FA/FA_ChangeNonDepreciableAssetCd/FA_ChangeNonDepreciableAssetCd_Master'
import FA_ChangeAssetID_Master from  '@/views/FA/FA_ChangeAssetID/FA_ChangeAssetID_Master'
import FA_TerminateDeprSchedule_Master from  '@/views/FA/FA_TerminateDeprSchedule/FA_TerminateDeprSchedule_Master'
import FA_DepreciationReschedule_Master from  '@/views/FA/FA_DepreciationReschedule/FA_DepreciationReschedule_Master'
import FA_ManualDepreciationConfirmation_Master from  '@/views/FA/FA_ManualDepreciationConfirmation/FA_ManualDepreciationConfirmation_Master'
import FA_ManualDepreciationSchedule_Master from  '@/views/FA/FA_ManualDepreciationSchedule/FA_ManualDepreciationSchedule_Master'
import FA_RequisitionApproval_Master from  '@/views/FA/FA_RequisitionApproval/FA_RequisitionApproval_Master'
import FA_TransactionTypeMaster_Master from  '@/views/FA/FA_TransactionTypeMaster/FA_TransactionTypeMaster_Master'
import FA_CloseAssetInProgress_Master from  '@/views/FA/FA_CloseAssetInProgress/FA_CloseAssetInProgress_Master'
import FA_CalculateBookValue_Master from  '@/views/FA/FA_CalculateBookValue/FA_CalculateBookValue_Master'
import FA_AssetInProgressReclass_Master from  '@/views/FA/FA_AssetInProgressReclass/FA_AssetInProgressReclass_Master'


export const FARender = {
    path: '/FA',
    component: {
      render (c) { return c('router-view') }
    },
    children: [
        {
            path: '/FA/FA_AcquisitionPosting',
            name: 'FA_AcquisitionPosting',
            component: FA_AcquisitionPosting_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_Acquisition',
            name: 'FA_Acquisition',
            component: FA_Acquisition_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_TransferPosting',
            name: 'FA_TransferPosting',
            component: FA_TransferPosting_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_RevaluationPosting',
            name: 'FA_RevaluationPosting',
            component: FA_RevaluationPosting_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_DisposalPosting',
            name: 'FA_DisposalPosting',
            component: FA_DisposalPosting_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_GenerateDisposal',
            name: 'FA_GenerateDisposal',
            component: FA_GenerateDisposal_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_Disposal',
            name: 'FA_Disposal',
            component: FA_Disposal_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_WriteOffPosting',
            name: 'FA_WriteOffPosting',
            component: FA_WriteOffPosting_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_WriteOff',
            name: 'FA_WriteOff',
            component: FA_WriteOff_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_AssetInProgress',
            name: 'FA_AssetInProgress',
            component: FA_AssetInProgress_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_FixedAsset',
            name: 'FA_FixedAsset',
            component: FA_FixedAsset_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_Analysis',
            name: 'FA_Analysis',
            component: FA_Analysis_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_Location',
            name: 'FA_Location',
            component: FA_Location_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_Group',
            name: 'FA_Group',
            component: FA_Group_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_SubportfolioAssetClassMaintenance',
            name: 'FA_SubportfolioAssetClassMaintenance',
            component: FA_SubportfolioAssetClassMaintenance_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_Revaluation',
            name: 'FA_Revaluation',
            component: FA_Revaluation_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_LocationSearch',
            name: 'FA_LocationSearch',
            component: FA_LocationSearch_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_PostingDepreciation',
            name: 'FA_PostingDepreciation',
            component: FA_PostingDepreciation_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_DepreciationScheduleMaintCommercial',
            name: 'FA_DepreciationScheduleMaintCommercial',
            component: FA_DepreciationScheduleMaintCommercial_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_DepreciationScheduleMaintFiscal',
            name: 'FA_DepreciationScheduleMaintFiscal',
            component: FA_DepreciationScheduleMaintFiscal_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_TempNonDeprPosting',
            name: 'FA_TempNonDeprPosting',
            component: FA_TempNonDeprPosting_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_AssignAssetClassToSubPortfolio',
            name: 'FA_AssignAssetClassToSubPortfolio',
            component: FA_AssignAssetClassToSubPortfolio_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_TempNonDeprAssetMaint',
            name: 'FA_TempNonDeprAssetMaint',
            component: FA_TempNonDeprAssetMaint_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_Class',
            name: 'FA_Class',
            component: FA_Class_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_GenerateDepreciation',
            name: 'FA_GenerateDepreciation',
            component: FA_GenerateDepreciation_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_RegistrationPrefix',
            name: 'FA_RegistrationPrefix',
            component: FA_RegistrationPrefix_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_Specification',
            name: 'FA_Specification',
            component: FA_Specification_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_NonDeprAsset',
            name: 'FA_NonDeprAsset',
            component: FA_NonDeprAsset_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_NonDepreciableAnalysis',
            name: 'FA_NonDepreciableAnalysis',
            component: FA_NonDepreciableAnalysis_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_Transfer',
            name: 'FA_Transfer',
            component: FA_Transfer_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_NonDepreciableAssetGroup',
            name: 'FA_NonDepreciableAssetGroup',
            component: FA_NonDepreciableAssetGroup_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_PrintBarcode',
            name: 'FA_PrintBarcode',
            component: FA_PrintBarcode_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_ChangeNonDepreciableAssetCd',
            name: 'FA_ChangeNonDepreciableAssetCd',
            component: FA_ChangeNonDepreciableAssetCd_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_ChangeAssetID',
            name: 'FA_ChangeAssetID',
            component: FA_ChangeAssetID_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_TerminateDeprSchedule',
            name: 'FA_TerminateDeprSchedule',
            component: FA_TerminateDeprSchedule_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_DepreciationReschedule',
            name: 'FA_DepreciationReschedule',
            component: FA_DepreciationReschedule_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_ManualDepreciationConfirmation',
            name: 'FA_ManualDepreciationConfirmation',
            component: FA_ManualDepreciationConfirmation_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_ManualDepreciationSchedule',
            name: 'FA_ManualDepreciationSchedule',
            component: FA_ManualDepreciationSchedule_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_RequisitionApproval',
            name: 'FA_RequisitionApproval',
            component: FA_RequisitionApproval_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_TransactionTypeMaster',
            name: 'FA_TransactionTypeMaster',
            component: FA_TransactionTypeMaster_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_CloseAssetInProgress',
            name: 'FA_CloseAssetInProgress',
            component: FA_CloseAssetInProgress_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_CalculateBookValue',
            name: 'FA_CalculateBookValue',
            component: FA_CalculateBookValue_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/FA/FA_AssetInProgressReclass',
            name: 'FA_AssetInProgressReclass',
            component: FA_AssetInProgressReclass_Master,
            meta: {
                requiresAuth: true
            }
        }
    ]
}