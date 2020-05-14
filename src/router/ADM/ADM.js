import ADM_UserManagement from '@/views/ADM/ADM_UserManagement/ADM_UserManagement'
<<<<<<< HEAD
import ADM_ViewUserManagement from '@/views/ADM/ADM_UserManagement/ADM_ViewUserManagement'
=======
import ADM_AddUserManagement from '@/views/ADM/ADM_UserManagement/ADM_AddUserManagement'
>>>>>>> 2512e69e7fa5dbd727cab842aa8cd5d516b0c4d3

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
<<<<<<< HEAD
            path: '/ADM/ADM_ViewUserManagement',
            name: 'ADM_ViewUserManagement',
            component: ADM_ViewUserManagement,
=======
            path: '/ADM/ADM_UserManagement/Form',
            name: 'ADM_AddUserManagement',
            component: ADM_AddUserManagement,
>>>>>>> 2512e69e7fa5dbd727cab842aa8cd5d516b0c4d3
            meta: {
                requiresAuth: true
            }
        },
    ]
}