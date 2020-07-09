<template>
  <span id="ABSSelectList">
    <b-modal
      id="modalAccLookup"
      :hide-footer="true"
      :hide-header-close="false"
      size="lg"
      ref="modalAccLookup"
      class="modal-customize-abs"
      style="position:absolute;"
    >
      <b-row>
        <b-col sm="12">
          <!-- <div class="modal-customize-abs__modal-header">
            <div class="modal-customize-abs__modal-header--title">
              Lookup {{prop.cLabel}}
            </div>
            <div
              class="modal-customize-abs__modal-header--icon"
              @click="$refs.modalAccLookup.hide()"
            >
              <i class="icon-close"></i>
            </div>
          </div>-->
          <div class="modal-customize-abs__modal-body" style="padding-right: 0px;">
            <!-- <p>Select data</p> -->
            <!-- <div class="box-category"> -->
            <!-- <div class="box-category__list-category-export" @click="doExportXLS('S')">
                <img :src="require('@/assets/export-select.png')" alt="">
                Export Selected Data
              </div>
              <div class="box-category__list-category-export category-all" @click="doExportXLS('A')">
                <img :src="require('@/assets/export-all.png')" alt="">
                Export All
            </div>-->
            <div class="table--list">
              <ACCLookUpDetail
                :dataLookUp="prop.dataLookUp"
                :title="'Test'"
                :urlApi="urlApi"
                @rowDblClicked="doDoubleClick"
                :cName="prop.cName"
                ref="modalAccLookupDetail"
              />
            </div>
            <!-- </div> -->
          </div>
        </b-col>
      </b-row>
    </b-modal>
    <!-- <b-row>
    <b-col>-->
    <b-col style="padding-right: 0px !important; padding-left: 0px !important;">
      <b-form-input
        v-show="inputStatus!=='view'"
        v-validate="prop.cValidate"
        :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
        type="text"
        v-bind:name="prop.cName"
        v-model="label"
        class="text-field-form-list"
        :tabindex="prop.cOrder"
        :readonly="true"
        :ref="prop.cName"
        :id="prop.cName"
        :style="(inputStatus=='edit' && prop.cKey || prop.cProtect ? 'background-color:  #e9ecef; padding-right:36px !important;' : 'background-color: #FFF; padding-right:36px !important;') + prop.cStyle"
        :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect"
        @click.native="openLookup"
      />
      <span v-show="inputStatus!=='view' && label!='' " @click="clear" class="clear">&times;</span>
      <i v-show="inputStatus!=='view'" @click="openLookup" role="presentation" class="open-indicator"></i>
    </b-col>

    <span
      v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
      class="error-span"
    >{{ errors.first(prop.cParentForm+'.'+prop.cName) }}</span>
    <!-- <label class="lbl-value-view-form notranslate" v-show="inputStatus=='view'">{{label}}</label> -->
    <!-- </b-col>
      <b-col md="1">
        <div class="add-icon--plus" v-show="inputStatus!=='view' && prop.cMasterUrl!=undefined" @click="doShowMaster">
          <i class="icon-plus"></i>
        </div>
        <b-form-input v-show="false"
          type="text"
          :id="prop.cName + 'passingHidden'"
          :name="prop.cName + 'passingHidden'"
          v-model="passingHiddenData" />
      </b-col>
    </b-row>-->
  </span>
</template>

<script>
export default {
  model: {
    event: "change"
  },
  props: {
    prop: {
      dataLookUp: {
        LookUpCd: String,
        ColumnDB: String,
        InitialWhere: String,
        ParamWhere: String,
        OrderBy: String,
        ParamView: String,
        SourceField: String,
        DisplayLookUp: String
      },
      cValidate: String,
      cName: String,
      ckey: Boolean,
      cOrder: Number,
      cStyle: String,
      cDefault: String,
      cProtect: Boolean,
      cParentForm: String,
      cStatic: Boolean,
      cOption: Array,
      cDisplayColumn: String,
      cInputStatus: String
      // cMasterUrl: String,
      // cIsAlwaysShow: Boolean,
      // cHideRowColumnCSS: Boolean,
      // cRowDisable: {type: Array, default: []},
      // cVisible: Boolean,
      // cAsync: Boolean,
      // cPageLevel: String,
      // cTabIndex: String,
    },
    // rowLine: {type: Number, default: 0},
    label: { type: String, default: "" },
    // value: {type: String, default: ''},
    // T Analysis param
    // isTAnalysis: {type:Boolean, default: false},
    urlApi: String,
    // TrxAnalysisCategory: {type: String, default: ''},
    index: Number
  },
  data() {
    return {
      options: [],
      isRequired: false,
      onChangeTriggered: false,
      action: [],
      oid: "",
      passingHiddenData: ""
    };
  },
  watch: {
    passingHiddenData: function(newData, oldData) {
      console.log(newData);
      this.label = JSON.parse(newData);
      this.$emit("change", JSON.parse(newData));
    }
  },
  computed: {
    inputStatus() {
      this.$validator.pause();
      this.$nextTick(() => {
        this.$validator.errors.clear(this.prop.cParentForm);
        this.$validator.resume();
      });

      // var ret = 'new'

      // if (this.prop.cInputStatus && this.prop.cInputStatus !== '' && this.prop.cInputStatus !== undefined) {
      //     ret = this.prop.cInputStatus
      // }

      // return ret
      return this.prop.cInputStatus.toLowerCase();
    },
    languageStatus() {
      return this.$store.getters.languageStatus;
    }
  },
  methods: {
    focus() {
      this.$nextTick().then(() =>
        document.getElementById(this.prop.cName).focus()
      );
    },
    doDoubleClick(record, index) {
      var label = "";
      // remove json yang urutan json keynya ke 1 (dimulai dari 0) jadi id
      // (contoh json=> { id: 1, debtorCd: "0004", debtorName: "PT. Asik Asik" }
      // nah si debtorCd: "0004" diganti keynya jadi id: "0004"

      var displayColumn = this.prop.cDisplayColumn.split(",");

      var keys = Object.keys(record);
      for (var j = 0; j < keys.length; j++) {
        // add label to display column textbox
        displayColumn.forEach(el => {
          if (keys[j] == el.trim()) {
            label += record[keys[j]] + " " + record.separator + " ";
          }
        });

        if (j == 1) {
          record.id = record[keys[j]];
          // delete record[keys[j]]
        }
      }
      // replace | terakhir string
      if (label.includes(" " + record.separator + " ")) {
        label = label.substring(0, label.length - 3);
      }
      record.label = label;
      record["_index"] = this.index;

      //   if (this.isTAnalysis) {
      //     record['_index'] = this.index

      //     if (this.prop.cName.includes('From')) {
      //       this.$emit('changeFrom', record)
      //     } else {
      //       this.$emit('changeTo', record)
      //     }
      //   }

      this.$emit("change", record);
      this.closeLookup();
    },
    doShowMaster() {
      if ((this.inputStatus == "edit" && this.prop.cKey) || this.prop.cProtect)
        return;

      this.masterUrlPopUp(
        `${window.location.origin}` + this.oid,
        "",
        "1000",
        "600",
        this.prop.cName
      );
    },
    openLookup() {
      if ((this.inputStatus == "edit" && this.prop.cKey) || this.prop.cProtect)
        return;

      //   if (this.isTAnalysis) {
      //     this.getDataTAnalysis()
      //   } else {
      //   }
      this.getData();
      // this.$refs.modalAccLookupDetail.doGetList('', 'initial')
    },
    clear() {
      if ((this.inputStatus == "edit" && this.prop.cKey) || this.prop.cProtect)
        return;
      this.label = "";
      var record = {
        id: "",
        label: ""
      };
      //   if (this.isTAnalysis) {
      //     record['_index'] = this.index

      //     if (this.prop.cName.includes('From')) {
      //       this.$emit('changeFrom', record)
      //     } else {
      //       this.$emit('changeTo', record)
      //     }
      //   }

      this.$emit("change", record);
    },
    closeLookup() {
      this.$refs.modalAccLookup.hide();
    },
    getData() {
      var d = this.prop.cDefault ? this.prop.cDefault : "";
      this.$refs.modalAccLookup.show();
      this.$nextTick(() => {
        // console.log(this.$refs.modalAccLookupDetail.$children)
        // this.$refs.modalAccLookupDetail.doCursorSearch()
        // this.prop.dataLookUp.UserId = this.getDataUser().user_id
        // this.prop.dataLookUp.PortfolioCd = this.getDataUser().portfolio_cd
        // this.prop.dataLookUp.SubPortfolioCd = this.getDataUser().subportfolio_cd

        // this.$refs.modalAccLookupDetail.dataLookUp.UserId = this.getDataUser().user_id
        // this.$refs.modalAccLookupDetail.dataLookUp.PortfolioCd = this.getDataUser().portfolio_cd
        // this.$refs.modalAccLookupDetail.dataLookUp.SubPortfolioCd = this.getDataUser().subportfolio_cd

        // this.postEncode(this.getUrlLookup(), this.prop.dataLookUp)
        // .then((response) => {
        //     if (response == null) return

        //     this.options = response.Data
        //     if (this.options.length > 0) {
        //       if (loading !== null) loading(false)

        //         if (this.options.length == 1 && this.onChangeTriggered){
        //             this.selected = this.options[0]
        //         }
        //         else if (d !== '') {
        //             var index = this.options.map(d => {return d.id}).indexOf(d)
        //             this.selected = this.options[index]
        //         }
        //     }

        //     this.onChangeTriggered = false
        // })
        this.$refs.modalAccLookupDetail.fields = [];
        this.$refs.modalAccLookupDetail.items = [];
        this.$refs.modalAccLookupDetail.perPage = 20;
        this.$refs.modalAccLookupDetail.currentPage = 1;
        this.$refs.modalAccLookupDetail.lastPage = 1;
        this.$refs.modalAccLookupDetail.totalRows = 0;
        this.$refs.modalAccLookupDetail.searchValue = "";
        this.$refs.modalAccLookupDetail.sortedField = [];
        this.$refs.modalAccLookupDetail.sort = "";
        this.$refs.modalAccLookupDetail.sort = this.prop.dataLookUp.OrderBy;
        this.$refs.modalAccLookupDetail.doGetList("", "initial");
      });
    },
    getDataTAnalysis() {
      var d = this.prop.cDefault ? this.prop.cDefault : "";

      this.$refs.modalAccLookupDetail.dataLookUp.UserId = this.getDataUser().user_id;
      this.$refs.modalAccLookupDetail.dataLookUp.PortfolioCd = this.getDataUser().portfolio_cd;
      this.$refs.modalAccLookupDetail.dataLookUp.SubPortfolioCd = this.getDataUser().subportfolio_cd;

      this.$refs.modalAccLookupDetail.fields = [];
      this.$refs.modalAccLookupDetail.items = [];
      this.$refs.modalAccLookupDetail.perPage = 20;
      this.$refs.modalAccLookupDetail.currentPage = 1;
      this.$refs.modalAccLookupDetail.lastPage = 1;
      this.$refs.modalAccLookupDetail.totalRows = 0;
      this.$refs.modalAccLookupDetail.searchValue = "";
      this.$refs.modalAccLookupDetail.sortedField = [];
      this.$refs.modalAccLookupDetail.sort = this.prop.dataLookUp.OrderBy;
      this.$refs.modalAccLookupDetail.doGetList("", "initial");
    },
    checkPropDisplayColumn() {
      if (this.prop.cDisplayColumn) {
        this.alertWarning("Please check prop cDisplayColumn on " + ""); //this.prop.cLabel
        return;
      }
    }
  },
  created() {
    // this.prop.cRowDisable = this.prop.cRowDisable === undefined ? [] : this.prop.cRowDisable
    // this.prop.cHideRowColumnCSS = this.prop.cHideRowColumnCSS ? this.prop.cHideRowColumnCSS : false
    // if (this.prop.cVisible != false || this.prop.cVisible != true) {
    //   this.prop.cVisible = true
    // }
    // if (this.prop.cVisible == undefined) {
    //   this.prop.cVisible = true
    // }
    // if (this.prop.cIsAlwaysShow != false || this.prop.cIsAlwaysShow != true) {
    //   this.prop.cIsAlwaysShow = false
    // }

    if (this.prop.cStatic == undefined || this.prop.cStatic == null) {
      this.prop.cStatic = false;
    } else {
      if (this.prop.cStatic) {
        this.options = this.prop.cOption;
      }
    }
    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false;
    this.prop.cInputStatus = this.prop.cInputStatus
      ? this.prop.cInputStatus
      : "new";

    this.prop.cStyle = this.prop.cStyle ? this.prop.cStyle : "";
  },
  mounted() {
    // if (this.prop.cStatic == undefined || this.prop.cStatic == null) {
    //   this.prop.cStatic = false
    // }
    // else {
    //   if (this.prop.cStatic){
    //     this.options = this.prop.cOption
    //   }
    // }
    // this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false
    // this.prop.cInputStatus = this.prop.cInputStatus ? this.prop.cInputStatus : "new"
    // this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 4
    // this.prop.cTriggered = this.prop.cTriggered ? this.prop.cTriggered : false
    // this.prop.cAsync = this.prop.cAsync ? this.prop.cAsync : true
    // this.prop.cVisible = this.prop.cVisible == undefined || this.prop.cVisible == null ? true : this.prop.cVisible
    // this.prop.cIsAlwaysShow = this.prop.cIsAlwaysShow ? this.prop.cIsAlwaysShow : false

    // this.prop.cMasterUrl = this.prop.cMasterUrl == '' ? undefined : this.prop.cMasterUrl

    if (
      this.prop.cValidate !== undefined &&
      this.prop.cValidate !== null &&
      this.prop.cValidate !== ""
    ) {
      var str_array = this.prop.cValidate.split("|");
      for (var i = 0; i < str_array.length; i++) {
        var s = str_array[i].split(":");
        if (s[0] == "required") {
          this.isRequired = true;
        }
      }
    }

    // untuk ambil oid
    // var event = this.getMenu().event_with_child
    // var url = this.prop.cMasterUrl + '?oid='
    // var oi = ''
    // var arrFilter = event.filter(function(menu) {

    //   var x = menu.child.filter(function(child) {
    //     var menu = child.menu_url
    //     if (menu.includes(url)) {
    //       oi = menu
    //     }
    //   })
    // })
    // this.oid = oi

    // get max, for maxlength
    // if(this.prop.cValidate !== undefined && this.prop.cValidate !== null && this.prop.cValidate !== ''){
    //   var str_array = this.prop.cValidate.split('|')
    //   for (var i = 0; i < str_array.length; i++) {
    //     var s = str_array[i].split(':')
    //     if(s[0] == 'required') {
    //       this.isRequired = true
    //     }
    //   }
    // }
  },
  beforeDestroy() {}
};
</script>

<style scoped>
/* .form-control:disabled, .form-control[readonly]{
    background-color: #f8f8f8 !important; 
  } */
.clear {
  font-size: 17px !important;
  font-weight: 700 !important;
  line-height: 1 !important;
  color: rgba(60, 60, 60, 0.5) !important;
  padding: 0 !important;
  border: 0 !important;
  /* background-color: transparent !important; */
  /* margin-right: 6px !important; */

  position: absolute !important;
  right: 30px !important;
  top: 30% !important;
  /* margin-top: 5px !important; */
  display: inline-block;
  cursor: pointer !important;
  margin-right: 0px !important;
  height: 10px !important;

  /* text-indent: 100% !important;
    white-space: nowrap !important;
    overflow: hidden !important; */
}

/* .open-indicator {
    display: flex !important;
    align-items: center !important;
    cursor: pointer !important;
    pointer-events: all !important;
    transition: all 150ms cubic-bezier(1.000, -0.115, 0.975, 0.855) !important;
    transition-timing-function: cubic-bezier(1.000, -0.115, 0.975, 0.855) !important;
    opacity: 1 !important;
    width: 12px !important;

    position:absolute !important; 
    right: 12px !important; 
    top:0 !important;  
    margin-top: 5px !important;
    display: inline-block;
    cursor: pointer !important;
    margin-right: 0px !important;
    height: 10px !important;
  } */

.open-indicator {
  align-items: center;
  cursor: pointer;
  pointer-events: all;
  transition: all 150ms cubic-bezier(1, -0.115, 0.975, 0.855);
  transition-timing-function: cubic-bezier(1, -0.115, 0.975, 0.855);
  opacity: 1;
  width: 12px; /* To account for extra width from rotating. */

  position: absolute !important;
  right: 12px !important;
  top: 30% !important;
  /* left: 97% !important;
  bottom: 30px !important; */
  margin-top: 2px !important;
  display: inline-block;
  margin-right: 0px !important;
  height: 10px !important;
}
.open-indicator:before {
  border-color: rgba(60, 60, 60, 0.5);
  border-style: solid;
  border-width: 3px 3px 0 0;
  content: "";
  display: inline-block;
  height: 10px;
  width: 10px;
  vertical-align: text-top;
  transform: rotate(133deg);
  transition: all 150ms cubic-bezier(1, -0.115, 0.975, 0.855);
  transition-timing-function: cubic-bezier(1, -0.115, 0.975, 0.855);
  box-sizing: inherit;
}
/* Open Indicator States */
.open-indicator:before {
  /* transform: rotate(315deg) !important; */
}
/* .open-indicator {
    opacity: 0;
  } */
</style>