<template>
  <div class="height--full">
    <!-- <ABSMasterPageVuex :prop="property" /> -->
    <!-- <ABSMasterPageFormVuex :prop="property"/> -->
    <ABSMasterPageVuex2 :prop="property" />
  </div>
</template>

<script>
export default {
  data() {
    return {
      property: {
        tabPath1: 'views/SS/SS_ModuleAccess/PageLevel_1'
      }
    }
  }
}
</script>