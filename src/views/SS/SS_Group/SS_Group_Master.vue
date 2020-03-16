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
        tabPath1: 'views/SS/SS_Group/PageLevel_1',
        tabPath2: 'views/SS/SS_Group/PageLevel_2',
        // tabPath3: 'views/SS/SS_Group/PageLevel_3',
      }
    }
  }
}
</script>