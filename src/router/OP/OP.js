import OP_Order from '@/views/OP/OP_Order/OP_Order'
import OP_AddBookingEntry from '@/views/OP/OP_Order/OP_AddBookingEntry'
import OP_ViewBookingEntry from '@/views/OP/OP_Order/OP_ViewBookingEntry'

export const OPRender = {
    path: '/OP',
    component: {
        render(c) {
            return c('router-view')
        }
    },
    children: [{
            path: '/OP/OP_Order',
            name: 'OP_Order',
            component: OP_Order,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_AddBookingEntry',
            name: 'OP_AddBookingEntry',
            component: OP_AddBookingEntry,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_ViewBookingEntry',
            name: 'OP_ViewBookingEntry',
            component: OP_ViewBookingEntry,
            meta: {
                requiresAuth: true
            }
        },
    ]
}