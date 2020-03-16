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
        tabPath1:'views/SM/CM_DiscountUser/PageLevel_1'        
      }
    }
  },
  beforeCreate(){
    
  },
  beforeMount(){
    
  }
}
</script>
