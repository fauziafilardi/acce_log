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
import OP_FleetMasterView from '@/views/OP/OP_FleetMaster/OP_FleetMasterView'
import OP_FleetMasterForm from '@/views/OP/OP_FleetMaster/OP_FleetMasterForm'
import OP_FleetMasterMaintenance from '@/views/OP/OP_FleetMaster/OP_FleetMasterMaintenance'

//Maintenance Type
import OP_MaintenanceType from '@/views/OP/OP_MaintenanceType/OP_MaintenanceTypeList'
import OP_MaintenanceTypeForm from '@/views/OP/OP_MaintenanceType/OP_MaintenanceTypeForm'
import OP_MaintenanceTypeView from '@/views/OP/OP_MaintenanceType/OP_MaintenanceTypeView'

//Maintenance Item
import OP_MaintenanceItem from '@/views/OP/OP_MaintenanceItem/OP_MaintenanceItemList'
import OP_MaintenanceItemForm from '@/views/OP/OP_MaintenanceItem/OP_MaintenanceItemForm'

//Standard Pricing & Costing
import OP_PricingCosting from '@/views/OP/OP_PricingCosting/OP_PricingCostingList'
import OP_PricingCostingFTL from '@/views/OP/OP_PricingCosting/OP_PricingCostingFTL'
import OP_PricingCostingLTL from '@/views/OP/OP_PricingCosting/OP_PricingCostingLTL'
import OP_PricingCostingView from '@/views/OP/OP_PricingCosting/OP_PricingCostingView'
import OP_PricingCostingFormDetail from '@/views/OP/OP_PricingCosting/OP_PricingCosting_op_pricing_costing_dtlForm'

//cost type
import OP_CostType from '@/views/OP/OP_CostType/OP_CostTypeList'
import OP_CostTypeForm from '@/views/OP/OP_CostType/OP_CostTypeForm'

// Zone
import OP_Zone from '@/views/OP/OP_Zone/OP_ZoneList'
import OP_ZoneForm from '@/views/OP/OP_Zone/OP_ZoneForm'

// Vendor Master
import OP_Vendor from '@/views/OP/OP_Vendor/OP_VendorList'
import OP_VendorForm from '@/views/OP/OP_Vendor/OP_VendorForm'
import OP_VendorView from '@/views/OP/OP_Vendor/OP_VendorView'
import OP_VendorLogBook from '@/views/OP/OP_Vendor/OP_Vendor_mk_logbookView'
import OP_VendorPIC from '@/views/OP/OP_Vendor/OP_Vendor_cm_contact_personForm'

// Field Clerk
import OP_FieldClerk from '@/views/OP/OP_FieldClerk/OP_FieldClerkList'
import OP_FieldClerkForm from '@/views/OP/OP_FieldClerk/OP_FieldClerkForm'
import OP_FieldClerkView from '@/views/OP/OP_FieldClerk/OP_FieldClerkView'
import OP_FieldClerkDtlForm from '@/views/OP/OP_FieldClerk/OP_FieldClerk_dtlForm.vue'

// OP_VendorGps
import OP_VendorGps from '@/views/OP/OP_VendorGps/OP_VendorGpsList'
import OP_VendorGpsForm from '@/views/OP/OP_VendorGps/OP_VendorGpsForm'

import OP_OrderForm from '@/views/OP/OP_Order/OP_OrderForm';

export const OPRender = {
    path: '/OP',
    component: {
        render(c) {
            return c('router-view')
        }
    },
    children: [
        {
            path: '/OP/OP_VendorGps',
            name: 'OP_VendorGps',
            component: OP_VendorGps,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_VendorGps/Form',
            name: 'OP_VendorGpsForm',
            component: OP_VendorGpsForm,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_FieldClerk',
            name: 'OP_FieldClerk',
            component: OP_FieldClerk,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_FieldClerk/Form',
            name: 'OP_FieldClerkForm',
            component: OP_FieldClerkForm,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_FieldClerk/View',
            name: 'OP_FieldClerkView',
            component: OP_FieldClerkView,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_FieldClerk/Address',
            name: 'OP_FieldClerkDtlForm',
            component: OP_FieldClerkDtlForm,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_Vendor',
            name: 'OP_Vendor',
            component: OP_Vendor,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_Vendor/LogBook',
            name: 'OP_VendorLogBook',
            component: OP_VendorLogBook,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_Vendor/Form',
            name: 'OP_VendorForm',
            component: OP_VendorForm,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_Vendor/PIC',
            name: 'OP_VendorPIC',
            component: OP_VendorPIC,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_Vendor/View',
            name: 'OP_VendorView',
            component: OP_VendorView,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_Zone',
            name: 'OP_Zone',
            component: OP_Zone,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_Zone/Form',
            name: 'OP_ZoneForm',
            component: OP_ZoneForm,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_CostType',
            name: 'OP_CostType',
            component: OP_CostType,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_CostType/Form',
            name: 'OP_CostTypeForm',
            component: OP_CostTypeForm,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_PricingCosting',
            name: 'OP_PricingCosting',
            component: OP_PricingCosting,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_PricingCosting/View',
            name: 'OP_PricingCostingView',
            component: OP_PricingCostingView,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_PricingCosting/FTL',
            name: 'OP_PricingCostingFTL',
            component: OP_PricingCostingFTL,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_PricingCosting/LTL',
            name: 'OP_PricingCostingLTL',
            component: OP_PricingCostingLTL,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_PricingCosting/detail_costing',
            name: 'OP_PricingCostingFormDetail',
            component: OP_PricingCostingFormDetail,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_Booking',
            name: 'OP_BookingEntry',
            component: OP_BookingEntry,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_Booking/Form',
            name: 'OP_AddBookingEntry',
            component: OP_AddBookingEntry,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_Booking/View',
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
        {
            path: '/OP/OP_FleetMaster/View',
            name: 'OP_FleetMasterView',
            component: OP_FleetMasterView,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_FleetMaster/Form',
            name: 'OP_FleetMasterForm',
            component: OP_FleetMasterForm,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_FleetMaster/Maintenance',
            name: 'OP_FleetMasterMaintenance',
            component: OP_FleetMasterMaintenance,
            meta: {
                requiresAuth: true
            }
        },

        {
            path: '/OP/OP_MaintenanceType',
            name: 'OP_MaintenanceType',
            component: OP_MaintenanceType,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_MaintenanceType/Form',
            name: 'OP_MaintenanceTypeForm',
            component: OP_MaintenanceTypeForm,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_MaintenanceType/View',
            name: 'OP_MaintenanceTypeView',
            component: OP_MaintenanceTypeView,
            meta: {
                requiresAuth: true
            }
        },

        {
            path: '/OP/OP_MaintenanceItem',
            name: 'OP_MaintenanceItem',
            component: OP_MaintenanceItem,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/OP/OP_MaintenanceItem/Form',
            name: 'OP_MaintenanceItemForm',
            component: OP_MaintenanceItemForm,
            meta: {
                requiresAuth: true
            }
        },

        {
            path: '/OP/OP_Order/Form',
            name: 'OP_OrderForm',
            component: OP_OrderForm,
            meta: {
                requiresAuth: true
            }
        },
    ]
}