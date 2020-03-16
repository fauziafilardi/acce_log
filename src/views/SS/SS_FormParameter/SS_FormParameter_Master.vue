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
           tabPath1:'views/SS/SS_FormParameter/PageLevel_1',     
           tabPath2:'views/SS/SS_FormParameter/PageLevel_2',
           tabPath3:'views/SS/SS_FormParameter/PageLevel_3'        
      }
    }
  },
  beforeCreate(){
    
  },
  beforeMount(){
    
  }
}
</script>
