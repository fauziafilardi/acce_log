<template>
  <span>
    <b-row v-if="prop.cVisible">
      <b-col :md="prop.cLabelSize" class="lbl-col-align">
        <template v-if="languageStatus">
          <label v-show="inputStatus=='new' || inputStatus=='edit'" class="text-field-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} </label>
          <label v-show="inputStatus=='view'" class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} </label>
        </template>
        <template v-else>
          <label v-show="inputStatus=='new' || inputStatus=='edit'" class="text-field-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} </label>
          <label v-show="inputStatus=='view'" class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} </label>
        </template>
      </b-col>
    </b-row>
    <b-row v-if="prop.cVisible">
      <b-col offset="1">
        <!-- <vue-editor 
            v-model="value"
            :disabled="inputStatus=='view' || inputStatus=='edit' && prop.cKey || prop.cProtect"
            :ref="prop.cName"
            :id="prop.cName"
            v-bind:data-vv-name="prop.cName"
            v-bind:data-vv-as="prop.cLabel"
            :tabindex="prop.cOrder"
            :customModules="CustomModule"
            :editorOptions="EditorSetting"
            @focus="onEditorFocus"
            @blur="onEditorBlur"
            @selection-change="onSelectionChange"
            useCustomImageHandler
            @imageAdded="handleImageAdded"
            @text-change="onTextChanged"
        ></vue-editor> -->
        <!-- <ckeditor 
          :editor="Editor" 
          v-model="value" 
          :config="EditorConfig"
          :disabled="inputStatus=='view' || inputStatus=='edit' && prop.cKey || prop.cProtect"
          :ref="prop.cName"
          :id="prop.cName"
          @ready="onEditorReady"
          @focus="onEditorFocus"
          @blur="onEditorBlur"
          @input="onEditorInput"
          @destroy="onEditorDestroy"
          v-bind:data-vv-name="prop.cName"
          v-bind:data-vv-as="prop.cLabel"
          :tabindex="prop.cOrder"
        ></ckeditor> -->
        <!-- <vue-ckeditor 
        v-model="value" 
        :config="EditorConfig"
        :id="prop.cName"
        :name="prop.cName"
        :readOnlyMode="inputStatus=='view' || inputStatus=='edit' && prop.cKey || prop.cProtect"
        @input="onEditorInput"
        @blur="onBlur($event)" 
        @focus="onFocus($event)"
        @contentDom="onContentDom($event)"
        @dialogDefinition="onDialogDefinition($event)"
        @fileUploadRequest="onFileUploadRequest($event)"
        @fileUploadResponse="onFileUploadResponse($event)" /> -->

        <!-- <summernote class="form-control"
          :name="prop.cName"
          v-model="value"
          :config="config"
          @change="onChange"
          @blur="onBlur"
        ></summernote> -->

        <textarea
          :name="prop.cName"
          :id="prop.cName"
          v-model="value"
        ></textarea>
        <!-- v-show="inputStatus!='view' || inputStatus=='edit' && !prop.cKey || !prop.cProtect" -->

        <!-- <div style="height:500px; overflow-x: auto;"
         v-show="inputStatus=='view' || inputStatus=='edit' && prop.cKey || prop.cProtect"
         v-html="value">
        </div> -->

        <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
          class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
        </span>
      </b-col>
    </b-row>
  </span>
</template>

<script>
// import VueCkeditor from 'vue-ckeditor2'
// import * from '../../assets/ckeditor/ckeditor'
// import Summernote from '../../assets/Summernote'

export default {
  components: {
    // 'summernote' : require('../../assets/Summernote')
    // Summernote
  },
  props: {
    prop: {
      cName: String,
      cLabel: String,
      cLabelSize: String,
      cOrder: Number,
      cKey: Boolean,
      cToolbar: [Array, String],
      cProtect: Boolean,
      cVisible: Boolean,
      cPageLevel: String,
      cTabIndex: String,
      cParentForm: String
    },
    value: [String, Number]
  },
  data() {
    return {
      GetDataByStatus: false,
      IsForExport: false,
      EditorConfig: {},
      config: {
        editable: false,
        toolbar: [
        //   // [groupName, [list of button]]
          ['style', ['bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear']],
          ['font', ['fontname', 'fontsize', 'color']],
          ['para', ['ul', 'ol', 'paragraph', 'height']],
          ['table', ['table']],
          ['insert', ['link', 'picture']],
          ['edit', ['undo', 'redo']],
          ['custom', ['print']]
        //   ['Style', ['style']],
        //   ['Font', ['bold','italic','underline','clear']],
        //   ['fontface', ['fontname']],
        //   ['textsize', ['fontsize']],
        //   ['Color', ['color']],
        //   ['Paragraph', ['ul', 'ol', 'hr', 'paragraph']],
        //   ['Table', ['table']],
        //   ['Insert', ['link','picture','video']],
        //   ['Misc', ['fullscreen','codeview']],
        //   ['Tools', ['undo','redo']]
        ],
        popover: false
      }
    }
  },
  watch: {
    value(newData, oldData) {
      if (this.GetDataByStatus === true) {
        $(document.getElementById(this.prop.cName)).summernote("code", newData)
        this.GetDataByStatus = false
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

      if(this.$store.getters.getLevel == this.prop.cPageLevel && this.$store.getters.getTab == this.prop.cTabIndex){
        if (this.$store.getters.getStatus == 'view' || (this.$store.getters.getStatus == 'edit' && this.prop.cKey) || this.prop.cProtect) {
          // alert('1')
          $(document.getElementById(this.prop.cName)).summernote('disable', this.IsForExport)
          // this.config.editable = false
        }
        else {
          // alert('2')
          $(document.getElementById(this.prop.cName)).summernote('enable')
          // this.config.editable = true
        }
        return this.$store.getters.getStatus
      }
      else {
        // alert('3')
        $(document.getElementById(this.prop.cName)).summernote('disable', this.IsForExport)
        // this.config.editable = false
        return 'view'
      }
    },
    languageStatus () {
      return this.$store.getters.languageStatus
    }
  },
  methods: {
    // onEditorReady(EventInfo) {
    //   this.$emit('ready', EventInfo)
    // },
    // onEditorFocus(EventInfo, data) {
    //   this.$emit('focus', data)
    // },
    // onEditorBlur(EventInfo, data) {
    //   this.$emit('blur', data)
    // },
    // onEditorInput(html) {
    //   this.$emit('input', this.value)
    // },
    // onEditorDestroy(EventInfo) {
    //   this.$emit('destroy', EventInfo)
    // },
    // onReady() {
    //   this.$emit('ready', this.value)
    // },
    // onChange(value) {
    //   // this.value = value
    //   // this.$emit('change', this.value)
    //   // console.log(this.value)
    // },
    // onBlur() {
    //   this.$emit('blur', this.value)
    // },
    // onFocus(evt) {
    //   console.log(evt);
    // },
    // onContentDom(evt) {
    //   console.log(evt);
    // },
    // onDialogDefinition(evt) {
    //   console.log(evt);
    // },
    // onFileUploadRequest(evt) {
    //   console.log(evt);
    // },
    // onFileUploadResponse(evt) {
    //   console.log(evt);
    // }
  },
  created: function() {
    this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 2
    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false
    this.prop.cVisible = this.prop.cVisible === undefined ? true : this.prop.cVisible
    if (this.prop.cToolbar && this.prop.cToolbar.length > 0) {
      this.config.toolbar = this.prop.cToolbar
    }
    else {
      this.config.toolbar = [
        ['style', ['bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear']],
        ['font', ['fontname', 'fontsize', 'color']],
        ['para', ['ul', 'ol', 'paragraph', 'height']],
        ['table', ['table']],
        ['insert', ['link', 'picture']],
        ['edit', ['undo', 'redo']],
        ['custom', ['print']]
      ]
    }
  },
  mounted: function () {
    // var PrintButton = function(context) {
    //   var ui = $.summernote.ui;
    //   var button = ui.button({
    //     contents: '<i class="fa fa-print"/> Print',
    //     tooltip: 'Print or Export',
    //     click: function() {
    //       context.invoke('editor.foreColor', 'red');
    //     }
    //   });

    //   return button.render();
    // }

    var vm = this

    this.config.callbacks = {
      onInit() {
        // $(document.getElementById(vm.prop.cName)).summernote("code", vm.value)
        // vm.onReady()
        vm.$emit('ready')
      },
      onChange(value) {
        // console.log(value)
        // $(document.getElementById(vm.prop.cName)).summernote("code", value)
        // vm.onChange(value)
        vm.value = value
        vm.$emit('change', value)
      },
      onBlur() {
        // vm.onBlur()
        vm.$emit('blur')
      },
      onExport(data) {
        // alert(JSON.stringify(data))
        if (data.from == 'doc'){
          vm.$emit('exportDoc', data.data)
        }
        if (data.from == 'pdf'){
          vm.$emit('exportPdf', data.data)
        }
      }
    }

    $(document.getElementById(this.prop.cName)).summernote(this.config)
    // $(document.getElementById(this.prop.cName)).summernote('disable')

    // $.extend(true,$.summernote.lang, {
    //   'en-US': { /* US English(Default Language) */
    //     print: {
    //       exampleText: 'Print',
    //       dialogTitle: 'Print',
    //       okButton: 'OK'
    //     }
    //   }
    // });
    // $.extend($.summernote.options, {
    //   print: {
    //     icon: '<i class="fa fa-print"/>',
    //     tooltip: 'Print or Export'
    //   }
    // });
  },
  beforeDestroy: function() {
  },
  updated: function () {
  }
}
</script>

<style scoped>
  @import './../../assets/css/summernote/bootstrap.css';
  @import './../../assets/css/summernote/font-awesome.css';
  @import './../../assets/css/summernote/summernote.css';
</style>