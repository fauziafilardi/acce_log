<template>
  <div class="height--full">
    <ABSMasterPageVuex :prop="property" />
  </div>
</template>

<script>
export default {
  data() {
    return {
      property: {
        tabPath1: 'views/CM/CM_CountryCityVuex/PageLevel_1',
        tabPath2: 'views/CM/CM_CountryCityVuex/PageLevel_2',
        // tabPath3: 'views/Tabs2',
      }
    }
  },
  beforeCreate(){
    // localStorage.setItem('lsOptionSeq','{"OptionSeq":"6460","ModuleSeq":"240","EventSeq":"1090","PageMasterSeq":"20","ModuleCd":"CM","menu_url":"/CM_CountryCityMasterVuex","component_url":null,"ImageUrlD":"CM/CM_CountryCity.aspx","TextMenu":"Country / City","UserId":"EPRO","SubPortfolioCd":"001","PS":"","LineNo":null,"SS_UserFavorite_ID":"215"}')
  },
  beforeMount(){
    
  }
}
</script>