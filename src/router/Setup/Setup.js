import MK_Setup from '@/views/Setup/MK_Setup'
import OP_Setup from '@/views/Setup/OP_Setup'

export const SetupRender = {
    path: '',
    component: {
        render(c) {
            return c('router-view')
        }
    },
    children: [
        {
            path: '/MK_Setup',
            name: 'MK_Setup',
            component: MK_Setup,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP_Setup',
            name: 'OP_Setup',
            component: OP_Setup,
            meta: {
                requiresAuth: true
            }
        },
    ]
}