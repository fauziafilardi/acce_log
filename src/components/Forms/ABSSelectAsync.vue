<template>
  <span id="ABSSelectAsycn">
  <!-- <select
    class="styles"
    :multiple="multiple"
    :size="size"
    v-model="selected"
    @change="updateValue"
  >
    <option
      disabled
      value=""
      v-text="disabledOption"
      v-if="disabledOption!=''"
    />
    <option
      class="opt"
      v-for="option in options"
      :key="option.value"
      :value="option.value"
      :disabled="option.disabled"
      :style="option.style"
      v-text="option.key"
      @change="updateValue"
    />
  </select> -->

    <!-- <b-form-select v-model="selected" :options="options" @change="updateValue" /> -->
    <!-- <div id="ABSSelectAsycn"> -->
    <b-row>
      <b-col :md="prop.cLabelSize" class="lbl-col-align">
        <label class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span>{{ prop.cLabel }}:&nbsp;</label>
      </b-col>
      <b-col>
        <v-select v-show="isNew"
        label="label"
        :filterable="false"
        :options="options"
        @search="onSearch"
        @change.native="UpdateValue"
        v-model="selected"
        class="abs-custom-select-async"
        v-validate="prop.cValidate"
        v-bind:name="prop.cName"
        :tabindex="prop.cOrder"
      >
        <!-- <v-select 
                  label="label"
                  :options="options"
                  style="height:22px !important; font-size:12px !important;"
                  > -->

                  <!-- {{selected}} -->
          <!-- <div class="spinner" v-show="spinner">Loading...</div> -->
          <!-- {{fieldChild}} -->
          <template slot="no-options">
            type to search...
          </template>
          <!-- <template slot="options" slot-scope="option" style="font-size:12px;">
            <div>{{option.code}}</div>
            <div>{{option.desc}}</div>
          </template> -->
        </v-select>
        <label v-show="!isNew">{{selected}}</label>
      </b-col>
    </b-row>
    <!-- </div> -->
  </span>
</template>

<script>
// Vue.component('v-select',VueSelect.VueSelect)

// new Vue({
//   el: '#ABSSelectAsycn',
//   data: {
//     options:[
//       {
//         code: 'CODE',
//         desc: 'Description'
//       }
//     ]
//   }
// })

export default {
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
      cOrder: Number
    },
    // xyz: prop.InitialWhere
  },
  data() {
    return {
      selected: {},
      isNew: false,
      options: [],
      isRequired: false
    }
  },
  created: function() {
    this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 4

    // get max, for maxlength
    var str_array = this.prop.cValidate.split('|')
    for (var i = 0; i < str_array.length; i++) {
      var s = str_array[i].split(':')
      if(s[0] == 'required') {
        this.isRequired = true
      }
    }

    // if(this.size == 0) alert('Max Length Should Be Fill')
  },
  mounted: function () {
    if(this.getStatusForm() == 'new') {
      this.isNew = true
    }
  },
  methods: {
    UpdateValue() {
      // console.log('allData',this.options)
      console.log('data',this.selected)
      // console.log('selectedVar',this.selected)
      // this.$emit('change', this.selected)
    },
    onSearch: function(search, loading) {
      loading(true);
      // this.search(loading, search, this);
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
  },
  // watch: {
  //   xyz: function (newData, oldData) {
  //     // this.$emit('input', newData)
  //     alert(newData)
  //     this.prop.InitialWhere = newData
  //   }
  // }
};
</script>