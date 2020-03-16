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
           tabPath1:'views/CM/CM_TaxMaster/PageLevel_1', 
           tabPath2:'views/CM/CM_TaxMaster/PageLevel_2', 
           tabPath3:'views/CM/CM_TaxMaster/PageLevel_3'        
      }
    }
  },
  beforeCreate(){
    
  },
  beforeMount(){
    
  }
}
</script>
