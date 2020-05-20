import ADM_UserManagement from '@/views/ADM/ADM_UserManagement/ADM_UserManagement'
import ADM_ViewUserManagement from '@/views/ADM/ADM_UserManagement/ADM_ViewUserManagement'
import ADM_AddUserManagement from '@/views/ADM/ADM_UserManagement/ADM_AddUserManagement'
import ADM_GroupManagement from '@/views/ADM/ADM_GroupManagement/ADM_GroupManagement'
import ADM_AddGroupManagement from '@/views/ADM/ADM_GroupManagement/ADM_AddGroupManagement'
import ADM_FleetManagement from '@/views/ADM/ADM_FleetManagement/ADM_FleetManagement'

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
            path: '/ADM/ADM_FleetManagement',
            name: 'ADM_FleetManagement',
            component: ADM_FleetManagement,
            meta: {
                requiresAuth: true
            }
        },
    ]
}