<template>
<b-row>
      <b-col :md="prop.cLabelSize">
        <label class="lbl-view-form">{{ prop.cLabel }} <span v-if="isRequired" style="color:red;">*</span>:&nbsp;</label>
      </b-col>
      <b-col>
        <select
            class="abs-custom-select-async"
            :multiple="false"
            v-model="selected"
            v-validate="prop.cValidate"
            v-show="isNew"
            label="label"
            @change="updateValue"
            v-bind:name="prop.cName"
            :tabindex="prop.cOrder"
            :value="selected"
        >
            <!-- <option
                disabled
                value=""
                v-text="disabledOption"
                v-if="disabledOption!=''"
            /> -->
            <option
                class="opt"
                v-for="option in options"
                :key="option.id"
                :value="option.id"
                :disabled="option.disabled"
                :style="option.style"
                v-text="option.label"
            />
        </select>
        <label v-show="!isNew">{{selected}}</label>
      </b-col>
</b-row>
</template>

<script>
import { EventBus } from '../../main';
export default {
  name: 'FormSelect',
  model: {
    event: 'change',
  },
  props: {
    prop: {
        dataLookUp : {
            OptionSeq: Number,
            UserId: String,
            LineNo: Number,
            SubPortfolioCd: String,
            PortfolioCd: String,
            ColumnDB: String,
            InitialWhere: String,
            ParamWhere: String
        },
        cValidate: String,
        cName: String,
        cLabel: String,
        cLabelSize: String,
        cOrder: Number,
        cTriggered: Boolean
    },
  },
  data() {
    return {
      selected: null,
      isNew: false,
      options: [],
      isRequired: false,
      onChangeTriggered: false
    };
  },
  watch: {
  },
  computed: {
  },
  methods: {
    updateValue() {
        var index = this.options.map(d => {return d.id}).indexOf(this.selected)
        // console.log('dataSelected',this.options[index])
        this.$emit('change', this.options[index])
    },
    getData() {
        this.postEncode(this.getUrlLookup(), this.prop.dataLookUp)
        .then((response) => {
            if(response == null) return

            this.options = response.Data

            if(this.options.length > 0 && this.onChangeTriggered){
                this.selected = response.Data[0].id
            }

            this.onChangeTriggered = false
        })
    },
    // onCallBack(from, data){
    //     var index = this.options.map(d => {return d.id}).indexOf(data)
    //     var cb = {'from': from, 'data': this.options[index]}

    //     this.$emit('ebAfter'+this.prop.cName, cb)
    // }
  },
  created(){
    this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 5
    this.prop.cTriggered = this.prop.cTriggered ? this.prop.cTriggered : false

    // get max, for maxlength
    var str_array = this.prop.cValidate.split('|')
    for (var i = 0; i < str_array.length; i++) {
      var s = str_array[i].split(':')
      if(s[0] == 'required') {
        this.isRequired = true
      }
    }

    // if(this.size == 0) alert('Max Length Should Be Fill')

    EventBus.$on('ebInput', (data) => {
        this.isNew = data
    });

    EventBus.$on('ebSetValue'+this.prop.cName, (data) => {
        if(data && data != ''){
            this.selected = data
        }

        // this.onCallBack('ebSetValue', data)
    })

    EventBus.$on('ebSetInitWhere'+this.prop.cName, (data) => {
        this.prop.dataLookUp.InitialWhere = data
        this.onChangeTriggered = true
        this.getData()

        // this.onCallBack('ebSetInitWhere', data)
    })

    EventBus.$on('ebSetParamWhere'+this.prop.cName, (data) => {
        // this.prop.dataLookUp.ParamWhere
        // this.getData()

        // this.onCallBack('ebSetParamWhere', data)
    })
  },
  mounted() {
    this.getData()

    if(this.getStatusForm() == 'new') {
      this.isNew = true
    }
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