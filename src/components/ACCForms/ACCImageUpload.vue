<template>
  <div id="ACCImageUpload">
    <label
      :for="'acc_image_upload_' + prop.cName"
      :style="'background-color: #333399; color: white; width: 100%; text-align: center;border-radius: 5px; margin-top: 10px;border: 1px solid #333399; display: inline-block; padding: 6px 12px; cursor: pointer;' + prop.cStyle"
    >{{prop.cTitle}}</label>
    <b-form-file
      :id="'acc_image_upload_' + prop.cName"
      style="display: none;"
      :ref="'ref_image_upload_' + prop.cName"
      @change="fileChanged"
      :accept="prop.cAccept"
      v-model="file"
      :state="Boolean(file)"
    />
  </div>
</template>

<script>
export default {
  props: {
    prop: {
      cName: String,
      cAccept: String,
      cTitle: String,
      cModule: String,
      cStyle: String
    },
    file: String
  },
  data() {
    return {};
  },
  computed: {},
  methods: {
    fileChanged(e) {
      var files = e.target.files || e.dataTransfer.files;
      if (!files.length) {
        return;
      }

      var numb = files[0].size / 1024 / 1024;
      numb = numb.toFixed(2);
      if (numb > 1) {
        this.alertError("File size cannot be more than 1 MB");
        return;
      }

      // console.log(files)

      // this.createImage(files[0])
      this.M_upload(files[0]);
    },
    // createImage(file) {
    // var image = new Image()
    // var reader = new FileReader()
    // var vm = this

    // reader.onload = (e) => {
    //     vm.image = e.target.result
    // }
    // reader.readAsDataURL(file)
    // },
    M_upload(fl) {
      let formData = new FormData();
      formData.append("modulecd", this.prop.cModule);
      formData.append("images", fl);

      axios
        .post(this.getUrlUploadFile(), formData, {
          headers: {
            "Content-Type": "multipart/form-data",
            Accept: "application/json",
            Token: this.getSession().Session_Id
          }
        })
        .then(response => {
          console.log(response);
          var data = response.data;
          if (data.Error === true) {
            this.alertError(data.Message);
          } else {
            if (data.Data == undefined || Object.keys(data.Data).length < 1) {
              //belum tau
              this.$emit("change", null);
            } else {
              this.$emit("change", data.Data);
            }
          }
          return;
        })
        .catch(err => {
          console.log(err);
          this.$emit("change", null);
        });
    }
  },
  created() {
    if (this.prop.cAccept == undefined) {
      this.prop.cAccept = ".jpg, .png, .gif";
    }

    this.prop.cStyle = this.prop.cStyle ? this.prop.cStyle : "";
  },
  mounted() {}
};
</script>

<style lang="scss" scoped>
</style>>

</style>