import ADM_UserManagement from '@/views/ADM/ADM_UserManagement/ADM_UserManagement'
import ADM_ViewUserManagement from '@/views/ADM/ADM_UserManagement/ADM_ViewUserManagement'
import ADM_AddUserManagement from '@/views/ADM/ADM_UserManagement/ADM_AddUserManagement'
import ADM_GroupManagement from '@/views/ADM/ADM_GroupManagement/ADM_GroupManagement'
import ADM_AddGroupManagement from '@/views/ADM/ADM_GroupManagement/ADM_AddGroupManagement'
import ADM_DriverManagement from '@/views/ADM/ADM_DriverManagement/ADM_DriverManagement'
import ADM_ViewDriverManagement from '@/views/ADM/ADM_DriverManagement/ADM_ViewDriverManagement'
import ADM_FleetType from '@/views/ADM/ADM_FleetType/ADM_FleetType'
import ADM_FleetManagement from '@/views/ADM/ADM_FleetManagement/ADM_FleetManagement'
import ADM_AddFleetManagement from '@/views/ADM/ADM_FleetManagement/ADM_AddFleetManagement'

export const ADMRender = {
    path: '/ADM',
    component: {
        render(c) {
            return c('router-view')
        }
    },
    children: [{
        path: '/ADM/ADM_UserManagement',
        name: 'ADM_UserManagement',
        component: ADM_UserManagement,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/ADM/ADM_ViewUserManagement',
        name: 'ADM_ViewUserManagement',
        component: ADM_ViewUserManagement,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/ADM/ADM_UserManagement/Form',
        name: 'ADM_AddUserManagement',
        component: ADM_AddUserManagement,
        meta: {
            requiresAuth: true
        }
    },

    {
        path: '/ADM/ADM_GroupManagement',
        name: 'ADM_GroupManagement',
        component: ADM_GroupManagement,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/ADM/ADM_GroupManagement/Form',
        name: 'ADM_AddGroupManagement',
        component: ADM_AddGroupManagement,
        meta: {
            requiresAuth: true
        }
    },

    {
        path: '/ADM/ADM_FleetType',
        name: 'ADM_FleetType',
        component: ADM_FleetType,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/ADM/ADM_DriverManagement',
        name: 'ADM_DriverManagement',
        component: ADM_DriverManagement,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/ADM/ADM_ViewDriverManagement',
        name: 'ADM_ViewDriverManagement',
        component: ADM_ViewDriverManagement,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/ADM/ADM_FleetManagement',
        name: 'ADM_FleetManagement',
        component: ADM_FleetManagement,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/ADM/ADM_FleetManagement/Form',
        name: 'ADM_AddFleetManagement',
        component: ADM_AddFleetManagement,
        meta: {
            requiresAuth: true
        }
    },
    ]
}