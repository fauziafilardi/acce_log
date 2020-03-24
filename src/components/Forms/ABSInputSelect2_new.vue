<template>
  <span id="ABSSelectAsycn">
    <b-modal
      id="modalLookup"
      :hide-footer="true"
      :hide-header-close="true"
      size="lg"
      ref="modalLookup"
      class="modal-customize-abs"
    >
      <b-row>
        <b-col sm="12">
          <div class="modal-customize-abs__modal-header">
            <div class="modal-customize-abs__modal-header--title">Lookup</div>
            <div class="modal-customize-abs__modal-header--icon" @click="$refs.modalLookup.hide()">
              <i class="icon-close"></i>
            </div>
          </div>
          <div class="modal-customize-abs__modal-body">
            <div class="box-category">
              <ABSInputSelectListDetail
                :dataLookUp="prop.dataLookUp"
                @rowDblClicked="doDoubleClick"
              />
            </div>
          </div>
        </b-col>
      </b-row>
    </b-modal>
    <b-row v-show="prop.cVisible">
      <b-col :md="prop.cLabelSize" class="lbl-col-align">
        <template v-if="languageStatus">
          <label v-show="inputStatus=='new' || inputStatus=='edit'" class="text-field-form">
            <span v-if="isRequired" style="color:red;">*</span>
            {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}}
          </label>
          <label v-show="inputStatus=='view'" class="lbl-view-form">
            <span v-if="isRequired" style="color:red;">*</span>
            {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}}
          </label>
        </template>
        <template v-else>
          <label v-show="inputStatus=='new' || inputStatus=='edit'" class="text-field-form">
            <span v-if="isRequired" style="color:red;">*</span>
            {{ prop.cLabel }}
          </label>
          <label v-show="inputStatus=='view'" class="lbl-view-form">
            <span v-if="isRequired" style="color:red;">*</span>
            {{ prop.cLabel }}
          </label>
        </template>
      </b-col>
      <b-col>
        <v-select
          v-show="inputStatus!=='view'"
          label="label"
          :filterable="true"
          :options="options"
          @input="UpdateValue"
          v-model="selected"
          :class="{'abs-custom-select-async': true,'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
          v-validate="prop.cValidate"
          style="font-size:11px !important"
          v-bind:name="prop.cName"
          :tabindex="prop.cOrder"
          :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect"
          :searchable="prop.cFilter"
          :ref="prop.cName"
          :id="prop.cName"
          @search:focus="onFocus"
          @search="onSearch"
          @clear="onClear"
        >
          <!-- @search:focus="getData()" -->
          <template slot="no-options">
            <span v-show="prop.cAsync && options.length>0">type at least 3 characters to search...</span>
            <span v-show="options.length<1">no data</span>
            <span v-show="!prop.cAsync && options.length>0">type to search...</span>
          </template>
        </v-select>
        <span
          v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
          class="error-span"
        >{{ errors.first(prop.cParentForm+'.'+prop.cName) }}</span>
        <label
          class="lbl-value-view-form notranslate"
          v-show="inputStatus=='view'"
        >{{selected?selected.label:''}}</label>
      </b-col>
      <b-col md="1">
        <div
          class="add-icon--plus"
          v-show="inputStatus!=='view' && prop.cMasterUrl!=undefined && prop.cLastLabel==undefined"
          @click="doShowMaster"
        >
          <i class="icon-plus"></i>
        </div>
        <span v-show="prop.cLastLabel!=undefined && prop.cMasterUrl==undefined">
          <label class="lbl-value-view-form">{{ prop.cLastLabel }}</label>
        </span>
        <b-form-input
          v-show="false"
          type="text"
          :id="prop.cName + 'passingHidden'"
          :name="prop.cName + 'passingHidden'"
          v-model="passingHiddenData"
        />
      </b-col>
    </b-row>
  </span>
</template>

<script>
export default {
  name: "FormSelect",
  model: {
    event: "change"
  },
  props: {
    prop: {
      dataLookUp: {
        LookUpCd: String,
        ColumnDB: String,
        InitialWhere: String,
        ParamWhere: String
      },
      cValidate: String,
      cName: String,
      cLabel: String,
      cLabelSize: String,
      cOrder: Number,
      cTriggered: Boolean,
      cDefault: String,
      cProtect: Boolean,
      cVisible: Boolean,
      cAsync: Boolean,
      cFilter: Boolean,
      cPageLevel: [Number, String],
      cTabIndex: [Number, String],
      cParentForm: String,
      cStatic: Boolean,
      cOption: Array,
      cMasterUrl: String,
      cDisplayColumn: String,
      cLastLabel: String
    },
    value: { type: [String, Number, Object, Array], default: "" },
    label: { type: [String, Number, Object, Array], default: "" }
  },
  data() {
    return {
      //   selected: null,
      options: [],
      tempOptions: [],
      isRequired: false,
      onChangeTriggered: false,
      action: [],
      oid: "",
      isLoadData: false,
      canAsync: false,
      tempInitialWhere: "",
      passingHiddenData: ""
      // isSetValue: true
    };
  },
  watch: {
    passingHiddenData: function(newData, oldData) {
      // console.log(newData)
      this.value = JSON.parse(newData);
    }
  },
  computed: {
    isSetValue() {
      return !this.isLoadData;
    },
    isCanChange() {
      return this.isLoadData && this.options.length > 0;
    },
    inputStatus() {
      this.$validator.pause();
      this.$nextTick(() => {
        this.$validator.errors.clear(this.prop.cParentForm);
        this.$validator.resume();
      });
      // return this.$store.getters.getStatus

      if (
        this.$store.getters.getLevel == this.prop.cPageLevel &&
        this.$store.getters.getTab == this.prop.cTabIndex
      ) {
        if (this.$store.getters.getStatus == "new") {
          if (!this.prop.cStatic) {
            this.options = [];
          }
        }
        return this.$store.getters.getStatus;
      } else {
        return "view";
      }
    },
    languageStatus() {
      return this.$store.getters.languageStatus;
    },
    getStatusError() {
      return this.$store.getters.getStatusError;
    },
    selected: {
      get: function(el) {
        // BACKUPAN YANG LAMA, JANGAN DIHAPUS DULU YA
        // if (this.prop.cName == "AddressCd") {
        // alert(this.isLoadData)
        // alert(JSON.stringify(this.value))
        // console.log(this.isLoadData, JSON.stringify(this.value))
        // }
        // if (this.value == "" || this.value == null){
        //     return null
        // }
        // else {
        //   // return this.options[this.options.map(x => x.id).indexOf(this.value)]
        //     if (this.isLoadData) {
        //       return this.options[this.options.map(x => x.id).indexOf(this.value)]
        //     }
        //     else {
        //       if (typeof this.value !== 'object') {
        //         // return null
        //         this.options = [{id: this.value, label: (this.value + " | " + this.value)}]
        //         return this.options[0]
        //       }
        //       else {
        //         this.options = [{id: this.value.id, label: (this.value.id + " | " + this.value.label)}]
        //         // return {id: this.value.id, label: (this.value.id + " | " + this.value.label)}
        //         return this.options[0]
        //       }
        //       // this.getLookupDataBy().then(ress => {
        //       //   if (ress) {
        //       //     return ress.Data[0]
        //       //   }
        //       // })
        //     }
        // }

        console.log(this.value, this.options)

        if (this.value == "" || this.value == null) {
          return null;
        } else {
          // return this.options[this.options.map(x => x.id).indexOf(this.value)]
          if (this.isCanChange) {
            if (typeof this.value == "object") {
              return this.options[
                this.options.map(x => x.id).indexOf(this.value.id)
              ];
            } else {
              return this.options[
                this.options.map(x => x.id).indexOf(this.value)
              ];
            }
          } else {
            if (typeof this.value == "object") {
              if (this.options.length > 0) {
                if (this.options[0].id === this.value.id) {
                  // if (this.prop.cName === "RunningCd") {
                  //   console.log(this.options)
                  // }
                  // if (this.options[0].label !== this.value.label) {
                  return this.options[0];
                  // }
                } else {
                  this.options = [
                    { id: this.value.id, label: this.value.label }
                  ];
                  // if (this.prop.cName === "RunningCd") {
                  //   console.log(this.options)
                  // }
                  return this.options[0];
                }
              } else {
                this.options = [{ id: this.value.id, label: this.value.label }];
                // if (this.prop.cName === "RunningCd") {
                //   console.log(this.options)
                // }
                return this.options[0];
              }

              // this.options = [{ id: this.value.id, label: this.value.label }]
              // if (this.prop.cName === "RunningCd") {
              //   console.log(this.options)
              // }
              // return this.options[0]
            } else {
              if (this.options.length > 0) {
                if (this.options[0].id === this.value) {
                  // if (this.prop.cName === "RunningCd") {
                  //   console.log(this.options)
                  // }
                  // if (this.options[0].label !== this.value.label) {
                  return this.options[0];
                  // }
                } else {
                  this.options = [{ id: this.value, label: this.label }];
                  // if (this.prop.cName === "RunningCd") {
                  //   console.log(this.options)
                  // }
                  return this.options[0];
                }
              } else {
                this.options = [{ id: this.value, label: this.label }];
                // if (this.prop.cName === "RunningCd") {
                //   console.log(this.options)
                // }
                return this.options[0];
              }

              // this.options = [{ id: this.value, label: this.value }]
              // if (this.prop.cName === "RunningCd") {
              //   console.log(this.options)
              // }
              // return this.options[0]
            }
          }
        }
      },
      set: function(newValue) {
        if (!newValue || newValue == null || newValue == "") {
          this.value = "";
        } else {
          this.value = newValue.id;
        }
      }
    }
  },
  methods: {
    focus() {
      this.$nextTick().then(() =>
        document.getElementById(this.prop.cName).focus()
      );
    },
    onClear() {
      this.selected = { id: "", label: "" };
      this.$emit("change", { id: "", label: "" });
      // this.$emit('doClear')
    },
    doDoubleClick() {},
    UpdateValue($event) {
      // console.log($event)
      if (!$event) return;

      if ($event == "") {
        this.value = "";
      } else {
        this.value = $event.id;
      }

      // if (!this.isLoadData) {
      this.$emit("change", $event);
      // }
    },
    onSearch: function(search, loading) {
      if (!this.prop.cStatic) {
        if (this.prop.cAsync) {
          this.getData(search, loading);
        }
      }
    },
    onFocus: function(search, loading) {
      if (!this.prop.cStatic) {
        if (!this.prop.cAsync) {
          if (!this.getStatusError) {
            this.getData(search, loading);
          } else {
            // this.options = []
            this.$store.commit("setStatusError", false);
          }
        }
      }
    },

    getData(search, loading) {
      this.isLoadData = true;
      if (loading) loading(true);

      var d = this.prop.cDefault ? this.prop.cDefault : "";

      if (this.prop.cAsync) {
        if (search.length > 2) {
          this.prop.dataLookUp.ParamWhere = search;
        } else {
          if (loading) loading(false);
          return;
        }
      } else {
        this.prop.dataLookUp.ParamWhere = "";
      }

      var param = {
        LookUpCd: this.prop.dataLookUp.LookUpCd,
        ColumnDB: this.prop.dataLookUp.ColumnDB,
        InitialWhere: this.prop.dataLookUp.InitialWhere,
        ParamWhere: this.prop.dataLookUp.ParamWhere,
        UserId: this.getDataUser().user_id,
        PortfolioCd: this.getDataUser().portfolio_cd,
        SubPortfolioCd: this.getDataUser().subportfolio_cd
      };
      // alert(JSON.stringify(param,null,2))
      this.postEncode(this.getUrlLookup(), param).then(response => {
        if (loading) loading(false);
        if (response == null) return;

        this.options = response.Data;

        if (this.options.length > 0) {
          if (this.options.length == 1 && this.onChangeTriggered) {
            this.selected = this.options[0];
          } else if (d !== "") {
            var index = this.options
              .map(d => {
                return d.id;
              })
              .indexOf(d);
            this.selected = this.options[index];
          }
        }
        this.onChangeTriggered = false;
      });
    },

    doShowMaster() {
      // if (this.prop.cProtect == true) return

      this.masterUrlPopUp(
        `${window.location.origin}` + this.oid,
        "",
        "1000",
        "600",
        this.prop.cName
      );
    },
    openLookup() {
      this.$refs.modalLookup.show();
    },
    closeLookup() {
      this.$refs.modalLookup.hide();
    }
  },
  created() {
    if (this.prop.cStatic === undefined || this.prop.cStatic === null) {
      this.prop.cStatic = false;
      // this.tempInitialWhere = this.prop.dataLookUp.InitialWhere
    }

    if (this.prop.cStatic === true) {
      // alert(this.prop.cName)
      // console.log('prop', this.prop.cOption)
      this.options = this.prop.cOption;
      this.isLoadData = true;
      // console.log('option', this.options)
    }

    this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 4;
    this.prop.cTriggered = this.prop.cTriggered ? this.prop.cTriggered : false;
    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false;
    this.prop.cAsync = this.prop.cAsync ? this.prop.cAsync : false;
    this.prop.cFilter = this.prop.cFilter ? this.prop.cFilter : true;
    this.prop.cVisible =
      this.prop.cVisible === undefined ? true : this.prop.cVisible;

    // get max, for maxlength
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

    this.prop.cMasterUrl =
      this.prop.cMasterUrl == "" ? undefined : this.prop.cMasterUrl;

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
  },
  mounted() {},
  beforeDestroy() {}
};
</script>

<style scoped>
select.styles {
  /* cursor: move; */
  position: relative;
  display: block;
  padding: 10px 15px;
  margin-bottom: -1px;
  background-color: #fff;
  border: 1px solid #ddd;
  font-size: 11px;
}

option.opt {
  padding: 10px 15px;
}

.v-select {
  font-size: 11px;
}
</style>