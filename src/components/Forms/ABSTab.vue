<template>
  <b-tabs>
    <b-tab v-for="(tab, index) in listTab" :key="index" :title="tab.TabName">
      <ABSTabDetail tabPath='../../views/Details/' :tabUrl="tab.Url" />
    </b-tab>
  </b-tabs>
</template>

<script>
export default {
  props: {
    listTab: Array
  }
}
</script>