<template>
  <span id="ABSSelectList">
    <b-modal
      id="modalLookup"
      :hide-footer="true"
      :hide-header-close="true"
      size="lg"
      ref="modalLookup"
      class="modal-customize-abs"
      style="position:absolute;"
      >
      <b-row>
        <b-col sm="12" style="margin-left: 10px;margin-bottom: 10px;">
          <!-- <div class="modal-customize-abs__modal-header">
            <div class="modal-customize-abs__modal-header--title">
              Lookup {{prop.cLabel}}
            </div>
            <div
              class="modal-customize-abs__modal-header--icon"
              @click="$refs.modalLookup.hide()"
            >
              <i class="icon-close"></i>
            </div>
          </div> -->
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
              </div> -->
              <div class="table--list">                
              <ABSInputSelectListDetail
                    :dataLookUp="prop.dataLookUp"
                    :title="prop.cLabel"
                    :TrxAnalysisCategory="TrxAnalysisCategory"
                    :isTAnalysis="isTAnalysis"
                    :urlApi="urlApi"
                    @rowDblClicked="doDoubleClick"
                    :cName="prop.cName"
                />
              </div>
            <!-- </div> -->
          </div>
        </b-col>
      </b-row>
    </b-modal>
    <b-row v-if="prop.cVisible && prop.cIsAlwaysShow">
      <b-col :md="prop.cLabelSize" class="lbl-col-align">
        <template v-if="languageStatus">
          <label class="lbl-text-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} </label>
        </template>
        <template v-else>
          <label class="lbl-text-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} </label>
        </template>
      </b-col>
      <b-col>
        <b-form-input
          v-validate="prop.cValidate"
          :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
          type="text"
          v-bind:name="prop.cName"
          v-bind:data-vv-as="prop.cLabel"
          v-model="label"
          class="text-field-form-list"
          :tabindex="prop.cOrder"
          :readonly="true"
          :ref="prop.cName"
          :id="prop.cName"
          :style="inputStatus=='edit' && prop.cKey || prop.cProtect ? 'background-color:  #e9ecef; padding-right:36px !important;' : 'background-color: #FFF; padding-right:36px !important;'"
          :disabled="prop.cKey || prop.cProtect"
          @click.native="openLookup"
        />
        <span v-show="label!='' " @click="clear" class="clear">&times;</span>
        <i @click="openLookup" role="presentation" class="open-indicator"></i>

        <span v-show="inputStatus!=='view' && errors.has(prop.cParentForm+'.'+prop.cName)"
            class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
        </span>
        <!-- <label class="lbl-value-view-form" v-show="inputStatus=='view'">{{label}}</label> -->
      </b-col>
      <b-col md="1">
        <div class="add-icon--plus" v-show="prop.cMasterUrl!=undefined" @click="doShowMaster">
          <!-- <i class="icon-plus"></i> -->
          <font-awesome-icon icon="plus" class="icon-style-1" style="margin: 0px; font-size: 17px;" />
        </div>
        <b-form-input v-show="false"
          type="text"
          :id="prop.cName + 'passingHidden'"
          :name="prop.cName + 'passingHidden'"
          v-model="passingHiddenData" />
      </b-col>
    </b-row>
    <b-row v-else-if="prop.cVisible">
      <b-col :md="prop.cLabelSize" class="lbl-col-align">
        <template v-if="languageStatus">
          <label v-show="inputStatus=='new' || inputStatus=='edit'" class="lbl-text-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} </label>
          <label v-show="inputStatus=='view'" class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} </label>
        </template>
        <template v-else>
          <label v-show="inputStatus=='new' || inputStatus=='edit'" class="lbl-text-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} </label>
          <label v-show="inputStatus=='view'" class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} </label>
        </template>
      </b-col>
      <b-col md="7">
        <b-form-input
          v-show="inputStatus!=='view'"
          v-validate="prop.cValidate"
          :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
          type="text"
          v-bind:name="prop.cName"
          v-bind:data-vv-as="prop.cLabel"
          v-model="label"
          class="text-field-form-list"
          :tabindex="prop.cOrder"
          :readonly="true"
          :ref="prop.cName"
          :id="prop.cName"
          :style="inputStatus=='edit' && prop.cKey || prop.cProtect ? 'background-color:  #e9ecef; padding-right:36px !important;' : 'background-color: #FFF; padding-right:36px !important;'"
          :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect"
          @click.native="openLookup"
        />
        <span v-show="inputStatus!=='view' && label!='' " @click="clear" class="clear">&times;</span>
        <i v-show="inputStatus!=='view'" @click="openLookup" role="presentation" class="open-indicator"></i>

        <span v-show="inputStatus!=='view' && errors.has(prop.cParentForm+'.'+prop.cName)"
            class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
        </span>
        <label class="lbl-value-view-form notranslate" v-show="inputStatus=='view'">{{label}}</label>
      </b-col>
      <b-col v-if="prop.cMasterUrl!=undefined" md="1">
        <div class="add-icon--plus" v-show="inputStatus!=='view' && prop.cMasterUrl!=undefined" @click="doShowMaster">
          <!-- <i class="icon-plus"></i> -->
          <font-awesome-icon icon="plus" class="icon-style-1" style="margin: 0px; font-size: 17px;" />
        </div>
        <b-form-input v-show="false"
          type="text"
          :id="prop.cName + 'passingHidden'"
          :name="prop.cName + 'passingHidden'"
          v-model="passingHiddenData" />
      </b-col>
    </b-row>
  </span>
</template>

<script>
export default {
  // name: 'FormSelect',
  model: {
    event: 'change',
  },
  props: {
    prop: {
        dataLookUp : {
            LookUpCd: String,
            ColumnDB: String,
            InitialWhere: String,
            ParamWhere: String,
            OrderBy: String,
            ParamView: String,
            SourceField: String,
            DisplayLookUp: String
        },
        // propList: {
        //   initialWhere: "",
        //   LineNo: 0,
        //   PageLevel: this.PageLevel,
        //   TabIndex: this.TabIndex
        // },
        cValidate: String,
        cName: String,
        cLabel: String,
        ckey: Boolean,
        cLabelSize: String,
        cOrder: Number,
        cTriggered: Boolean,
        cDefault: String,
        cProtect: Boolean,
        cVisible: Boolean,
        cAsync: Boolean,
        cPageLevel: String,
        cTabIndex: String,
        cParentForm: String,
        cStatic: Boolean,
        cOption: Array,
        cMasterUrl: String,
        cParamUrl: String,
        cDisplayColumn: String,
        cIsAlwaysShow: Boolean
    },
    label: {type: String, default: ''},
    // value: {type: String, default: ''},
    // T Analysis param
    isTAnalysis: {type:Boolean, default: false},
    urlApi: String,
    TrxAnalysisCategory: {type: String, default: ''},
    index: Number
  },
  data() {
    return {
      options: [],
      isRequired: false,
      onChangeTriggered: false,
      action: [],
      oid: '',
      passingHiddenData: '',
      isLookUpOpen:0
    }
  },
  watch: {
    passingHiddenData: function (newData, oldData) {
      // console.log('watch',newData)
      var dt = JSON.parse(newData)
      console.log(dt)
      console.log('wacth')
      this.label = dt.label
      this.isLookUpOpen = dt.isLookUpOpen
      if(dt.id != ""){
        this.$emit('change', JSON.parse(newData))
      }
      
    }
  },
  computed: {
    inputStatus() {
      this.$validator.pause()
      this.$nextTick(() => {
        this.$validator.errors.clear(this.prop.cParentForm)
        this.$validator.resume()
      })
      // return this.$store.getters.getStatus

      if (this.$store.getters.getLevel == this.prop.cPageLevel && this.$store.getters.getTab == this.prop.cTabIndex) {
        return this.$store.getters.getStatus
      }
      else {
        return 'view'
      }
    },
    languageStatus () {
      return this.$store.getters.languageStatus
    }
  },
  methods: {
    focus() {
      this.$nextTick().then(() => document.getElementById(this.prop.cName).focus())
    },
    doDoubleClick(record, index) {
      var label = ''
      // remove json yang urutan json keynya ke 1 (dimulai dari 0) jadi id
      // (contoh json=> { id: 1, debtorCd: "0004", debtorName: "PT. Asik Asik" }
      // nah si debtorCd: "0004" diganti keynya jadi id: "0004"

      var displayColumn = this.prop.cDisplayColumn.split(',')

      if (!record.separator || record.separator == '') {
        record.separator = '|'
      }

      var keys = Object.keys(record)
      for (var j = 0; j < keys.length; j++) {

        // add label to display column textbox
        displayColumn.forEach(el => {
          if (keys[j] == el.trim()) {
            label += record[keys[j]] + ' ' + record.separator + ' '
          }
        })

        if (j == 1) {
          record.id = record[keys[j]]
          // delete record[keys[j]]
        }
      }
      // replace | terakhir string
      if (label.includes(' ' + record.separator + ' ')) {
        label = label.substring(0, label.length - 3);
      }
      record.label = label
      record['_index'] = this.index
      
      if (this.isTAnalysis) {
        record['_index'] = this.index
        
        if (this.prop.cName.includes('From')) {
          this.$emit('changeFrom', record)
        } else {
          this.$emit('changeTo', record)
        }
      }
      
      this.$emit('change', record)
      this.closeLookup()
    },
    doShowMaster() {
      if (this.inputStatus=='edit' && this.prop.cKey || this.prop.cProtect) return
        var dd = ''
      if(this.prop.cParamUrl !== undefined && this.prop.cParamUrl !==''){
        dd = '&'+this.prop.cParamUrl
      }

      if(this.isLookUpOpen==0){
            this.masterUrlPopUp2(        
            `${window.location.origin}` + this.oid +dd,
            '',
            '1000',
            '600',
            this.prop.cName
          )
      }
      
      this.isLookUpOpen = 1
    },
    masterUrlPopUp2 (url, title, w, h, from) {
      let dualScreenLeft = window.screenLeft !== undefined ? window.screenLeft : window.screenX
      let dualScreenTop = window.screenTop !== undefined ? window.screenTop : window.screenY

      let width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width
      let height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height

      let left = ((width / 2) - (w / 2)) + dualScreenLeft
      let top = ((height / 2) - (h / 2)) + dualScreenTop
      
      var newWindow = window.open(url + '&isPopup=true&from=' + from, title, 'toolbar=0,scrollbars=yes, resizable=no,location=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left)

      console.log(url + '&isPopup=true&from=' + from, title, 'toolbar=0,scrollbars=yes, resizable=no,location=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
      // let newWindow = window.open(url  + '&isPopup=true&from=' + from, title, '', 'height=300,width=700,left=50,top=50,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes')
      // setTimeout(() => {
      //   newWindow.document.getElementById('sidebar-app').style.display = 'none'
      //   newWindow.document.getElementById('header--top').style.display = 'none'
      //   newWindow.document.getElementById('content-app').style.paddingLeft = '0px'
      // }, 2000) 
           
      newWindow.onbeforeunload = function (from) {
        var Js = {}
          // processing event here
          // console.log(from)
          // console.log(from.target.URL)
          var url_string = from.target.URL//"http://www.example.com/t.html?a=1&b=3&c=m2-m3-m4-m5"; //window.location.href
          var url = new URL(url_string);
          var c = url.searchParams.get("from");
          console.log(c)
          this.isLookUpOpen = 0
          var pHidden = window.document.getElementById(c+'passingHidden')
          var dataHidden = pHidden.value
          if(dataHidden.length>0){
            Js = JSON.parse(dataHidden)
            Js['isLookUpOpen'] = 0
            console.log(Js)
            console.log('beforeunload')
            
            pHidden.value = JSON.stringify(Js)//dataHidden
            // dataHidden =''
          }else{
            pHidden.value = '{"id":"","label":"","_from":"'+c+'","isLookUpOpen":0}'

          }
          pHidden.dispatchEvent(new Event('change'))
          
      }
      if (window.focus) {
        newWindow.focus()
      }
    
    },
    
    openLookup() {
      if (this.inputStatus=='edit' && this.prop.cKey || this.prop.cProtect) return

      if (this.isTAnalysis) {
        this.getDataTAnalysis()
      } else {
        this.getData()
      }
      this.$refs.modalLookup.show()
      this.$refs.modalLookup.$children[0].doCursorSearch()
      // this.$refs.modalLookup.$children[0].doGetList('', 'initial')
    },
    clear () {
      if (this.inputStatus=='edit' && this.prop.cKey || this.prop.cProtect) return
      this.label = ''
      var record = {
        id: '',
        label: ''
      }
      if (this.isTAnalysis) {
        record['_index'] = this.index

        if (this.prop.cName.includes('From')) {
          this.$emit('changeFrom', record)
        } else {
          this.$emit('changeTo', record)
        }
      }
      
      this.$emit('change', record)
    },
    closeLookup() {
      this.$refs.modalLookup.hide();
    },
    getData() {
        var d = this.prop.cDefault ? this.prop.cDefault : ''

        // this.prop.dataLookUp.UserId = this.getDataUser().user_id
        // this.prop.dataLookUp.PortfolioCd = this.getDataUser().portfolio_cd
        // this.prop.dataLookUp.SubPortfolioCd = this.getDataUser().subportfolio_cd

        this.$refs.modalLookup.$children[0].dataLookUp.UserId = this.getDataUser().user_id
        this.$refs.modalLookup.$children[0].dataLookUp.PortfolioCd = this.getDataUser().portfolio_cd
        this.$refs.modalLookup.$children[0].dataLookUp.SubPortfolioCd = this.getDataUser().subportfolio_cd

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
        this.$refs.modalLookup.$children[0].fields = []
        this.$refs.modalLookup.$children[0].items = []
        this.$refs.modalLookup.$children[0].perPage = 20
        this.$refs.modalLookup.$children[0].currentPage = 1
        this.$refs.modalLookup.$children[0].lastPage = 1
        this.$refs.modalLookup.$children[0].totalRows = 0
        this.$refs.modalLookup.$children[0].searchValue = ''
        this.$refs.modalLookup.$children[0].inAdvance = false
        this.$refs.modalLookup.$children[0].tandanya = '='
        this.$refs.modalLookup.$children[0].filteran = ''
        this.$refs.modalLookup.$children[0].sortedField = []
        this.$refs.modalLookup.$children[0].sort = "";
        this.$refs.modalLookup.$children[0].sort = this.prop.dataLookUp.OrderBy
        this.$refs.modalLookup.$children[0].doGetList('', 'initial')
    },
    getDataTAnalysis() {
      var d = this.prop.cDefault ? this.prop.cDefault : ''

      this.$refs.modalLookup.$children[0].dataLookUp.UserId = this.getDataUser().user_id
      this.$refs.modalLookup.$children[0].dataLookUp.PortfolioCd = this.getDataUser().portfolio_cd
      this.$refs.modalLookup.$children[0].dataLookUp.SubPortfolioCd = this.getDataUser().subportfolio_cd

      this.$refs.modalLookup.$children[0].fields = []
      this.$refs.modalLookup.$children[0].items = []
      this.$refs.modalLookup.$children[0].perPage = 20
      this.$refs.modalLookup.$children[0].currentPage = 1
      this.$refs.modalLookup.$children[0].lastPage = 1
      this.$refs.modalLookup.$children[0].totalRows = 0
      this.$refs.modalLookup.$children[0].searchValue = ''
      this.$refs.modalLookup.$children[0].inAdvance = false
      this.$refs.modalLookup.$children[0].tandanya = '='
      this.$refs.modalLookup.$children[0].filteran = ''
      this.$refs.modalLookup.$children[0].sortedField = []
      this.$refs.modalLookup.$children[0].sort = this.prop.dataLookUp.OrderBy
      this.$refs.modalLookup.$children[0].doGetList('', 'initial')
    },
    checkPropDisplayColumn() {
      if (this.prop.cDisplayColumn) {
        this.alertWarning('Please check prop cDisplayColumn on ' + this.prop.cLabel)
        return
      }
    }
  },
  created () {
    // if (this.prop.cVisible != false || this.prop.cVisible != true) {
    //   this.prop.cVisible = true
    // }

    if (this.prop.cVisible == undefined) {
      this.prop.cVisible = true
    }
    if (this.prop.cIsAlwaysShow != false || this.prop.cIsAlwaysShow != true) {
      this.prop.cIsAlwaysShow = false
    }
  },
  mounted () {
    this.$validator.extend('cRequired', {
      getMessage (field, args) {
        // vm.cRequiredMsg = args[0]
        return args[0]
      },
      validate (value, args) {
        // vm.cRequiredMsg = args[0]
        return true
      }
    })
    var ccx = {
      custom: {}
    }

    if (this.prop.cStatic == undefined || this.prop.cStatic == null) {
      this.prop.cStatic = false
    }
    else {
      if (this.prop.cStatic){
        this.options = this.prop.cOption
      }
    }
    this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 4
    this.prop.cTriggered = this.prop.cTriggered ? this.prop.cTriggered : false
    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false
    this.prop.cAsync = this.prop.cAsync ? this.prop.cAsync : true
    // this.prop.cVisible = this.prop.cVisible == undefined || this.prop.cVisible == null ? true : this.prop.cVisible
    // this.prop.cIsAlwaysShow = this.prop.cIsAlwaysShow ? this.prop.cIsAlwaysShow : false

    this.prop.cMasterUrl = this.prop.cMasterUrl == '' ? undefined : this.prop.cMasterUrl

    if (this.prop.cValidate !== undefined && this.prop.cValidate !== null && this.prop.cValidate !== '') {
      var str_array = this.prop.cValidate.split('|')
      for (var i = 0; i < str_array.length; i++) {
        var s = str_array[i].split(':')
        if(s[0] == 'required' || s[0] == 'cRequired') {
          this.isRequired = true
          if (s[0] == 'cRequired') {
            ccx.custom[this.prop.cName] = {
              'required' : s[1]
            }

            this.$validator.localize('en', ccx)
          }
        }
        else {
          this.isRequired = false
        }
      }
    }

    // untuk ambil oid
    var event = this.getMenu().event_with_child
    
    var url = this.prop.cMasterUrl + '?oid='
    var oi = ''
    var arrFilter = event.filter(function(menu) {

      var x = menu.child.filter(function(child) {
        var menu = child.menu_url
        if (menu.includes(url)) {
          oi = menu
          // return menu
        }
      })
      // if (x.length > 0) {
      //   return x[0].menu_url
      // }
    })
    
        this.oid = oi
        
    
    

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
  beforeDestroy () {
  }
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


    position:absolute !important; 
    right: 30px !important; 
    top:0 !important;  
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
    display: flex;
    align-items: center;
    cursor: pointer;
    pointer-events: all;
    transition: all 150ms cubic-bezier(1.000, -0.115, 0.975, 0.855);
    transition-timing-function: cubic-bezier(1.000, -0.115, 0.975, 0.855);
    opacity: 1;
    width: 12px; /* To account for extra width from rotating. */

    position:absolute !important; 
    right: 12px !important; 
    top:0 !important;  
    margin-top: 2px !important;
    display: inline-block;
    margin-right: 0px !important;
    height: 10px !important;
  }
  .open-indicator:before {
    border-color: rgba(60, 60, 60, .5);
    border-style: solid;
    border-width: 3px 3px 0 0;
    content: '';
    display: inline-block;
    height: 10px;
    width: 10px;
    vertical-align: text-top;
    transform: rotate(133deg);
    transition: all 150ms cubic-bezier(1.000, -0.115, 0.975, 0.855);
    transition-timing-function: cubic-bezier(1.000, -0.115, 0.975, 0.855);
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