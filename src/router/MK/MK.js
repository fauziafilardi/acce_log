import MK_Specification_Master from '@/views/MK/MK_Specification/MK_Specification_Master'
import MK_MarketingGroup_Master from '@/views/MK/MK_MarketingGroup/MK_MarketingGroup_Master'
import MK_Marketing_Master from '@/views/MK/MK_Marketing/MK_Marketing_Master'
import MK_FollowUpType_Master from '@/views/MK/MK_FollowUpType/MK_FollowUpType_Master'
// import MK_MarketingAssigment_Master from '@/views/MK/MK_MarketingAssigment/MK_MarketingAssigment_Master'
import MK_GenerateScheduleCustomer_Master from '@/views/MK/MK_GenerateScheduleCustomer/PageLevel_1/MK_GenerateScheduleCustomer'
import MK_MarketingActivitySchedule_Master from '@/views/MK/MK_MarketingActivitySchedule/MK_MarketingActivitySchedule_Master'
import MK_LogBook_Master from '@/views/MK/MK_LogBook/MK_LogBook_Master'

import MK_LogBookTest_Master from '@/views/MK/MK_LogBookTest/MK_LogBookTest_Master'
import MK_QuotationTest_Master from '@/views/MK/MK_QuotationTest/MK_QuotationTest_Master'

import MK_Quotation_Master from '@/views/MK/MK_Quotation/MK_Quotation_Master'

import MK_ContactMaster from '@/views/MK/MK_Contact/MK_Contact_Master'
import MK_MarketingAssigmentMaster from '@/views/MK/MK_MarketingAssigment/PageLevel_1/MK_MarketingAssigment'
// import MK_MarketingAssigmentMaster from '@/views/MK/MK_MarketingAssigment/MK_MarketingAssigment_Master'
import MK_ContactStatus_Master from '@/views/MK/MK_ContactStatus/MK_ContactStatus_Master' 
import MK_ContactStatus from '@/views/MK/MK_ContactStatus/MK_ContactStatus_Master'

import MK_CustomerRequest_Master from '@/views/MK/MK_CustomerRequest/MK_CustomerRequest_Master'

import MK_LogBook_List from '@/views/MK/MK_LogBook_Mobile/MK_LogBook_List'
import MK_LogBook_Header from '@/views/MK/MK_LogBook_Mobile/MK_LogBook_Header'
import MK_LogBook_Detail from '@/views/MK/MK_LogBook_Mobile/MK_LogBook_Detail'
import MK_LogBook_List2 from '@/views/MK/MK_LogBook_Mobile/MK_LogBook_List2'
import MK_LogBook_Edit from '@/views/MK/MK_LogBook_Mobile/MK_LogBook_Edit'
import MK_LogBook_New from '@/views/MK/MK_LogBook_Mobile/MK_LogBook_New'
import MK_LogBook_New2 from '@/views/MK/MK_LogBook_Mobile/MK_LogBook_New2'

import MK_NewProspect from '@/views/MK/MK_NewProspect/MK_NewProspect'
import MK_AddNewProspect from '@/views/MK/MK_NewProspect/MK_AddNewProspect'
import MK_ViewNewProspect from '@/views/MK/MK_NewProspect/MK_ViewNewProspect'

import MK_Appointment from '@/views/MK/MK_Appointment/MK_Appointment'
import MK_AddAppointment from '@/views/MK/MK_Appointment/MK_AddAppointment'


export const MKRender = {
    path: '/MK',
    component: {
      render (c) { return c('router-view') }
    },
    children: [
        {
            path: '/MK/MK_Specification',
            name: 'MK_Specification',
            component: MK_Specification_Master,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/MK/MK_MarketingGroup',
            name: 'MK_MarketingGroup',
            component: MK_MarketingGroup_Master,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/MK/MK_Marketing',
            name: 'MK_Marketing',
            component: MK_Marketing_Master,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/MK/MK_FollowUpType',
            name: 'MK_FollowUpType',
            component: MK_FollowUpType_Master,
            meta: {
                requiresAuth: true
            }
        },
        // {
        //     path: '/MK/MK_MarketingAssigment',
        //     name: 'MK_MarketingAssigment',
        //     component: MK_MarketingAssigment_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // },
        {
            path: '/MK/MK_GenerateScheduleCustomer',
            name: 'MK_GenerateScheduleCustomer',
            component: MK_GenerateScheduleCustomer_Master,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/MK/MK_MarketingActivitySchedule',
            name: 'MK_MarketingActivitySchedule',
            component: MK_MarketingActivitySchedule_Master,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/MK/MK_LogBook',
            name: 'MK_LogBook',
            component: MK_LogBook_Master,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/MK/MK_LogBookTest',
            name: 'MK_LogBookTest',
            component: MK_LogBookTest_Master,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/MK/MK_QuotationTest',
            name: 'MK_QuotationTest',
            component: MK_QuotationTest_Master,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/MK/MK_Quotation',
            name: 'MK_Quotation',
            component: MK_Quotation_Master,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/MK/MK_Contact',
            name: 'MK_Contact',
            component: MK_ContactMaster,
            meta: {
                requiresAuth: true
            }
        }
        ,{
            path: '/MK/MK_MarketingAssigment',
            name: 'MK_MarketingAssigment',
            component: MK_MarketingAssigmentMaster,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/MK/MK_ContactStatus',
            name: 'MK_ContactStatus',
            component: MK_ContactStatus_Master,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/MK/MK_CustomerRequest',
            name: 'MK_CustomerRequest',
            component: MK_CustomerRequest_Master,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/MK/MK_LogBook_List',
            name: 'MK_LogBook_List',
            component: MK_LogBook_List,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/MK/MK_LogBook_Header',
            name: 'MK_LogBook_Header',
            component: MK_LogBook_Header,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/MK/MK_LogBook_Detail',
            name: 'MK_LogBook_Detail',
            component: MK_LogBook_Detail,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/MK/MK_LogBook_List2',
            name: 'MK_LogBook_List2',
            component: MK_LogBook_List2,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/MK/MK_LogBook_Edit',
            name: 'MK_LogBook_Edit',
            component: MK_LogBook_Edit,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/MK/MK_LogBook_New',
            name: 'MK_LogBook_New',
            component: MK_LogBook_New,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/MK/MK_LogBook_New2',
            name: 'MK_LogBook_New2',
            component: MK_LogBook_New2,
            meta: {
                requiresAuth: true
            }
        },

        {
            path: '/MK/MK_NewProspect',
            name: 'MK_NewProspect',
            component: MK_NewProspect,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/MK/MK_NewProspect/Form',
            name: 'MK_AddNewProspect',
            component: MK_AddNewProspect,
            meta: {
                requiresAuth: true
            },
        },
        {
            path: '/MK/MK_NewProspect/View',
            name: 'MK_ViewNewProspect',
            component: MK_ViewNewProspect,
            meta: {
                requiresAuth: true
            },
        },

        {
            path: '/MK/MK_Appointment',
            name: 'MK_Appointment',
            component: MK_Appointment,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/MK/MK_Appointment/Form',
            name: 'MK_AddAppointment',
            component: MK_AddAppointment,
            meta: {
                requiresAuth: true
            }
        },
    ]
}