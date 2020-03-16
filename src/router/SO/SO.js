import SO_Specification_Master from '@/views/SO/SO_Specification/SO_Specification_Master'
import SO_Zone_Master from '@/views/SO/SO_Zone/SO_Zone_Master'
import SO_Route_Master from '@/views/SO/SO_Route/SO_Route_Master'
// import SO_Order_Master from '@/views/SO/SO_Order/SO_Order_Master'
import SO_GatePass_Master from '@/views/SO/SO_GatePass/PageLevel_1/SO_GatePass'
import SO_Order_Master from '@/views/SO/SO_Order/SO_Order_Master'


export const SORender = {
    path: '/MK',
    component: {
      render (c) { return c('router-view') }
    },
    children: [
        {
            path: '/SO/SO_Specification',
            name: 'SO_Specification',
            component: SO_Specification_Master,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/SO/SO_Zone',
            name: 'SO_Zone',
            component: SO_Zone_Master,
            meta: {
                requiresAuth: true
            }
        },
        {   
            path: '/SO/SO_Route',
            name: 'SO_Route',
            component: SO_Route_Master,
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/SO/SO_GatePass',
            name: 'SO_GatePass',
            component: SO_GatePass_Master,
            meta: {
                requiresAuth: true
            }
        }, 
        {   
            path: '/SO/SO_Order',
            name: 'SO_Order',
            component: SO_Order_Master,
            meta: {
                requiresAuth: true
            }
        }
    ]
}