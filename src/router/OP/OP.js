import OP_BookingEntry from '@/views/OP/OP_BookingEntry/OP_BookingEntry'
import OP_AddBookingEntry from '@/views/OP/OP_BookingEntry/OP_AddBookingEntry'
import OP_ViewBookingEntry from '@/views/OP/OP_BookingEntry/OP_ViewBookingEntry'

export const OPRender = {
    path: '/OP',
    component: {
        render(c) {
            return c('router-view')
        }
    },
    children: [{
            path: '/OP/OP_BookingEntry',
            name: 'OP_BookingEntry',
            component: OP_BookingEntry,
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