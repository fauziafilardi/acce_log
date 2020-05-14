import ADM_UserManagement from '@/views/ADM/ADM_UserManagement/ADM_UserManagement'
import ADM_AddUserManagement from '@/views/ADM/ADM_UserManagement/ADM_AddUserManagement'

export const ADMRender = {
    path: '/ADM',
    component: {
        render(c) {
            return c('router-view')
        }
    },
    children: [
        {
            path: '/ADM/ADM_UserManagement',
            name: 'ADM_UserManagement',
            component: ADM_UserManagement,
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
    ]
}