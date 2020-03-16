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
        tabPath1: 'views/SS/SS_PageMaster/PageLevel_1',
        tabPath2: 'views/SS/SS_PageMaster/PageLevel_2',
        tabPath3: 'views/SS/SS_PageMaster/PageLevel_3',
      }
    }
  }
}
</script>