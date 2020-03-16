import PM_FollowUpStatus_Master from  '@/views/PM/PM_FollowUpStatus/PM_FollowUpStatus_Master'
import PM_FollowUpType_Master from  '@/views/PM/PM_FollowUpType/PM_FollowUpType_Master'
import PM_FollowUpInquiry_Master from  '@/views/PM/PM_FollowUpInquiry/PM_FollowUpInquiry_Master'
import PM_FollowUpEntry_Master from  '@/views/PM/PM_FollowUpEntry/PM_FollowUpEntry_Master'
import PM_ProspectSearch_Master from  '@/views/PM/PM_ProspectSearch/PM_ProspectSearch_Master'
import PM_LotSearch_Master from  '@/views/PM/PM_LotSearch/PM_LotSearch_Master'
import PM_ProspectEntry_Master from  '@/views/PM/PM_ProspectEntry/PM_ProspectEntry_Master'
import PM_CompetitorMaster_Master from  '@/views/PM/PM_CompetitorMaster/PM_CompetitorMaster_Master'
import PM_TenantCandidateMaintenance_Master from  '@/views/PM/PM_TenantCandidateMaintenance/PM_TenantCandidateMaintenance_Master'
import PM_ExpiryLotSearch_Master from  '@/views/PM/PM_ExpiryLotSearch/PM_ExpiryLotSearch_Master'
import PM_TenantCandidateConfirmation_Master from  '@/views/PM/PM_TenantCandidateConfirmation/PM_TenantCandidateConfirmation_Master'
import PM_ProspectSearch_Master from  '@/views/PM/PM_ProspectSearch/PM_ProspectSearch_Master'


export const PMRender = {
    path: '/PM',
    component: {
      render (c) { return c('router-view') }
    },
    children: [
        {
            path: '/PM/PM_FollowUpStatus',
            name: 'PM_FollowUpStatus',
            component: PM_FollowUpStatus_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/PM/PM_FollowUpType',
            name: 'PM_FollowUpType',
            component: PM_FollowUpType_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/PM/PM_FollowUpInquiry',
            name: 'PM_FollowUpInquiry',
            component: PM_FollowUpInquiry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/PM/PM_FollowUpEntry',
            name: 'PM_FollowUpEntry',
            component: PM_FollowUpEntry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/PM/PM_ProspectSearch',
            name: 'PM_ProspectSearch',
            component: PM_ProspectSearch_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/PM/PM_LotSearch',
            name: 'PM_LotSearch',
            component: PM_LotSearch_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/PM/PM_ProspectEntry',
            name: 'PM_ProspectEntry',
            component: PM_ProspectEntry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/PM/PM_CompetitorMaster',
            name: 'PM_CompetitorMaster',
            component: PM_CompetitorMaster_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/PM/PM_TenantCandidateMaintenance',
            name: 'PM_TenantCandidateMaintenance',
            component: PM_TenantCandidateMaintenance_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/PM/PM_ExpiryLotSearch',
            name: 'PM_ExpiryLotSearch',
            component: PM_ExpiryLotSearch_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/PM/PM_TenantCandidateConfirmation',
            name: 'PM_TenantCandidateConfirmation',
            component: PM_TenantCandidateConfirmation_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/PM/PM_ProspectSearch',
            name: 'PM_ProspectSearch',
            component: PM_ProspectSearch_Master,
            meta: {
                requiresAuth: true
            }
        }
    ]
}