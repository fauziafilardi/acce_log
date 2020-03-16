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
           tabPath1:'views/MK/MK_Marketing/PageLevel_1'
      }
    }
  },
  beforeCreate(){
    
  },
  beforeMount(){
    
  }
}
</script>
