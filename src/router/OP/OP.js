import OP_BookingEntry from '@/views/OP/OP_BookingEntry/OP_BookingEntry'
import OP_AddBookingEntry from '@/views/OP/OP_BookingEntry/OP_AddBookingEntry'
import OP_ViewBookingEntry from '@/views/OP/OP_BookingEntry/OP_ViewBookingEntry'
import OP_PlanExecution from '@/views/OP/OP_PlanExecution/OP_PlanExecution'
import OP_ViewPlanExecution from '@/views/OP/OP_PlanExecution/OP_ViewPlanExecution'

//Driver Management
import OP_DriverManagement from '@/views/OP/OP_DriverManagement/OP_DriverList'
import OP_DriverManagementView from '@/views/OP/OP_DriverManagement/OP_DriverView'
import OP_DriverManagementForm from '@/views/OP/OP_DriverManagement/OP_DriverForm'

//Fleet Brand
import OP_FleetBrand from '@/views/OP/OP_FleetBrand/OP_FleetBrandList'
import OP_FleetBrandView from '@/views/OP/OP_FleetBrand/OP_FleetBrandView'
import OP_FleetBrandForm from '@/views/OP/OP_FleetBrand/OP_FleetBrandForm'


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
    {
        path: '/OP/OP_PlanExecution',
        name: 'OP_PlanExecution',
        component: OP_PlanExecution,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/OP/OP_ViewPlanExecution',
        name: 'OP_ViewPlanExecution',
        component: OP_ViewPlanExecution,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/OP/OP_Driver',
        name: 'OP_DriverManagement',
        component: OP_DriverManagement,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/OP/OP_Driver/View',
        name: 'OP_DriverManagementView',
        component: OP_DriverManagementView,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/OP/OP_Driver/Form',
        name: 'OP_DriverManagementForm',
        component: OP_DriverManagementForm,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/OP/OP_FleetBrand',
        name: 'OP_FleetBrand',
        component: OP_FleetBrand,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/OP/OP_FleetBrand/View',
        name: 'OP_FleetBrandView',
        component: OP_FleetBrandView,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/OP/OP_FleetBrand/Form',
        name: 'OP_FleetBrandForm',
        component: OP_FleetBrandForm,
        meta: {
            requiresAuth: true
        }
    },
    ]
}