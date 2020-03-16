import WF_Master from '@/views/WF/WF_Master/WF_Master'

export const WFRender = {
  path: '/WF',
  component: {
    render (c) { return c('router-view') }
  },
  children: [
    {
      path: '/WF/WF_Master',
      name: 'WF_Master',
      component: WF_Master,
      meta: {
        requiresAuth: true
      }
    }
  ]
}
