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

//Fleet Type
import OP_FleetType from '@/views/OP/OP_FleetType/OP_FleetTypeList'
import OP_FleetTypeForm from '@/views/OP/OP_FleetType/OP_FleetTypeForm'

// Fleet Carosery
import OP_FleetCarosery from '@/views/OP/OP_FleetCarosery/OP_FleetCaroseryList'
import OP_FleetCaroseryForm from '@/views/OP/OP_FleetCarosery/OP_FleetCaroseryForm'

// Ticket Category
import OP_TicketCategory from '@/views/OP/OP_TicketCategory/OP_TicketCategoryList'
import OP_TicketCategoryForm from '@/views/OP/OP_TicketCategory/OP_TicketCategoryForm'

//Fleet Master
import OP_FleetMaster from '@/views/OP/OP_FleetMaster/OP_FleetMasterList'
// import OP_FleetMasterView from '@/views/OP/OP_FleetMaster/OP_FleetMasterView'
import OP_FleetMasterForm from '@/views/OP/OP_FleetMaster/OP_FleetMasterForm'

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
    {
        path: '/OP/OP_FleetType',
        name: 'OP_FleetType',
        component: OP_FleetType,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/OP/OP_FleetType/Form',
        name: 'OP_FleetTypeForm',
        component: OP_FleetTypeForm,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/OP/OP_FleetCarosery',
        name: 'OP_FleetCarosery',
        component: OP_FleetCarosery,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/OP/OP_FleetCarosery/Form',
        name: 'OP_FleetCaroseryForm',
        component: OP_FleetCaroseryForm,
        meta: {
            requiresAuth: true
        }
    },

    {
        path: '/OP/OP_TicketCategory',
        name: 'OP_TicketCategory',
        component: OP_TicketCategory,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/OP/OP_TicketCategory/Form',
        name: 'OP_TicketCategoryForm',
        component: OP_TicketCategoryForm,
        meta: {
            requiresAuth: true
        }
    },

    {
        path: '/OP/OP_FleetMaster',
        name: 'OP_FleetMaster',
        component: OP_FleetMaster,
        meta: {
            requiresAuth: true
        }
    },
    // {
    //     path: '/OP/OP_FleetMaster/View',
    //     name: 'OP_FleetMasterView',
    //     component: OP_FleetMasterView,
    //     meta: {
    //         requiresAuth: true
    //     }
    // },
    {
        path: '/OP/OP_FleetMaster/Form',
        name: 'OP_FleetMasterForm',
        component: OP_FleetMasterForm,
        meta: {
            requiresAuth: true
        }
    },
    ]
}