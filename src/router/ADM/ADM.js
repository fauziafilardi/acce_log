import ADM_UserManagement from '@/views/ADM/ADM_UserManagement/ADM_UserManagement'
import ADM_ViewUserManagement from '@/views/ADM/ADM_UserManagement/ADM_ViewUserManagement'

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
    ]
}