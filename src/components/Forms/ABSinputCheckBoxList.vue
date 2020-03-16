<template>
  <span>
    <b-row v-show="prop.cVisible">
      <b-col :md="prop.cLabelSize" class="lbl-col-align">
        <!-- <label v-show="inputStatus=='new' || inputStatus=='edit'" class="text-field-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} :&nbsp;</label>
        <label v-show="inputStatus=='view'" class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} :&nbsp;</label> -->

        <label v-show="inputStatus=='new' || inputStatus=='edit'" class="text-field-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} <span v-if="prop.cName && prop.cName!=''"></span> </label>
        <label v-show="inputStatus=='view'" class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} <span v-if="prop.cName && prop.cName!=''"></span> </label>
      </b-col>
      <!-- <b-col :md="prop.cLabelSize" class="lbl-col-align">
        <label v-show="inputStatus=='new' || inputStatus=='edit'" class="text-field-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} <span v-if="prop.cName && prop.cName!=''">:&nbsp;</span> </label>
        <label v-show="inputStatus=='view'" class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} <span v-if="prop.cName && prop.cName!=''">:&nbsp;</span> </label>
      </b-col>
      <b-col>
        <b-form-checkbox-group 
            :name="prop.cName"
            :options="prop.cOptions"
            :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect || inputStatus=='view'"
            v-model="selected"
            @input="handleInput">
        </b-form-checkbox-group>

          <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
            class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
          </span>
      </b-col> -->
      <!-- <b-col class="lbl-col-align">
      </b-col> -->
      <b-col>
          <b-form-checkbox-group
              :size="prop.cSize"
              :disabled="inputStatus=='view' ? true : false"
              @input="handleInput"
              v-model="dataChkBox"
              v-for="(chkbox, index) in prop.cOptions"
              :key="index">
              
              <template v-if="computedClass(index + 1) == 'genap'">
                  <b-row>
                      <b-col md="6" style="padding-left: 40px !important;">
                          <b-form-checkbox :value="prop.cOptions[index - 1].ItemValue">{{prop.cOptions[index - 1].ItemText}}</b-form-checkbox>
                      </b-col>
                      <b-col md="6">
                          <b-form-checkbox :value="chkbox.ItemValue">{{chkbox.ItemText}}</b-form-checkbox>
                      </b-col>
                  </b-row>
              </template>

              <!-- jika terakhir dan ganjil -->
              <template v-if="index == prop.cOptions.length - 1">
                <template v-if="computedClass(index + 1) == 'ganjil'">
                  <b-row>
                      <b-col md="6" style="padding-left: 40px !important;">
                          <b-form-checkbox :value="chkbox.ItemValue">{{chkbox.ItemText}}</b-form-checkbox>
                      </b-col>
                  </b-row>
                </template>
              </template>
            </b-form-checkbox-group>
        <!-- </b-form-group> -->
        <!-- <hr>
        <div>Selected: <strong>{{ selected }}</strong></div> -->
      </b-col>
    </b-row>
  </span>
</template>

<script>
export default {
  props: {
    prop: {
      cValidate: String,
      cName: String,
      cLabel: String,
      cLabelSize: Number,
      cOptions: Array,
      cOrder: Number,
      cKey: Boolean,
      cVisible: Boolean,
      cProtect: Boolean,
      cPageLevel: String,
      cTabIndex: String,
      cParentForm: String,
      cDataShowInRow: Number,
      cValue: Array,
      cSize: String
    }
  },
  computed: {
    inputStatus() {
      this.$validator.pause()
      this.$nextTick(() => {
        this.$validator.errors.clear(this.prop.cParentForm)
        this.$validator.resume()
      })

      if (this.$store.getters.getLevel == this.prop.cPageLevel && this.$store.getters.getTab == this.prop.cTabIndex){
        return this.$store.getters.getStatus
      }
      else {
        return 'view'
      }
    }
  },
  data() {
    return {
      // selected: null,
      isRequired: false,
      dataChkBox: []
    };
  },
  // watch: {
  //   selected: function(newData, oldData) {
  //     this.$emit('change', newData)
  //   }
  // },
  methods: {
    handleChange (checked) {

    },
    handleInput () {
      this.$emit('input', this.dataChkBox)
    },
    computedClass(index) {
      // return "data_" + Math.ceil((index + 1) / 2)
      // return + Math.ceil((index + 1) / 2)
      if (index % 2 == 0) {
        return 'genap'
      } else {
        return 'ganjil'
      }
    },
  },
  created: function() {
    this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 4
    this.prop.cVisible = this.prop.cVisible === undefined ? true : this.prop.cVisible
    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false
    this.prop.cSize = this.prop.cSize ? this.prop.cSize : 'md'

    if(this.prop.cValidate !== undefined && this.prop.cValidate !== null && this.prop.cValidate !== ''){
      var str_array = this.prop.cValidate.split('|')
      for (var i = 0; i < str_array.length; i++) {
        var s = str_array[i].split(':')
        if(s[0] == 'required') {
          this.isRequired = true
        }
      }
    }

    this.dataChkBox = this.cValue
  },
  mounted: function () {
  }
}
</script>