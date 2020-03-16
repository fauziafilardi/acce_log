<template>
<span id="ABSSelectAsycn">
<b-row v-show="prop.cVisible">
      <b-col :md="prop.cLabelSize" class="lbl-col-align">
        <label class="text-field-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} :&nbsp;</label>
      </b-col>
      <b-col>
        <v-select
                label="label"
                :filterable="false"
                :options="options"
                @input="UpdateValue"
                v-model="selected"
                :class="{'abs-custom-select-async': true,'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
                v-validate="prop.cValidate"
                v-bind:name="prop.cName"
                :tabindex="prop.cOrder"
                :searchable="false"
                :ref="prop.cName"
                :id="prop.cName"
            >
        </v-select>
        <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
            class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
        </span>
      </b-col>
</b-row>
</span>
</template>

<script>
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
        cParentForm: String
    },
    value: {type: [String, Number], default: ''}
  },
  data() {
    return {
    //   selected: null,
      options: [],
      isRequired: false,
      onChangeTriggered: false,
      isEdit: false,
      action: []
    };
  },
  watch: {
  },
  computed: {
      selected: {
        get: function(el) {
            if (this.value == "" || this.value == null){
                this.$validator.pause()
                this.$nextTick(() => {
                    this.$validator.errors.clear(this.prop.cParentForm+'.'+this.prop.cName)
                    this.$validator.resume()
                })
                
                return null
            }
            else {
            return this.options[this.options.map(x => x.id).indexOf(this.value)]
            }
        },
        set: function(newValue) {
            if (newValue !== null) {
                this.value = newValue.id
            }
            else {
                this.value = ""
            }
        }
    }
  },
  methods: {
    UpdateValue($event) {
        // this.$emit('change', {value: this.selected, action: this.action[this.prop.cName], from: this.prop.cName + "_" + this.prop.cPageLevel + "_" + this.prop.cTabIndex})
        if (!$event) return

        this.value = $event.id

        this.$emit('change', $event)
    },
    onSearch: function(search, loading) {
      loading(true);
      this.search(loading, search)
    },
    search: function(loading, search) {
      this.prop.dataLookUp.ParamWhere = search
      this.postEncode(this.getUrlLookup(), this.prop.dataLookUp)
      .then((response) => {
        if(response == null) {
          loading(false)
          return
        }
        this.options = response.Data
        loading(false)
      })
    },
    getData(act=null) {
        var d = this.prop.cDefault ? this.prop.cDefault : ''

        var param = {
            LookUpCd: this.prop.dataLookUp.LookUpCd,
            ColumnDB: this.prop.dataLookUp.ColumnDB,
            InitialWhere: this.prop.dataLookUp.InitialWhere,
            ParamWhere: this.prop.dataLookUp.ParamWhere,
            UserId: this.getDataUser().user_id,
            PortfolioCd: this.getDataUser().portfolio_cd,
            SubPortfolioCd: this.getDataUser().subportfolio_cd
        }
        
        this.postEncode(this.getUrlLookup(), param)
        .then((response) => {
            if(response == null) return

            this.options = response.Data
            if (this.options.length > 0) {
                
                if (this.options.length == 1 && this.onChangeTriggered){
                    this.selected = this.options[0]

                }
                else if (d !== '') {
                    var index = this.options.map(d => {return d.id}).indexOf(d)
                    // if (index == -1) return
                    this.selected = this.options[index]
                }
            }

            this.onChangeTriggered = false
        })
    }
  },
  created () {
    this.getData()
    this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 4
    this.prop.cTriggered = this.prop.cTriggered ? this.prop.cTriggered : false
    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false
    this.prop.cAsync = this.prop.cAsync ? this.prop.cAsync : false
    this.prop.cVisible = this.prop.cVisible === undefined ? true : this.prop.cVisible

    // get max, for maxlength
    var str_array = this.prop.cValidate.split('|')
    for (var i = 0; i < str_array.length; i++) {
      var s = str_array[i].split(':')
      if(s[0] == 'required') {
        this.isRequired = true
      }
    }

  },
  mounted() {
  },
  beforeDestroy () {
  }
};
</script>

<style scoped>
    select.styles {
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