import ADM_UserManagement from '@/views/ADM/ADM_UserManagement/ADM_UserManagement'
import ADM_ViewUserManagement from '@/views/ADM/ADM_UserManagement/ADM_ViewUserManagement'
import ADM_AddUserManagement from '@/views/ADM/ADM_UserManagement/ADM_AddUserManagement'
import ADM_FleetType from '@/views/ADM/ADM_FleetType/ADM_FleetType'



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
            path: '/ADM/ADM_FleetType',
            name: 'ADM_FleetType',
            component: ADM_FleetType,
            meta: {
                requiresAuth: true
            }
        },
    ]
}