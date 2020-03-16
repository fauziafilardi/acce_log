// import BG_ViewBudgetUsage_Master from  '@/views/BG/BG_ViewBudgetUsage/BG_ViewBudgetUsage_Master'
import BG_ViewBudgetUsage from  '@/views/BG/BG_ViewBudgetUsage1/BG_ViewBudgetUsage'
// import BG_AssignBudgetToUser_Master from  '@/views/BG/BG_AssignBudgetToUser/BG_AssignBudgetToUser_Master'
// import BG_BudgetMaster_Master from  '@/views/BG/BG_BudgetMaster/BG_BudgetMaster_Master'
// import BG_BudgetEntry_Master from  '@/views/BG/BG_BudgetEntry/BG_BudgetEntry_Master'
// import BG_BudgetMasterActivation_Master from  '@/views/BG/BG_BudgetMasterActivation/BG_BudgetMasterActivation_Master'
// import BG_BudgetMasterCancellation_Master from  '@/views/BG/BG_BudgetMasterCancellation/BG_BudgetMasterCancellation_Master'
// import BG_BudgetMasterTermination_Master from  '@/views/BG/BG_BudgetMasterTermination/BG_BudgetMasterTermination_Master'
// import BG_Specification_Master from  '@/views/BG/BG_Specification/BG_Specification_Master'
// import BG_PostBudgetEntry_Master from  '@/views/BG/BG_PostBudgetEntry/BG_PostBudgetEntry_Master'
// import BG_BudgetOwnerApproval_Master from  '@/views/BG/BG_BudgetOwnerApproval/BG_BudgetOwnerApproval_Master'
// import BG_BudgetAnalysis_Master from  '@/views/BG/BG_BudgetAnalysis/BG_BudgetAnalysis_Master'
// import BG_SubportfolioSpecification_Master from  '@/views/BG/BG_SubportfolioSpecification/BG_SubportfolioSpecification_Master'


export const BGRender = {
    path: '/BG',
    component: {
      render (c) { return c('router-view') }
    },
    children: [
        // {
        //     path: '/BG/BG_ViewBudgetUsage',
        //     name: 'BG_ViewBudgetUsage',
        //     component: BG_ViewBudgetUsage_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // },

        {
            path: '/BG/BG_ViewBudgetUsage',
            name: 'BG_ViewBudgetUsage',
            component: BG_ViewBudgetUsage,
            meta: {
                requiresAuth: true
            }
        }
        
        // ,
        // {
        //     path: '/BG/BG_AssignBudgetToUser',
        //     name: 'BG_AssignBudgetToUser',
        //     component: BG_AssignBudgetToUser_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/BG/BG_BudgetMaster',
        //     name: 'BG_BudgetMaster',
        //     component: BG_BudgetMaster_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/BG/BG_BudgetEntry',
        //     name: 'BG_BudgetEntry',
        //     component: BG_BudgetEntry_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/BG/BG_BudgetMasterActivation',
        //     name: 'BG_BudgetMasterActivation',
        //     component: BG_BudgetMasterActivation_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/BG/BG_BudgetMasterCancellation',
        //     name: 'BG_BudgetMasterCancellation',
        //     component: BG_BudgetMasterCancellation_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/BG/BG_BudgetMasterTermination',
        //     name: 'BG_BudgetMasterTermination',
        //     component: BG_BudgetMasterTermination_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/BG/BG_Specification',
        //     name: 'BG_Specification',
        //     component: BG_Specification_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/BG/BG_PostBudgetEntry',
        //     name: 'BG_PostBudgetEntry',
        //     component: BG_PostBudgetEntry_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/BG/BG_BudgetOwnerApproval',
        //     name: 'BG_BudgetOwnerApproval',
        //     component: BG_BudgetOwnerApproval_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/BG/BG_BudgetAnalysis',
        //     name: 'BG_BudgetAnalysis',
        //     component: BG_BudgetAnalysis_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/BG/BG_SubportfolioSpecification',
        //     name: 'BG_SubportfolioSpecification',
        //     component: BG_SubportfolioSpecification_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
    ]
}