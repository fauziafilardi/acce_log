import SS_User_Master from  '@/views/SS/SS_User/SS_User_Master'
// import SS_Menu_Master from  '@/views/SS/SS_Menu/SS_Menu_Master'
// import SS_PageMasterFile_Master from  '@/views/SS/SS_PageMasterFile/SS_PageMasterFile_Master'
// import SS_Group_Master from  '@/views/SS/SS_Group/SS_Group_Master'
// import SS_SortMenu_Master from  '@/views/SS/SS_SortMenu/SS_SortMenu_Master'
// import SS_Dashboard_Master from  '@/views/SS/SS_Dashboard/SS_Dashboard_Master'
// import SS_CustomLookupField_Master from  '@/views/SS/SS_CustomLookupField/SS_CustomLookupField_Master'
// import SS_PortIn_Master from  '@/views/SS/SS_PortIn/SS_PortIn_Master'
// import SS_TableViewer_Master from  '@/views/SS/SS_TableViewer/SS_TableViewer_Master'
// import SS_CopySubPortfolio_Master from  '@/views/SS/SS_CopySubPortfolio/SS_CopySubPortfolio_Master'
// import SS_TableChecker_Master from  '@/views/SS/SS_TableChecker/SS_TableChecker_Master'
// import SS_TableViewerLotMonthlyRentalRate_Master from  '@/views/SS/SS_TableViewerLotMonthlyRentalRate/SS_TableViewerLotMonthlyRentalRate_Master'
// import SS_ValidDatePortin_Master from  '@/views/SS/SS_ValidDatePortin/SS_ValidDatePortin_Master'
// import SS_ReportExcelGenerator_Master from  '@/views/SS/SS_ReportExcelGenerator/SS_ReportExcelGenerator_Master'
// import SS_DeleteMapUnit_Master from  '@/views/SS/SS_DeleteMapUnit/SS_DeleteMapUnit_Master'
// import SS_GenerateTempletePortIn_Master from  '@/views/SS/SS_GenerateTempletePortIn/SS_GenerateTempletePortIn_Master'
// import SS_NumberChecker_Master from  '@/views/SS/SS_NumberChecker/SS_NumberChecker_Master'
// import SS_UserDataLogViewer_Master from  '@/views/SS/SS_UserDataLogViewer/SS_UserDataLogViewer_Master'
// import SS_MailSetting_Master from  '@/views/SS/SS_MailSetting/SS_MailSetting_Master'
// import SS_GenerateReportToFile_Master from  '@/views/SS/SS_GenerateReportToFile/SS_GenerateReportToFile_Master'
// import SS_GenerateReportFileChecker_Master from  '@/views/SS/SS_GenerateReportFileChecker/SS_GenerateReportFileChecker_Master'
// import SS_GenerateReportSendFileToEmail_Master from  '@/views/SS/SS_GenerateReportSendFileToEmail/SS_GenerateReportSendFileToEmail_Master'
// import SS_GenerateReportDeleteFile_Master from  '@/views/SS/SS_GenerateReportDeleteFile/SS_GenerateReportDeleteFile_Master'
// import SS_UserReportGenerator_Master from  '@/views/SS/SS_UserReportGenerator/SS_UserReportGenerator_Master'
// import SS_CNBadDebt_Master from  '@/views/SS/SS_CNBadDebt/SS_CNBadDebt_Master'
import SS_ReportParameter_Master from  '@/views/SS/SS_ReportParameter/SS_ReportParameter_Master'
import SS_FormParameter_Master from  '@/views/SS/SS_FormParameter/SS_FormParameter_Master'
import SS_FormParameterMobile_Master from  '@/views/SS/SS_FormParameterMobile/SS_FormParameterMobile_Master'
import SS_LookupEntry_Master from  '@/views/SS/SS_LookupEntry/SS_LookupEntry_Master'

import SS_ModuleAccess_Master from '@/views/SS/SS_ModuleAccess/SS_ModuleAccess_Master'
import SS_Page_Master from '@/views/SS/SS_PageMasterFile/SS_PageMasterFile_Master'
import SS_Group_Master from '@/views/SS/SS_Group/SS_Group_Master'
import SS_UserProfile_Master from '@/views/SS/SS_UserProfile/SS_UserProfile_Master'

import SS_UserPrivilegeReport_Master from '@/views/SS/SS_UserPrivilegeReport/PageLevel_1/SS_UserPrivilegeReport'     

export const SSRender = {
 path: '/SS',
 component: {
   render (c) { return c('router-view') }
 },
 children: [
     // Sementara aja
     {
        path: '/SS/SS_UserPrivilegeReport',
        name: 'SS_UserPrivilegeReport',
        component: SS_UserPrivilegeReport_Master,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/SS/SS_Menu',
        name: 'SS_Menu',
        component: SS_ModuleAccess_Master,
        meta: {
            requiresAuth: true
        }
    },
    {
        path: '/SS/SS_PageMasterFile',
        name: 'SS_PageMaster',
        component: SS_Page_Master,
        meta: {
            requiresAuth: true
        }
    },
    {
      path: '/SS/SS_Group',
      name: 'SS_Group',
      component: SS_Group_Master,
      meta: {
        requiresAuth: true
      }
    },
    {
        path: '/SS/SS_UserProfile',
        name: 'SS_UserProfile',
        component: SS_UserProfile_Master,
        meta: {
          requiresAuth: true
        }
      },

    {
        path: '/SS/SS_User',
        name: 'SS_User',
        component: SS_User_Master,
        meta: {
            requiresAuth: true
        }
    }
    
    // ,
    // {
    //     path: '/SS/SS_Menu',
    //     name: 'SS_Menu',
    //     component: SS_Menu_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_PageMasterFile',
    //     name: 'SS_PageMasterFile',
    //     component: SS_PageMasterFile_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_Group',
    //     name: 'SS_Group',
    //     component: SS_Group_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_SortMenu',
    //     name: 'SS_SortMenu',
    //     component: SS_SortMenu_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_Dashboard',
    //     name: 'SS_Dashboard',
    //     component: SS_Dashboard_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_CustomLookupField',
    //     name: 'SS_CustomLookupField',
    //     component: SS_CustomLookupField_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_PortIn',
    //     name: 'SS_PortIn',
    //     component: SS_PortIn_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_TableViewer',
    //     name: 'SS_TableViewer',
    //     component: SS_TableViewer_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_CopySubPortfolio',
    //     name: 'SS_CopySubPortfolio',
    //     component: SS_CopySubPortfolio_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_TableChecker',
    //     name: 'SS_TableChecker',
    //     component: SS_TableChecker_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_TableViewerLotMonthlyRentalRate',
    //     name: 'SS_TableViewerLotMonthlyRentalRate',
    //     component: SS_TableViewerLotMonthlyRentalRate_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_ValidDatePortin',
    //     name: 'SS_ValidDatePortin',
    //     component: SS_ValidDatePortin_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_ReportExcelGenerator',
    //     name: 'SS_ReportExcelGenerator',
    //     component: SS_ReportExcelGenerator_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_DeleteMapUnit',
    //     name: 'SS_DeleteMapUnit',
    //     component: SS_DeleteMapUnit_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_GenerateTempletePortIn',
    //     name: 'SS_GenerateTempletePortIn',
    //     component: SS_GenerateTempletePortIn_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_NumberChecker',
    //     name: 'SS_NumberChecker',
    //     component: SS_NumberChecker_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_UserDataLogViewer',
    //     name: 'SS_UserDataLogViewer',
    //     component: SS_UserDataLogViewer_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_MailSetting',
    //     name: 'SS_MailSetting',
    //     component: SS_MailSetting_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_GenerateReportToFile',
    //     name: 'SS_GenerateReportToFile',
    //     component: SS_GenerateReportToFile_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_GenerateReportFileChecker',
    //     name: 'SS_GenerateReportFileChecker',
    //     component: SS_GenerateReportFileChecker_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_GenerateReportSendFileToEmail',
    //     name: 'SS_GenerateReportSendFileToEmail',
    //     component: SS_GenerateReportSendFileToEmail_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_GenerateReportDeleteFile',
    //     name: 'SS_GenerateReportDeleteFile',
    //     component: SS_GenerateReportDeleteFile_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_UserReportGenerator',
    //     name: 'SS_UserReportGenerator',
    //     component: SS_UserReportGenerator_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    
    // ,
    // {
    //     path: '/SS/SS_CNBadDebt',
    //     name: 'SS_CNBadDebt',
    //     component: SS_CNBadDebt_Master,
    //     meta: {
    //         requiresAuth: true
    //     }
    // }
    ,
    {
        path: '/SS/SS_ReportParameter',
        name: 'SS_ReportParameter_Master',
        component: SS_ReportParameter_Master,
        meta: {
            requiresAuth: true
        }
    }
    ,
    {
        path: '/SS/SS_FormParameter',
        name: 'SS_FormParameter_Master',
        component: SS_FormParameter_Master,
        meta: {
            requiresAuth: true
        }
    }
    ,
    {
        path: '/SS/SS_FormParameterMobile',
        name: 'SS_FormParameterMobile_Master',
        component: SS_FormParameterMobile_Master,
        meta: {
            requiresAuth: true
        }
    }
    ,
    {
        path: '/SS/SS_LookupEntry',
        name: 'SS_LookupEntry_Master',
        component: SS_LookupEntry_Master,
        meta: {
            requiresAuth: true
        }
    }
 ]
}