import MK_Setup from '@/views/Setup/MK_Setup'
import OP_Setup from '@/views/Setup/OP_Setup'
import OP_CostingSetup from '@/views/Setup/Costing_Setup'
import CM_Setup from '@/views/Setup/CM_Setup'

export const SetupRender = {
    path: '',
    component: {
        render(c) {
            return c('router-view')
        }
    },
    children: [
        {
            path: '/CM/CM_Setup',
            name: 'CM_Setup',
            component: CM_Setup,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/MK/MK_Setup',
            name: 'MK_Setup',
            component: MK_Setup,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_Setup',
            name: 'OP_Setup',
            component: OP_Setup,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/Costing_Setup',
            name: 'OP_CostingSetup',
            component: OP_CostingSetup,
            meta: {
                requiresAuth: true
            }
        },
    ]
}