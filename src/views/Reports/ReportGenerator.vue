<template>
  <div class="height--full">
    <div class="header--content">
      <div class="header--content__breadcrumbs">
        <!-- Report Generator -->`
      </div>
    </div>

      <div class="content-app-form__body" style="background-color: white;padding-top: 1px !important;margin-left: 15px;margin-right: 15px;height: 95%;overflow-y: auto;overflow-x: hidden;padding-bottom: 1%;">

        <!-- <b-collapse id="collapse1" :visible="true"> -->
        <b-row style="margin-left:20px;margin-top: 20px;">					
          <b-col md="12" id="col-left">
            <b-table
              :responsive="true"
              :striped="false"
              :bordered="false"
              :outlined="false"
              :small="false"
              :hover="true"
              :dark="false"
              :fixed="false"
              :foot-clone="false"
              :fields="fields"
              :items="items"
              class="table-sm table-style-1"
              rules="row"
              @row-clicked="rowClicked">
            </b-table>
              <!-- @head-clicked="headClicked"
              @row-clicked="rowClicked"
              @row-dblclicked="rowDblClicked" -->
            <!-- </b-collapse> -->

          </b-col>
        </b-row>
    </div>
  </div>
</template>

<script>

export default {
  data() {
    return {
      fields: [],
      items: []
    }
  },
  methods: {
    rowClicked (record) {
      window.location.href = this.getUrlReportGenerator() + record.FileName
    }
  },
  beforeCreate: function () {
  },
  created: function() {
  },
  beforeMount: function() {
  },
  mounted: function() {
    this.hideSideBarMenu()
    this.fields = Object.keys(JSON.parse(localStorage.reportGenerator)[0])
    this.items = JSON.parse(localStorage.reportGenerator)
    // localStorage.removeItem('reportGenerator')
  },
  beforeUpdate: function() {
  },
  updated: function() {
  },
  beforeDestroy: function() {
  },
  destroyed: function() {
  }
}
</script>