import CC_ComplaintType_Master from  '@/views/CC/CC_ComplaintType/CC_ComplaintType_Master'
import CC_ComplaintGroupEntry_Master from  '@/views/CC/CC_ComplaintGroupEntry/CC_ComplaintGroupEntry_Master'
import CC_Specification_Master from  '@/views/CC/CC_Specification/CC_Specification_Master'
import CC_ComplaintInquiry_Master from  '@/views/CC/CC_ComplaintInquiry/CC_ComplaintInquiry_Master'
import CC_ComplaintMonitoring_Master from  '@/views/CC/CC_ComplaintMonitoring/CC_ComplaintMonitoring_Master'
import CC_ComplaintEntry_Master from  '@/views/CC/CC_ComplaintEntry/CC_ComplaintEntry_Master'
import CC_ComplaintEntryAlt_Master from  '@/views/CC/CC_ComplaintEntryAlt/CC_ComplaintEntryAlt_Master'
import CC_ComplaintTypeAlt_Master from  '@/views/CC/CC_ComplaintTypeAlt/CC_ComplaintTypeAlt_Master'


export const CCRender = {
    path: '/CC',
    component: {
      render (c) { return c('router-view') }
    },
    children: [
        {
            path: '/CC/CC_ComplaintType',
            name: 'CC_ComplaintType',
            component: CC_ComplaintType_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CC/CC_ComplaintGroupEntry',
            name: 'CC_ComplaintGroupEntry',
            component: CC_ComplaintGroupEntry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CC/CC_Specification',
            name: 'CC_Specification',
            component: CC_Specification_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CC/CC_ComplaintInquiry',
            name: 'CC_ComplaintInquiry',
            component: CC_ComplaintInquiry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CC/CC_ComplaintMonitoring',
            name: 'CC_ComplaintMonitoring',
            component: CC_ComplaintMonitoring_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CC/CC_ComplaintEntry',
            name: 'CC_ComplaintEntry',
            component: CC_ComplaintEntry_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CC/CC_ComplaintEntryAlt',
            name: 'CC_ComplaintEntryAlt',
            component: CC_ComplaintEntryAlt_Master,
            meta: {
                requiresAuth: true
            }
        }
        
        ,
        {
            path: '/CC/CC_ComplaintTypeAlt',
            name: 'CC_ComplaintTypeAlt',
            component: CC_ComplaintTypeAlt_Master,
            meta: {
                requiresAuth: true
            }
        }
    ]
}