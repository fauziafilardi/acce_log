<template>
<span id="ABSSelectAsycn">
<b-row v-show="prop.cVisible">
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
      <b-col>
          <v-select v-show="inputStatus!=='view'"
                label="label"
                :filterable="false"
                :options="options"
                @search="onSearch"
                @input="UpdateValue"
                v-model="selected"
                :class="{'abs-custom-select-async': true,'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
                v-validate="prop.cValidate"
                v-bind:name="prop.cName"
                :tabindex="prop.cOrder"
                :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect"
                :searchable="prop.cAsync"
                :ref="prop.cName"
                :id="prop.cName"
            >
            <template slot="no-options">
                type to search...
            </template>
        </v-select>
        
        <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
            class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
        </span>
        <label v-show="inputStatus=='view'">{{selected?selected.label:''}}</label>
      </b-col>
</b-row>
</span>
</template>

<script>
;
export default {
  name: 'FormSelect',
  model: {
    event: 'change',
  },
  props: {
    prop: {
        dataLookUp : {
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
        cPageLevel: String,
        cTabIndex: String,
        cParentForm: String,
        cStatic: Boolean,
        cOption: Array
    },
  },
  data() {
    return {
      selected: null,
      options: [],
      isRequired: false,
      onChangeTriggered: false,
      action: []
    }
  },
  watch: {
  },
  computed: {
    inputStatus() {
      this.$validator.pause()
      this.$nextTick(() => {
        this.$validator.errors.clear(this.prop.cParentForm)
        this.$validator.resume()
      })

      if(this.$store.getters.getLevel == this.prop.cPageLevel && this.$store.getters.getTab == this.prop.cTabIndex){
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
    UpdateValue() {
      this.$emit('change', {
        value: this.selected,
        action: this.action[this.prop.cName], from: this.prop.cName + "_" + this.prop.cPageLevel + "_" + this.prop.cTabIndex
      })
    },
    onSearch: function(search, loading) {
      loading(true);
      this.search(loading, search)
    },
    getData (act = null) {
        var d = this.prop.cDefault ? this.prop.cDefault : ''

        this.postEncode(this.getUrlLookup(), this.prop.dataLookUp)
        .then((response) => {
            if(response == null) return

            this.options = response.Data
            if (this.options.length > 0) {
                
                if (this.options.length == 1 && this.onChangeTriggered){
                    this.selected = this.options[0]
                }
                else if (d !== '') {
                    var index = this.options.map(d => {return d.id}).indexOf(d)
                    this.selected = this.options[index]
                }
            }

            this.onChangeTriggered = false
        })
    },
    onCallBack(action, name, data){
        // console.log(data)
        // var index = this.options.map(d => {return d.id}).indexOf(data)
        var cb = {'action': action, 'from': name, 'data': data}
        // console.log(cb)
        // this.$emit('afterchange', cb)
        EventBus.$emit('afterChange', cb)
    },
    eventBusListener (action, data) {
      // alert(action)
      // this.inputStatus.isEdit = false
      this.inputStatus.isNew = data
      if(action == 'new'){
        this.$validator.pause()
        this.$nextTick(() => {
          this.$validator.errors.clear(this.prop.cParentForm)
          // this.$validator.fields.items.forEach(field => field.reset())
          // this.$validator.fields.items.forEach(field => this.errors.remove(field))
          this.$validator.resume()
        })
      }
      else if (action == 'edit') {
        this.inputStatus.isEdit = true
      }
      else if (action == 'cancel') {
        this.inputStatus.isEdit = false
      }
      // else if (action == 'beforeSave') {
      //   // if(this.prop.cValidate){
      //     this.$validator.validate().then((res) => { EventBus.$emit('ValidToSave_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex, {from: this.prop.cName, response: res}) })
      //   // }
      // }
      else if (action == 'save') {
        this.inputStatus.isEdit = false
      }
    }
  },
  created () {
    if(this.prop.cStatic === undefined || this.prop.cStatic === null){
      this.prop.cStatic = false
      this.getData()
    }
    else {
      this.options = this.prop.cOption
    }
    this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 4
    this.prop.cTriggered = this.prop.cTriggered ? this.prop.cTriggered : false
    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false
    this.prop.cAsync = this.prop.cAsync ? this.prop.cAsync : false
    this.prop.cVisible = this.prop.cVisible === undefined ? true : this.prop.cVisible
    // console.log(this.prop.cVisible)
    // this.prop.cVisible = this.prop.cVisible ? this.prop.cVisible : true

    // get max, for maxlength
    if(this.prop.cValidate !== undefined && this.prop.cValidate !== null && this.prop.cValidate !== ''){
      var str_array = this.prop.cValidate.split('|')
      for (var i = 0; i < str_array.length; i++) {
        var s = str_array[i].split(':')
        if(s[0] == 'required') {
          this.isRequired = true
        }
      }
    }

    // if(this.size == 0) alert('Max Length Should Be Fill')

    // EventBus.$on('ebInput', (data) => {
    //     this.inputStatus.isNew = data
    // });
    // EventBus.$on('New_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex, (data) => this.eventBusListener('new', data))

    // EventBus.$on('Edit_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex, (data) => this.eventBusListener('edit', data))

    // EventBus.$on('Cancel_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex, () => this.eventBusListener('cancel',false))

    // EventBus.$on('ebSaveSuccess_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex, () => this.eventBusListener('save',false))

    EventBus.$on('ebSetValue' + this.prop.cName + '_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex, (data) => {
      // console.log(this.prop.cName, data)
      // if(this.prop.cName == 'CreditTermsCd'){
      //   alert(data.action)
      // }

      this.action[this.prop.cName] = data.action
      if (data.data && data.data != '') {
          var index = this.options.map(d => {return d.id}).indexOf(data.data)
          if (index == -1) return
          this.selected = this.options[index]
      }
      else {
          this.selected = null
      }
    })

    EventBus.$on('ebSetInitWhere'+this.prop.cName + '_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex, (data) => {
      this.prop.dataLookUp.InitialWhere = data.data
      // console.log('setWhere'+this.prop.cName, data)
      if(data.default !== ''){
        this.prop.cDefault = data.default
      }
      this.onChangeTriggered = true
      this.getData('afterChangeWhere')
    })
  },
  mounted() {
    // this.getData()=='new'
    // this.inputStatus = this.getStatusForm()
    // if(this.getStatusForm() == 'new') {
    //   this.inputStatus = 'new'
    // }
  },
  beforeDestroy () {
    // EventBus.$off('New_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex)

    // EventBus.$off('Edit_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex)

    // EventBus.$off('Cancel_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex)

    // EventBus.$off('ebSaveSuccess_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex)

    EventBus.$off('ebSetInitWhere'+this.prop.cName + '_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex)

    EventBus.$off('ebSetValue'+this.prop.cName + '_' + this.prop.cPageLevel + '_' + this.prop.cTabIndex)
  }
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
    }

    option.opt {
        padding: 10px 15px;
    }
</style>