<template>
  <div class="dashboard-page-mobile">
    <div class="dashboard-page-mobile__title">
      <!-- <b-row>
        <b-col cols="12" class="col-header">
          <b-row style="margin-left:11px !important;margin-left: 5px !important;margin-right: 5px !important;background-color: white;height: 30px;border-bottom: 1px solid #55b3ff;">
              <b-col md="4" style="width:33%;top:5%;">
                  <font-awesome-icon icon="chevron-left" class="icon-style-1"/>
              </b-col>
              <b-col md="4" style="width:33%;top:5%;text-align:center;">Log Book</b-col>
              <b-col md="4" style="width:33%;top:5%;text-align:right">Search</b-col>
          </b-row>
        </b-col>
      </b-row> -->
      <b-row>
        <b-col cols="12" class="col-header">
          <b-row style="margin-left:11px !important;margin-left: 5px !important;margin-right: 5px !important;background-color: white;height: 30px;border-bottom: 1px solid #55b3ff;">
              <b-col md="6">Log Book | 
                <ABSButton
                    text="Back"
                    icon="chevron-left"
                    classButton="button button--new"
                    classIcon="icon-style-1"
                    @click="doPrint"
                    :disabled="disabled"
                />
              </b-col>
              <b-col md="6">
                Search
              </b-col>
          </b-row>
        </b-col>
      </b-row>
    </div>
    <div class="dashboard-page-mobile__body">
      <b-row style="margin: 0px !important;">
        <b-col md="12" style="padding: 5px !important">
          <div class="card" style="font-size:11px; border:0px !important;">
            <b-list-group>
              <b-list-group-item @dblclick="onDataDblClick(index)" v-for="(data, index) in DataLogBook" href="#" class="flex-column align-items-start" v-bind:key="index">
                <font-awesome-icon icon="times-circle" class="icon-style-1__deleteMobile"/>
                <b-row>
                  <b-col md="6" style="width:50%">
                    <p class="p-list"> {{ data.log_book_date }} </p>
                    <p class="p-list"> {{ data.customer_name }} </p>
                    <p class="p-list"> {{ data.remark }} </p>
                  </b-col>
                  <b-col md="6" style="width:50%">
                    <p class="p-list"> {{ data.contact_status_descs }} </p>
                    <p class="p-list"> {{ data.follow_up_descs }} </p>
                  </b-col>
                </b-row>
              </b-list-group-item>
            </b-list-group>
          </div>
        </b-col>
      </b-row>
      <div @click="addForm" class="fab"> + </div>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      DataLogBook: [],
      currentPage: 1,
      perPage: 10,
      sort: 'time_edit DESC',
      sourceField: '',
      paramView: '',
      mk_log_book_h_id: null,
      lastupdatestamp: null,
    }
  },
  computed : {
  },
  methods: {
    addForm(){
      this.$router.push({ name: 'MK_LogBook_Header', params: { mk_log_book_h_id: this.mk_log_book_h_id, lastupdatestamp: this.lastupdatestamp } })
    },
    doGetList(search = "") {
      var param = {
        OptionUrl: "MK_LogBook",
        LineNo: 0,
        user_id: this.getDataUser().user_id,
        portfolio_cd: this.getDataUser().portfolio_cd,
        subportfolio_cd: this.getDataUser().subportfolio_cd,
        CurrentPage: this.currentPage,
        PerPage: this.perPage,
        ParamWhere: search,
        InitialWhere: "",
        SortField: this.sort,
        SourceField: this.sourceField,
        ParamView: this.paramView
      };

      var url = this.getUrlV2(this.getUrlList())

      this.postJSON(url, param).then(response => {
        if (response == null) return;
        this.DataLogBook = response.Data
        console.log(response)
      })
    },
    onDataClick(index) {
      // if (index > -1) {
      //   this.DataLogBook[index].isActive = !this.DataLogBook[index].isActive ? false : true
      // }
    },
    onDataDblClick(index) {
      this.$router.push({ name: 'MK_LogBook_Header', params: { mk_log_book_h_id: this.DataLogBook[index].row_id, lastupdatestamp: this.DataLogBook[index].lastupdatestamp } })
    }
  },
  beforeCreate: function () {
  },
  created: function() {
  },
  beforeMount: function() {
  },
  mounted: function() {
    this.doGetList()
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

<style scoped>
  .card-list {
      box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
      transition: 0.3s;
      width: 100%;
      /* margin:15px; */
  }

  .card-list:hover {
      box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
  }

  .container-list {
      padding: 2px 20px;
  }

  .p-list {
    margin-bottom: 0px !important;
    margin-top: 0px !important;
  }

  .fab {
    z-index: 10;
    width: 30px;
    height: 30px;
    background-color: #55b3ff;
    border-radius: 50%;
    box-shadow: 0 6px 10px 0 #666;
    transition: all 0.1s ease-in-out;
    
    font-size: 20px;
    color: white;
    text-align: center;
    line-height: 26px;
    
    position: fixed;
    right: 20px;
    bottom: 18px;
}
 
.fab:hover {
   box-shadow: 0 6px 14px 0 #666;
   transform: scale(1.05);
}

.list-group-item {
    padding: 5px 10px !important;
}
</style>
