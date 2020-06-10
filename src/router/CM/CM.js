import CM_CustomerStatus from '@/views/CM/CM_CustomerStatus/CM_CustomerStatus'
import CM_AddCustomerStatus from '@/views/CM/CM_CustomerStatus/CM_AddCustomerStatus'

import CM_MarketingMaster from '@/views/CM/CM_MarketingMaster/CM_MarketingMaster'
import CM_MarketingMaster_Target from '@/views/CM/CM_MarketingMaster/CM_MarketingMaster_Target'
import CM_MarketingMaster_AddTarget from '@/views/CM/CM_MarketingMaster/CM_MarketingMaster_AddTarget'
import CM_Dashboard from '@/views/Dashboard/CM_Dashboard'
import CM_MarketingMaster_Team from '@/views/CM/CM_MarketingMaster/CM_MarketingMaster_Team'
import CM_MarketingMaster_CustomerList from '@/views/CM/CM_MarketingMaster/CM_MarketingMaster_CustomerList'

export const CMRender = {
    path: '/CM',
    component: {
        render(c) { return c('router-view') }
    },
    children: [

        {
            path: '/CM/CM_CustomerStatus',
            name: 'CM_CustomerStatus',
            component: CM_CustomerStatus,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/CM/CM_CustomerStatus/Form',
            name: 'CM_AddCustomerStatus',
            component: CM_AddCustomerStatus,
            meta: {
                requiresAuth: true
            }
        },

        {
            path: '/CM/CM_MarketingMaster',
            name: 'CM_MarketingMaster',
            component: CM_MarketingMaster,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/CM/CM_MarketingMaster/Target',
            name: 'CM_MarketingMaster_Target',
            component: CM_MarketingMaster_Target,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/CM/CM_MarketingMaster/AddTarget',
            name: 'CM_MarketingMaster_AddTarget',
            component: CM_MarketingMaster_AddTarget,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/CM/CM_Dashboard',
            name: 'CM_Dashboard',
            component: CM_Dashboard,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/CM/CM_MarketingMaster/Team',
            name: 'CM_MarketingMaster_Team',
            component: CM_MarketingMaster_Team,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/CM/CM_MarketingMaster/CustomerList',
            name: 'CM_MarketingMaster_CustomerList',
            component: CM_MarketingMaster_CustomerList,
            meta: {
                requiresAuth: true
            }
        },
    ]
}