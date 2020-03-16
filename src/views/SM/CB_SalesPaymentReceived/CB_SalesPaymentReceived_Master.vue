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
           tabPath1:'views/SM/CB_SalesPaymentReceived/PageLevel_1', 
           tabPath2:'views/SM/CB_SalesPaymentReceived/PageLevel_2'        
      }
    }
  },
  beforeCreate(){
    
  },
  beforeMount(){
    
  }
}
</script>
