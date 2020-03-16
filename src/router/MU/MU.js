import MU_SplitMeterCharges_Master from  '@/views/MU/MU_SplitMeterCharges/MU_SplitMeterCharges_Master'
import MU_MeterCodeGenerator_Master from  '@/views/MU/MU_MeterCodeGenerator/MU_MeterCodeGenerator_Master'
import MU_MeterTypeSetup_Master from  '@/views/MU/MU_MeterTypeSetup/MU_MeterTypeSetup_Master'
import MU_CopyMeterFormula_Master from  '@/views/MU/MU_CopyMeterFormula/MU_CopyMeterFormula_Master'
import MU_MeterFormulaConfirmation_Master from  '@/views/MU/MU_MeterFormulaConfirmation/MU_MeterFormulaConfirmation_Master'
import MU_MeterFormulaSetup_Master from  '@/views/MU/MU_MeterFormulaSetup/MU_MeterFormulaSetup_Master'
import MU_CopyMeterClass_Master from  '@/views/MU/MU_CopyMeterClass/MU_CopyMeterClass_Master'
import MU_MeterClassConfirmation_Master from  '@/views/MU/MU_MeterClassConfirmation/MU_MeterClassConfirmation_Master'
import MU_MeterClassSetup_Master from  '@/views/MU/MU_MeterClassSetup/MU_MeterClassSetup_Master'
import MU_MeterComponentSetup_Master from  '@/views/MU/MU_MeterComponentSetup/MU_MeterComponentSetup_Master'
import MU_MeterCategorySetup_Master from  '@/views/MU/MU_MeterCategorySetup/MU_MeterCategorySetup_Master'
import MU_MeterUsageAfterPostingInquiry_Master from  '@/views/MU/MU_MeterUsageAfterPostingInquiry/MU_MeterUsageAfterPostingInquiry_Master'
import MU_MeterUsageBeforePostingInquiry_Master from  '@/views/MU/MU_MeterUsageBeforePostingInquiry/MU_MeterUsageBeforePostingInquiry_Master'
import MU_MeterUsagePosting_Master from  '@/views/MU/MU_MeterUsagePosting/MU_MeterUsagePosting_Master'
import MU_MeterReadingEntry_Master from  '@/views/MU/MU_MeterReadingEntry/MU_MeterReadingEntry_Master'
import MU_OvertimeChargePosting_Master from  '@/views/MU/MU_OvertimeChargePosting/MU_OvertimeChargePosting_Master'
import MU_OvertimeEntry_Master from  '@/views/MU/MU_OvertimeEntry/MU_OvertimeEntry_Master'
import MU_CancelMeterReading_Master from  '@/views/MU/MU_CancelMeterReading/MU_CancelMeterReading_Master'
import MU_Specification_Master from  '@/views/MU/MU_Specification/MU_Specification_Master'
import MU_MeterReadingConfirmationNew_Master from  '@/views/MU/MU_MeterReadingConfirmationNew/MU_MeterReadingConfirmationNew_Master'
import MU_MeterReadingUnconfirmationNew_Master from  '@/views/MU/MU_MeterReadingUnconfirmationNew/MU_MeterReadingUnconfirmationNew_Master'
import MU_PostingBatch_Master from  '@/views/MU/MU_PostingBatch/MU_PostingBatch_Master'
import MU_BatchMeter_Master from  '@/views/MU/MU_BatchMeter/MU_BatchMeter_Master'
import MU_ClosingBatch_Master from  '@/views/MU/MU_ClosingBatch/MU_ClosingBatch_Master'
import MU_ActualPaymentMeter_Master from  '@/views/MU/MU_ActualPaymentMeter/MU_ActualPaymentMeter_Master'
import MU_GenerateMeterInternal_Master from  '@/views/MU/MU_GenerateMeterInternal/MU_GenerateMeterInternal_Master'
import MU_DigitalMeter_Master from  '@/views/MU/MU_DigitalMeter/MU_DigitalMeter_Master'
import MU_MeterReadingCheck_Master from  '@/views/MU/MU_MeterReadingCheck/MU_MeterReadingCheck_Master'
import MU_MobileMenu_Master from  '@/views/MU/MU_MobileMenu/MU_MobileMenu_Master'


export const MURender = {
    path: '/MU',
    component: {
      render (c) { return c('router-view') }
    },
    children: [
        {
            path: '/MU/MU_SplitMeterCharges',
            name: 'MU_SplitMeterCharges',
            component: MU_SplitMeterCharges_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_MeterCodeGenerator',
            name: 'MU_MeterCodeGenerator',
            component: MU_MeterCodeGenerator_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_MeterTypeSetup',
            name: 'MU_MeterTypeSetup',
            component: MU_MeterTypeSetup_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_CopyMeterFormula',
            name: 'MU_CopyMeterFormula',
            component: MU_CopyMeterFormula_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_MeterFormulaConfirmation',
            name: 'MU_MeterFormulaConfirmation',
            component: MU_MeterFormulaConfirmation_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_MeterFormulaSetup',
            name: 'MU_MeterFormulaSetup',
            component: MU_MeterFormulaSetup_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_CopyMeterClass',
            name: 'MU_CopyMeterClass',
            component: MU_CopyMeterClass_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_MeterClassConfirmation',
            name: 'MU_MeterClassConfirmation',
            component: MU_MeterClassConfirmation_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_MeterClassSetup',
            name: 'MU_MeterClassSetup',
            component: MU_MeterClassSetup_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_MeterComponentSetup',
            name: 'MU_MeterComponentSetup',
            component: MU_MeterComponentSetup_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_MeterCategorySetup',
            name: 'MU_MeterCategorySetup',
            component: MU_MeterCategorySetup_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_MeterUsageAfterPostingInquiry',
            name: 'MU_MeterUsageAfterPostingInquiry',
            component: MU_MeterUsageAfterPostingInquiry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_MeterUsageBeforePostingInquiry',
            name: 'MU_MeterUsageBeforePostingInquiry',
            component: MU_MeterUsageBeforePostingInquiry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_MeterUsagePosting',
            name: 'MU_MeterUsagePosting',
            component: MU_MeterUsagePosting_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_MeterReadingEntry',
            name: 'MU_MeterReadingEntry',
            component: MU_MeterReadingEntry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_OvertimeChargePosting',
            name: 'MU_OvertimeChargePosting',
            component: MU_OvertimeChargePosting_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_OvertimeEntry',
            name: 'MU_OvertimeEntry',
            component: MU_OvertimeEntry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_CancelMeterReading',
            name: 'MU_CancelMeterReading',
            component: MU_CancelMeterReading_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_Specification',
            name: 'MU_Specification',
            component: MU_Specification_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_MeterReadingConfirmationNew',
            name: 'MU_MeterReadingConfirmationNew',
            component: MU_MeterReadingConfirmationNew_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_MeterReadingUnconfirmationNew',
            name: 'MU_MeterReadingUnconfirmationNew',
            component: MU_MeterReadingUnconfirmationNew_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_PostingBatch',
            name: 'MU_PostingBatch',
            component: MU_PostingBatch_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_BatchMeter',
            name: 'MU_BatchMeter',
            component: MU_BatchMeter_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_ClosingBatch',
            name: 'MU_ClosingBatch',
            component: MU_ClosingBatch_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_ActualPaymentMeter',
            name: 'MU_ActualPaymentMeter',
            component: MU_ActualPaymentMeter_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_GenerateMeterInternal',
            name: 'MU_GenerateMeterInternal',
            component: MU_GenerateMeterInternal_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_DigitalMeter',
            name: 'MU_DigitalMeter',
            component: MU_DigitalMeter_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_MeterReadingCheck',
            name: 'MU_MeterReadingCheck',
            component: MU_MeterReadingCheck_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/MU/MU_MobileMenu',
            name: 'MU_MobileMenu',
            component: MU_MobileMenu_Master,
            meta: {
                requiresAuth: true
            }
        }
    ]
}