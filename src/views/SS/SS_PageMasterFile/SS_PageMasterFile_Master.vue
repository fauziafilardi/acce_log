<template>
  <div class="height--full">
    <ABSMasterPageVuex2 :prop="property" />
  </div>
</template>

<script>
export default {
  data() {
    return {
      property: {
           tabPath1:'views/SS/SS_PageMasterFile/PageLevel_1', 
           tabPath2:'views/SS/SS_PageMasterFile/PageLevel_2'        
      }
    }
  },
  beforeCreate(){
    
  },
  beforeMount(){
    
  }
}
</script>
