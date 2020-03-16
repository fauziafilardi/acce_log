import FM_Specification_Master from  '@/views/FM/FM_Specification/FM_Specification_Master'
import FM_Fuel_Master from  '@/views/FM/FM_Fuel/FM_Fuel_Master'
import FM_LicenseType_Master from  '@/views/FM/FM_LicenseType/FM_LicenseType_Master'
import FM_Pool_Master from  '@/views/FM/FM_Pool/FM_Pool_Master'
import FM_FleetStatus_Master from  '@/views/FM/FM_FleetStatus/FM_FleetStatus_Master'
import FM_StaffType_Master from  '@/views/FM/FM_StaffType/FM_StaffType_Master'
import FM_FleetType_Master from  '@/views/FM/FM_FleetType/FM_FleetType_Master'
import FM_Staff_Master from  '@/views/FM/FM_Staff/FM_Staff_Master'
import FM_TerminationType_Master from  '@/views/FM/FM_TerminationType/FM_TerminationType_Master'
import FM_Accessories_Master from  '@/views/FM/FM_Accessories/FM_Accessories_Master'
import FM_BrandMaster_Master from  '@/views/FM/FM_BrandMaster/FM_BrandMaster_Master'
import FM_Fleet_Master from  '@/views/FM/FM_Fleet/FM_Fleet_Master'
import FM_Maintenance_Master from  '@/views/FM/FM_Maintenance/FM_Maintenance_Master'
import FM_Item_Master from  '@/views/FM/FM_Item/FM_Item_Master'
// import FM_Facility_Master from  '@/views/FM/FM_Facility/FM_Facility_Master'
// import FM_Type_Master from  '@/views/FM/FM_Type/FM_Type_Master'
// import FM_Booking_Master from  '@/views/FM/FM_Booking/FM_Booking_Master'
// import FM_BookingExpress_Master from  '@/views/FM/FM_BookingExpress/FM_BookingExpress_Master'
// import FM_BookingInquiry_Master from  '@/views/FM/FM_BookingInquiry/FM_BookingInquiry_Master'
// import FM_Measurement_Master from  '@/views/FM/FM_Measurement/FM_Measurement_Master'
// import FM_RequestConfirmation_Master from  '@/views/FM/FM_RequestConfirmation/FM_RequestConfirmation_Master'
// import FM_Request_Master from  '@/views/FM/FM_Request/FM_Request_Master'
// import FM_BookingCharges_Master from  '@/views/FM/FM_BookingCharges/FM_BookingCharges_Master'
// import FM_BookingCancellation_Master from  '@/views/FM/FM_BookingCancellation/FM_BookingCancellation_Master'
// import FM_BookingConsolidation_Master from  '@/views/FM/FM_BookingConsolidation/FM_BookingConsolidation_Master'
// import FM_BookingConsolidationCancellation_Master from  '@/views/FM/FM_BookingConsolidationCancellation/FM_BookingConsolidationCancellation_Master'
// import FM_BookingConfirmation_Master from  '@/views/FM/FM_BookingConfirmation/FM_BookingConfirmation_Master'
// import FM_CloseChargeableBooking_Master from  '@/views/FM/FM_CloseChargeableBooking/FM_CloseChargeableBooking_Master'
// import FM_Equipment_Master from  '@/views/FM/FM_Equipment/FM_Equipment_Master'

import FM_Fleet_Mobile_List from '@/views/FM/FM_Fleet_Mobile/FM_Fleet_Mobile_List'
import FM_Fleet_Mobile from '@/views/FM/FM_Fleet_Mobile/FM_Fleet_Mobile'


export const FMRender = {
    path: '/FM',
    component: {
      render (c) { return c('router-view') }
    },
    children: [
        {
            path: '/FM/FM_Specification',
            name: 'FM_Specification',
            component: FM_Specification_Master,
            meta: {
                requiresAuth: true
            }
        }
        ,
        {
            path: '/FM/FM_Fuel',
            name: 'FM_Fuel',
            component: FM_Fuel_Master,
            meta: {
                requiresAuth: true
            }
        }
        ,
        {
            path: '/FM/FM_LicenseType',
            name: 'FM_LicenseType',
            component: FM_LicenseType_Master,
            meta: {
                requiresAuth: true
            }
        }
        ,
        {
            path: '/FM/FM_Pool',
            name: 'FM_Pool',
            component: FM_Pool_Master,
            meta: {
                requiresAuth: true
            }
        }
        ,
        {
            path: '/FM/FM_FleetStatus',
            name: 'FM_FleetStatus',
            component: FM_FleetStatus_Master,
            meta: {
                requiresAuth: true
            }
        }
        ,
        {
            path: '/FM/FM_StaffType',
            name: 'FM_StaffType',
            component: FM_StaffType_Master,
            meta: {
                requiresAuth: true
            }
        }
        ,
        {
            path: '/FM/FM_FleetType',
            name: 'FM_FleetType',
            component: FM_FleetType_Master,
            meta: {
                requiresAuth: true
            }
        }
        ,
        {
            path: '/FM/FM_Staff',
            name: 'FM_Staff',
            component: FM_Staff_Master,
            meta: {
                requiresAuth: true
            }
        }
        ,
        {
            path: '/FM/FM_TerminationType',
            name: 'FM_TerminationType',
            component: FM_TerminationType_Master,
            meta: {
                requiresAuth: true
            }
        }
        ,
        {
            path: '/FM/FM_Accessories',
            name: 'FM_Accessories',
            component: FM_Accessories_Master,
            meta: {
                requiresAuth: true
            }
        }
        ,
        {
            path: '/FM/FM_BrandMaster',
            name: 'FM_BrandMaster',
            component: FM_BrandMaster_Master,
            meta: {
                requiresAuth: true
            }
        }
        ,
        {
            path: '/FM/FM_Fleet',
            name: 'FM_Fleet',
            component: FM_Fleet_Master,
            meta: {
                requiresAuth: true
            }
        }
        ,
        {
            path: '/FM/FM_Maintenance',
            name: 'FM_Maintenance',
            component: FM_Maintenance_Master,
            meta: {
                requiresAuth: true
            }
        }
        ,
        {
            path: '/FM/FM_Item',
            name: 'FM_Item',
            component: FM_Item_Master,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/FM/FM_Fleet_Mobile_List',
            name: 'FM_Fleet_Mobile_List',
            component: FM_Fleet_Mobile_List,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/FM/FM_Fleet_Mobile',
            name: 'FM_Fleet_Mobile',
            component: FM_Fleet_Mobile,
            meta: {
                requiresAuth: true
            }
        }
        // ,
        // {
        //     path: '/FM/FM_Facility',
        //     name: 'FM_Facility',
        //     component: FM_Facility_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/FM/FM_Type',
        //     name: 'FM_Type',
        //     component: FM_Type_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/FM/FM_Booking',
        //     name: 'FM_Booking',
        //     component: FM_Booking_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/FM/FM_BookingExpress',
        //     name: 'FM_BookingExpress',
        //     component: FM_BookingExpress_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/FM/FM_BookingInquiry',
        //     name: 'FM_BookingInquiry',
        //     component: FM_BookingInquiry_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/FM/FM_Measurement',
        //     name: 'FM_Measurement',
        //     component: FM_Measurement_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/FM/FM_RequestConfirmation',
        //     name: 'FM_RequestConfirmation',
        //     component: FM_RequestConfirmation_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/FM/FM_Request',
        //     name: 'FM_Request',
        //     component: FM_Request_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/FM/FM_BookingCharges',
        //     name: 'FM_BookingCharges',
        //     component: FM_BookingCharges_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/FM/FM_BookingCancellation',
        //     name: 'FM_BookingCancellation',
        //     component: FM_BookingCancellation_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/FM/FM_BookingConsolidation',
        //     name: 'FM_BookingConsolidation',
        //     component: FM_BookingConsolidation_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/FM/FM_BookingConsolidationCancellation',
        //     name: 'FM_BookingConsolidationCancellation',
        //     component: FM_BookingConsolidationCancellation_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/FM/FM_BookingConfirmation',
        //     name: 'FM_BookingConfirmation',
        //     component: FM_BookingConfirmation_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/FM/FM_CloseChargeableBooking',
        //     name: 'FM_CloseChargeableBooking',
        //     component: FM_CloseChargeableBooking_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
        
        // ,
        // {
        //     path: '/FM/FM_Equipment',
        //     name: 'FM_Equipment',
        //     component: FM_Equipment_Master,
        //     meta: {
        //         requiresAuth: true
        //     }
        // }
    ]
}