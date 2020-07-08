import CM_CustomerStatus from '@/views/CM/CM_CustomerStatus/CM_CustomerStatus'
import CM_AddCustomerStatus from '@/views/CM/CM_CustomerStatus/CM_AddCustomerStatus'

import CM_MarketingMaster from '@/views/CM/CM_MarketingMaster/CM_MarketingMaster'
import CM_MarketingMasterForm from '@/views/CM/CM_MarketingMaster/MK_MarketingMasterForm'
import CM_MarketingMasterView from '@/views/CM/CM_MarketingMaster/MK_MarketingMasterView'
import CM_MarketingMaster_Target from '@/views/CM/CM_MarketingMaster/CM_MarketingMaster_Target'
import CM_MarketingMaster_AddTarget from '@/views/CM/CM_MarketingMaster/CM_MarketingMaster_AddTarget'
import CM_Dashboard from '@/views/Dashboard/CM_Dashboard'
import CM_MarketingMaster_Team from '@/views/CM/CM_MarketingMaster/CM_MarketingMaster_Team'
import CM_MarketingMaster_CustomerList from '@/views/CM/CM_MarketingMaster/CM_MarketingMaster_CustomerList'

import CM_MarketingCustomerStatus from '@/views/CM/CM_MarketingCustomerStatus/CM_MarketingCustomerStatus'
import CM_MarketingCustomerStatus_add from '@/views/CM/CM_MarketingCustomerStatus/CM_AddMarketingCustomerStatus'

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
            path: '/CM/CM_MarketingMaster/Form',
            name: 'CM_MarketingMasterForm',
            component: CM_MarketingMasterForm,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/CM/CM_MarketingMaster/View',
            name: 'CM_MarketingMasterView',
            component: CM_MarketingMasterView,
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

        {
            path: '/CM/CM_MarketingCustomerStatus',
            name: 'CM_MarketingCustomerStatus',
            component: CM_MarketingCustomerStatus,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/CM/CM_MarketingCustomerStatus/Add',
            name: 'CM_MarketingCustomerStatus_Add',
            component: CM_MarketingCustomerStatus_add,
            meta: {
                requiresAuth: true
            }
        },
    ]
}