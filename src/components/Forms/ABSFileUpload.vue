<template>
    <div id="ABSFileUpload">
      <b-row v-show="prop.cVisible">
        <b-col :md="prop.cLabelSize" class="lbl-col-align">
          <label v-show="inputStatus=='new' || inputStatus=='edit'" class="text-field-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}}</label>
          <label v-show="inputStatus=='view'" class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}}</label>
        </b-col>
        <b-col>
          <template v-if="prop.cProtect">
            <label>{{file}}</label>
          </template>
          <template v-else>
            <span>
              <b-form-file v-if="inputStatus!=='view' && (image==null || image=='')"
                :ref="prop.cParentForm + '_' + prop.cName"
                @change="fileChanged"
                :accept="prop.cAccept"
                id="ABSFileUpload"
                v-model="file"
                :state="Boolean(file)"
                :placeholder="prop.cPlaceholder"
                :tabindex="prop.cOrder"
                v-validate="prop.cValidate"
                :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
              />
                <!-- <b-button v-show="image!='' && (inputStatus=='new' || inputStatus=='edit')" @click="clearFiles">Reset</b-button>
                <b-button v-show="inputStatus=='view'" @click="previewFile">Preview</b-button> -->
                <label v-if="(image != '') && (inputStatus=='new' || inputStatus=='edit')">{{file}}</label>

                <!-- icon="plus"
                  classIcon="icon-style-1"
                  :disabled="statusFunction[0].disabled||isNew" -->
            </span>
            <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)"
              class="error-span">{{ errors.first(prop.cParentForm+'.'+prop.cName) }}
            </span>
            <label v-show="inputStatus=='view'">{{file}}</label>
          </template>
        </b-col>
        <b-col md="1">
          <template v-if="prop.cProtect">
            <ABSButton
              v-if="image != ''" @click="previewFile"
              text="View"
              classButton="button button--new mgn"
            />
          </template>
          <template v-else>
            <ABSButton
              v-if="((image != '') && (inputStatus=='view'))" @click="previewFile"
              text="View"
              classButton="button button--new mgn"
            />

            <ABSButton
              v-if="((image != '') && (inputStatus!='view'))" @click="clearFiles"
              text="Reset"
              classButton="button button--new mgn"
            />

            <ABSButton
              v-if="((image == '') && (inputStatus!='view'))" @click="doCancel"
              text="Cancel"
              classButton="button button--delete mgn"
            />
          </template>
        </b-col>
      </b-row>
    </div>
</template>

<script>
export default {
  props: {
    prop: {
      cValidate: String,
      cName: String,
      cLabel: String,
      cLabelSize: String,
      cPlaceholder: String,
      cOrder: Number,
      cVisible: Boolean,
      cPageLevel: String,
      cTabIndex: String,
      cProtect: Boolean,
      cParentForm: String,
      cModule: String,
      cAccept: String,
      cUrl: String,
      cDelimiter: String,
      cSubPortfolio: String,
      cPath: String,
      cIsShowPreview: Boolean
    },
    file: String,
    image: {type: String, default: ''}
  },
  data() {
    return {
      resp: null,
      isRequired: false
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
  methods: {
    doCancel () {
      this.$nextTick(() => {

        this.file = this.fileTemp
        this.image = this.imageTemp
        this.resp = this.respTemp

        this.$emit('fileName', this.fileTemp)
        this.$emit('input', this.fileTemp)
        this.$emit('response', this.resp)
      });
      this.$forceUpdate();
    },
    // clicked () {
    //   this.$emit('input', this.file.name)
    // },
    // fileChanged (e) {
    //   this.$emit('input', e)
    // },
    previewFile () {
      var domainUrl = this.url.split("/")
      domainUrl.splice(4, 1)
      domainUrl = domainUrl.join("/")

      var pathUrl = ''
      if (this.prop.cPath != undefined) {
        // pathUrl = this.prop.cPath
        pathUrl = 'FileUpload/SubPortfolio/' + this.getDataUser().subportfolio_cd + '/' + this.prop.cModule + '/' + this.prop.cPath
      } else {
        // pathUrl = 'Picture/' + this.prop.cModule
        pathUrl = 'FileUpload/SubPortfolio/' + this.getDataUser().subportfolio_cd + '/' + this.prop.cModule
      }

      window.open(domainUrl + pathUrl + '/' + this.image, "_blank")
      // window.location.href = url;
    },
    clearFiles () {
      this.$nextTick(() => {
        // var x = this.prop.cParentForm + '_' + this.prop.cName
        // this.$refs[x].reset()

        // temporary  
        this.fileTemp = this.file
        this.imageTemp = this.image
        this.respTemp = this.resp

        this.file = null
        this.image = ''
        this.resp = null
        this.$emit('fileName', '')
        this.$emit('input', '')
        this.$emit('response', null)
      });
      this.$forceUpdate()
      
    },
    fileChanged(e) {
      var files = e.target.files || e.dataTransfer.files;
      if (!files.length) {
        return
      }

      var numb = files[0].size / 1024 / 1024
      numb = numb.toFixed(2)
      if (numb > 1) {
        this.alertError('File size cannot be more than 1 MB')
        return
      }

      // console.log(files)
      this.createImage(files[0])
      this.M_upload(files[0])
    },
    createImage(file) {
      var image = new Image()
      var reader = new FileReader()
      var vm = this

      reader.onload = (e) => {
        vm.image = e.target.result
      }
      reader.readAsDataURL(file)
    },
    M_upload (fl) {
      let formData = new FormData()
      formData.append('file', fl)
      formData.append('ModuleCd', this.prop.cModule)
      if (this.prop.cDelimiter != undefined) {
        formData.append('Delimiter', this.prop.cDelimiter)
      }
      if (this.prop.cSubPortfolio != undefined) {
        formData.append('SubPortfolio', this.prop.cSubPortfolio)
      }
      if (this.prop.cPath == undefined) {
      // if (this.prop.cPath != undefined || this.prop.cPath != '') {
        // formData.append('Path', 'Picture/' + this.prop.cModule)
        formData.append('Path', 'FileUpload/SubPortfolio/' + this.getDataUser().subportfolio_cd + '/' + this.prop.cModule)
      } else {
        formData.append('Path', 'FileUpload/SubPortfolio/' + this.getDataUser().subportfolio_cd + '/' + this.prop.cModule + '/' + this.prop.cPath)
      }
      var url = this.prop.cUrl != undefined ? this.prop.cUrl : this.getUrlUploadFile()
      axios
      .post(
        url,
        formData,
        {
          headers: {
            'Content-Type': 'multipart/form-data',
            Accept: "application/json",
            Token: this.getSession().Session_Id
          }
        }
      )
      .then(response => {
        // response from API
        console.log(response)
        // return
        
        this.resp = response.data
        
        if (this.error) {
          this.showAlert(this.message)
          return
        } else {
          this.$emit('response',this.resp)
          // this.$emit('fileName', fl.name)
          // berubah file namenya dari API
          if (this.resp.Data == undefined) {
            this.$emit('fileName', this.resp[0])
            this.$emit('input', this.resp[0])
          } else {
            this.$emit('fileName', this.resp.Data[0])
            this.$emit('input', this.resp.Data[0])
          }
          
        }

      })
      .catch(err => {
        console.log(err)
      })
    },
  },
  created: function() {
    this.prop.cLabelSize = this.prop.cLabelSize ? this.prop.cLabelSize : 4
    this.prop.cVisible = this.prop.cVisible === undefined ? true : this.prop.cVisible
    this.prop.cProtect = this.prop.cProtect ? this.prop.cProtect : false
  },
  mounted: function () {
    if (this.prop.cAccept == undefined) {
      this.prop.cAccept = '.jpg, .png, .gif'
    }
  },
  beforeDestroy: function () {
  }
}
</script>
<style scope>
  .mgn {
    margin-top: 0px !important;
  }
</style>