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
        tabPath1:'views/SO/SO_Order/PageLevel_1',
      }
    }
  }
}
</script>
