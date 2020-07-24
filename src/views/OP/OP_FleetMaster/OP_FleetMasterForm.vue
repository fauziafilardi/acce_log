<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Add Fleet Master</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'Back'"
                      classButton="button button--back"
                      classIcon="icon-style-1"
                      @click="doBack"
                    />
                  </span>
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-form
                :data-vv-scope="'OP_FormFmFleetMstr'"
                :data-vv-value-path="'OP_FormFmFleetMstr'"
              >
                <b-row>
                  <b-col md="2">
                    <div>
                      <div style="text-align: center;">
                        <font-awesome-icon
                          class="icon-style-default"
                          icon="truck"
                          size="10x"
                        />
                      </div>
                    </div>
                  </b-col>
                  <b-col md="5">
                    <!-- <b-row>
                      <b-col style="max-width: fit-content !important; margin: auto;">
                        <span>
                          <font-awesome-icon
                            class="icon-style-default"
                            icon="user"
                            size="lg"
                          /> &nbsp; &nbsp;
                          <label>Driver Name</label>
                        </span>
                      </b-col>
                      <b-col>
                        <ACCLookUp
                          @change = "Onfm_driver_idChange"
                          :prop = "PI_fm_driver_id"
                          v-model = "M_FmFleetMstr.fm_driver_id"
                          :label = "M_FmFleetMstr.driver_nameLabel"
                          ref = "ref_fm_driver_id"
                        />
                      </b-col>
                    </b-row> -->

                    <b-row class="row-bordered">
                      <b-col md="12">
                        <b-row>
                          <b-col>
                            <span style="font-size: 15px; color: #333399; font-weight: bold;"> General Information </span>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col>
                            <span>
                              <label>BPKB No</label>
                            </span>
                            <ACCTextBox
                              :prop = "PI_bpkb_no"
                              v-model = "M_FmFleetMstr.bpkb_no"
                              ref = "ref_bpkb_no"
                            />
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="7">
                            <span>
                              <label>License Plat</label>
                            </span>
                            <ACCTextBox
                              :prop = "PI_license_plate_no"
                              v-model = "M_FmFleetMstr.license_plate_no"
                              ref = "ref_license_plate_no"
                            />
                          </b-col>
                          <b-col md="5">
                            <span>
                              <label>Valid Until</label>
                            </span>
                            <ACCDateTime
                              @input = "Onlicense_plate_expiry_dateChange"
                              :prop = "PI_license_plate_expiry_date"
                              v-model = "M_FmFleetMstr.license_plate_expiry_date"
                              ref = "ref_license_plate_expiry_date"
                            />
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="12">
                            <span>
                              <label>Vehicle Brand</label>
                            </span>
                            <ACCDropDown
                              @change = "Onfm_fleet_brand_idChange"
                              :prop = "PI_fm_fleet_brand_id"
                              v-model = "M_FmFleetMstr.fm_fleet_brand_id"
                              :label = "M_FmFleetMstr.vehicle_brandLabel"
                              ref = "ref_fm_fleet_brand_id"
                            />
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="12">
                            <span>
                              <label>Vehicle Type</label>
                            </span>
                            <ACCDropDown
                              @change = "Onfm_fleet_type_idChange"
                              :prop = "PI_fm_fleet_type_id"
                              v-model = "M_FmFleetMstr.fm_fleet_type_id"
                              :label = "M_FmFleetMstr.vehicle_typeLabel"
                              ref = "ref_fm_fleet_type_id"
                            />
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="12">
                            <span>
                              <label>Vehicle Carosery</label>
                            </span>
                            <ACCDropDown
                              @change = "Onfm_fleet_carosery_idChange"
                              :prop = "PI_fm_fleet_carosery_id"
                              v-model = "M_FmFleetMstr.fm_fleet_carosery_id"
                              :label = "M_FmFleetMstr.vehicle_caroseryLabel"
                              ref = "ref_fm_fleet_carosery_id"
                            />
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="7">
                            <span>
                              <label>STNK No</label>
                            </span>
                            <ACCTextBox
                              :prop = "PI_stnk_no"
                              v-model = "M_FmFleetMstr.stnk_no"
                              ref = "ref_stnk_no"
                            />
                          </b-col>
                          <b-col md="5">
                            <span>
                              <label>Valid Until</label>
                            </span>
                            <ACCDateTime
                              @input = "Onstnk_expiry_dateChange"
                              :prop = "PI_stnk_expiry_date"
                              v-model = "M_FmFleetMstr.stnk_expiry_date"
                              ref = "ref_stnk_expiry_date"
                            />
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="7">
                            <span>
                              <label>KIR</label>
                            </span>
                            <ACCTextBox
                              :prop = "PI_kir"
                              v-model = "M_FmFleetMstr.kir"
                              ref = "ref_kir"
                            />
                          </b-col>
                          <b-col md="5">
                            <span>
                              <label>Valid Until</label>
                            </span>
                            <ACCDateTime
                              @input = "Onkir_expiry_dateChange"
                              :prop = "PI_kir_expiry_date"
                              v-model = "M_FmFleetMstr.kir_expiry_date"
                              ref = "ref_kir_expiry_date"
                            />
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="6">
                            <span>
                              <label>Capacity KGS</label>
                            </span>
                            <ACCTextBox
                              :prop = "PI_capacity_kgs"
                              v-model = "M_FmFleetMstr.capacity_kgs"
                              ref = "ref_capacity_kgs"
                            />
                          </b-col>
                          <b-col md="6">
                            <span>
                              <label>Capacity CBM</label>
                            </span>
                            <ACCTextBox
                              :prop = "PI_capacity_cbm"
                              v-model = "M_FmFleetMstr.capacity_cbm"
                              ref = "ref_capacity_cbm"
                            />
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                  </b-col>
                  <b-col md="5"> <!-- di border -->
                    <b-row class="row-bordered" style="background-color: #ced4da;">
                      <b-col md="12">
                        <b-row style="margin-bottom: 10px">
                          <template v-for="(pict, index) in M_Picture">
                            <b-col style="max-width: fit-content !important;" v-bind:key="index">
                              <img :id="'pict_'+index" :src="pict.file_show" alt style="width: 150px; cursor: pointer; " @click="showPict(pict)" />
                            </b-col>
                          </template>
                        </b-row>
                        <b-row>
                          <b-col md="12">
                            <div @click="addPict" style="width: 20%; cursor: pointer;">
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="plus-circle"
                                size="2x"
                              /> &nbsp; &nbsp; <span style="position: absolute; font-size: 15px; color: #333399; font-weight: bold;"> Add Picture </span>
                            </div>
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                    <b-row class="row-bordered" style="margin-top: 10px;">
                      <b-col>
                        <b-row>
                          <b-col>
                            <span style="font-size: 15px; color: #333399; font-weight: bold;"> Drivers </span>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="6">
                            <span>
                              <label>Select Driver</label>
                            </span>
                            <ACCLookUp
                              @change = "Onfm_driver_idChange"
                              :prop = "PI_fm_driver_id"
                              v-model = "M_FmFleetMstr.fm_driver_id"
                              :label = "M_FmFleetMstr.driver_nameLabel"
                              ref = "ref_fm_driver_id"
                            />
                          </b-col>
                          <b-col md="6">
                            <span>
                              <label>Select Co-Driver</label>
                            </span>
                            <ACCLookUp
                              @change = "Onfm_driver_id2Change"
                              :prop = "PI_fm_driver_id2"
                              v-model = "M_FmFleetMstr.fm_driver_id2"
                              :label = "M_FmFleetMstr.driver_name2Label"
                              ref = "ref_fm_driver_id2"
                            />
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                    <b-row class="row-bordered" style="margin-top: 10px;">
                      <b-col>
                        <b-row>
                          <b-col>
                            <span style="font-size: 15px; color: #333399; font-weight: bold;"> Specification </span>
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="11">
                            <span>
                              <label>Millage</label>
                            </span>
                            <ACCTextBox
                              :prop = "PI_millage"
                              v-model = "M_FmFleetMstr.millage"
                              ref = "ref_millage"
                            />
                          </b-col>
                          <b-col style="margin-top: 35px;">
                            Km
                          </b-col>
                        </b-row>
                        <b-row>
                          <b-col md="12">
                            <span>
                              <label>Remarks</label>
                            </span>
                            <ACCTextArea
                              :prop = "PI_remarks"
                              v-model = "M_FmFleetMstr.remarks"
                              ref = "ref_remarks"
                            />
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                  </b-col>
                </b-row>
                <b-row style="margin-top: 10px;">
                  <b-col offset="2" md="10" style="text-align: center">
                    <ABSButton
                      :text="'Save Fleet Master'"
                      classButton="btn btn--default"
                      classIcon="icon-style-default"
                      @click="doSave"
                      styleButton="height: 40px;width: 70%;"
                    />
                  </b-col>
                </b-row>
              </b-form>
              <ABSModal id="Modal_Picture" ref="Modal_Picture" size="sm">
                <template slot="headerTitle">Add Picture</template>
                <template slot="content">
                  <b-row>
                    <b-col md="12">
                      <b-form :data-vv-scope="'Parent_Picture'" :data-vv-value-path="'Parent_Picture'">
                        <b-row>
                          <b-col md="12">
                            <b-row>
                              <b-col md="12" style="text-align: center;">
                                <img id="logo" :src="M_ModalPict.file_show" alt style="width: 200px;" />
                              </b-col>
                              <b-col md="12">
                                <ACCImageUpload
                                  :prop="PI_add_pict"
                                  @change="Onadd_pictChange"
                                  v-model="M_ModalPict.file_logo"
                                />
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col style="text-align: center;">
                                <ABSButton
                                  :text="'Add Picture'"
                                  classButton="btn btn--default"
                                  classIcon="icon-style-default"
                                  @click="doAddPict"
                                  styleButton="height: 40px;width: 70%;"
                                />
                              </b-col>
                            </b-row>
                          </b-col>
                        </b-row>
                      </b-form>
                    </b-col>
                  </b-row>
                </template>
              </ABSModal>
              <ABSModal id="Show_Picture" ref="Show_Picture" size="sm">
                <template slot="content">
                  <b-row>
                    <b-col md="12" style="text-align: center;">
                      <img id="show_pict" :src="M_ModalPict.file_show" alt style="width: 200px;" />
                    </b-col>
                  </b-row>
                </template>
              </ABSModal>
            </div>
          </div>
        </b-col>
      </b-row>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
 	title:'',

      M_FmFleetMstr :{
        fm_fleet_mstr_id : 0,
        ss_portfolio_id : 0,
        fm_driver_id : 0,
        driver_nameLabel : '',
        fm_driver_id2 : 0,
        driver_name2Label : '',
        fm_driver_id2 : 0,
        bpkb_no : '',
        license_plate_no : '',
        license_plate_expiry_date : '',
        fm_fleet_brand_id : 0,
        vehicle_brandLabel : '',
        fm_fleet_type_id : 0,
        vehicle_typeLabel : '',
        fm_fleet_carosery_id : 0,
        vehicle_caroseryLabel : '',
        stnk_no : '',
        stnk_expiry_date : '',
        kir : '',
        kir_expiry_date : '',
        capacity_kgs : 0,
        capacity_cbm : 0,
        millage : 0,
        remarks : '',
        dt_doc_file_name : '',
        dt_doc_path_file : '',
        user_input : '',
        user_edit : '',
        time_input : '',
        time_edit : '',
        row_id : 0,
        lastupdatestamp : 0
      }
            ,
      PI_fm_driver_id: {
        dataLookUp:{
          LookUpCd:'GetDriver',
          ColumnDB:'driver_id',
          InitialWhere:'',
          ParamWhere:'',
          OrderBy:'',
          ParamView:'',
          SourceField:'',
          DisplayLookUp:'fm_driver_id,full_name'
        },
        cValidate: '',
        cName: "fm_driver_id",
        cOrder: 14,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_FormFmFleetMstr",
        cOption: [],
        cDisplayColumn: 'full_name',
        cInputStatus: this.inputStatus
      },
      PI_fm_driver_id2: {
        dataLookUp:{
          LookUpCd:'GetDriver',
          ColumnDB:'driver_id',
          InitialWhere:'',
          ParamWhere:'',
          OrderBy:'',
          ParamView:'',
          SourceField:'',
          DisplayLookUp:'fm_driver_id,full_name'
        },
        cValidate: '',
        cName: "fm_driver_id2",
        cOrder: 15,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_FormFmFleetMstr",
        cOption: [],
        cDisplayColumn: 'full_name',
        cInputStatus: this.inputStatus
      },
      PI_bpkb_no: {
        cValidate: '',
        cName: "bpkb_no",
        cOrder: 2,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmFleetMstr",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_license_plate_no: {
        cValidate: '',
        cName: "license_plate_no",
        cOrder: 3,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmFleetMstr",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_license_plate_expiry_date: {
        cValidate: "",
        cName: "license_plate_expiry_date",
        cOrder: 4,
        cKey: false,
        cProtect: false,
        cWithTime: false,
        cFormat: "dd/MM/yyyy",
        cParentForm: "OP_FormFmFleetMstr"
      },
      PI_fm_fleet_brand_id: {
        dataLookUp:{
          LookUpCd:'GetFleetBrand',
          ColumnDB:'fm_fleet_brand_id',
          InitialWhere:'',
          ParamWhere:'',
          OrderBy:'',
          ParamView:'',
          SourceField:'',
          DisplayLookUp:'fm_fleet_brand_id,brand_name'
        },
        cValidate: '',
        cName: "fm_fleet_brand_id",
        cOrder: 5,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_FormFmFleetMstr",
        cOption: [],
        cDisplayColumn: 'fm_fleet_brand_id,brand_name',
        cInputStatus: this.inputStatus
      },
      PI_fm_fleet_type_id: {
        dataLookUp:{
          LookUpCd:'GetFleetType',
          ColumnDB:'fleet_type_id',
          InitialWhere:'',
          ParamWhere:'',
          OrderBy:'',
          ParamView:'',
          SourceField:'',
          DisplayLookUp:'vehicle_type,descs'
        },
        cValidate: '',
        cName: "fm_fleet_type_id",
        cOrder: 6,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_FormFmFleetMstr",
        cOption: [],
        cDisplayColumn: 'vehicle_type,descs',
        cInputStatus: this.inputStatus
      },
      PI_fm_fleet_carosery_id: {
        dataLookUp:{
          LookUpCd:'GetFleetCarosery',
          ColumnDB:'fm_fleet_carosery_id',
          InitialWhere:'',
          ParamWhere:'',
          OrderBy:'',
          ParamView:'',
          SourceField:'',
          DisplayLookUp:'fm_fleet_carosery_id,vehicle_carosery'
        },
        cValidate: '',
        cName: "fm_fleet_carosery_id",
        cOrder: 7,
        cKey: false,
        cStatic: false,
        cProtect: false,
        cParentForm: "OP_FormFmFleetMstr",
        cOption: [],
        cDisplayColumn: 'fm_fleet_carosery_id,vehicle_carosery',
        cInputStatus: this.inputStatus
      },
      PI_stnk_no: {
        cValidate: '',
        cName: "stnk_no",
        cOrder: 8,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmFleetMstr",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_stnk_expiry_date: {
        cValidate: "",
        cName: "stnk_expiry_date",
        cOrder: 9,
        cKey: false,
        cProtect: false,
        cWithTime: false,
        cFormat: "dd/MM/yyyy",
        cParentForm: "OP_FormFmFleetMstr"
      },
      PI_kir: {
        cValidate: '',
        cName: "kir",
        cOrder: 10,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmFleetMstr",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_kir_expiry_date: {
        cValidate: "",
        cName: "kir_expiry_date",
        cOrder: 11,
        cKey: false,
        cProtect: false,
        cWithTime: false,
        cFormat: "dd/MM/yyyy",
        cParentForm: "OP_FormFmFleetMstr"
      },
      PI_capacity_kgs: {
        cValidate: '',
        cName: "capacity_kgs",
        cOrder: 12,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "OP_FormFmFleetMstr",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_capacity_cbm: {
        cValidate: '',
        cName: "capacity_cbm",
        cOrder: 13,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "OP_FormFmFleetMstr",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_millage: {
        cValidate: '',
        cName: "millage",
        cOrder: 16,
        cKey: false,
        cType: "decimal",
        cProtect: false,
        cParentForm: "OP_FormFmFleetMstr",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_remarks: {
        cValidate: '',
        cName: "remarks",
        cOrder: 17,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "OP_FormFmFleetMstr",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_add_pict: {
        cName: "picture",
        cAccept: ".jpg, .png, .gif",
        cTitle: "Browse",
        cModule: "OP"
      },
      M_ModalPict: {
        file_logo: "",
        file_logo_name: "",
        file_logo_path: "",
        file_show: require("@/assets/default_photo_.png")
      },
      M_Picture: [
      ]
    };
  },
  computed: {
    paramFromList() {
      var param = this.$store.getters.getParamPage;
      return param;
    },
    inputStatus() {
      var param = this.$store.getters.getParamPage;
      if (param.isEdit && param.isEdit === true) {
        return "edit";
      } else {
        return "new";
      }
    }
  },
  methods: {
    Onadd_pictChange(data) {
      this.M_ModalPict.file_logo_name = data.name;
      this.M_ModalPict.file_logo_path = data.path;
      this.M_ModalPict.file_show = this.url + data.path;
    },
    addPict() {
      this.$refs.Modal_Picture._show();
      this.M_ModalPict = {
        file_logo: "",
        file_logo_name: "",
        file_logo_path: "",
        file_show: require("@/assets/default_photo_.png")
      }
    },
    doAddPict() {
      this.M_Picture.push(this.M_ModalPict)
      this.$refs.Modal_Picture._hide();
    },
    showPict(pict) {
      this.M_ModalPict = pict
      this.$refs.Show_Picture._show();
    },
    doBack() {
      this.$router.go(-1);
    },
    Onfm_driver_idChange(data) {
      this.$nextTick(() => {
        this.M_FmFleetMstr.fm_driver_id = data.id
        this.M_FmFleetMstr.driver_nameLabel = data.label
      });
    },
    Onfm_driver_id2Change(data) {
      this.$nextTick(() => {
        this.M_FmFleetMstr.fm_driver_id2 = data.id
        this.M_FmFleetMstr.driver_name2Label = data.label
      });
    },
    Onfm_fleet_brand_idChange(data) {
      this.$nextTick(() => {
        this.M_FmFleetMstr.fm_fleet_brand_id = data.id
        this.M_FmFleetMstr.vehicle_brandLabel = data.label
      });
    },
    Onfm_fleet_type_idChange(data) {
      this.$nextTick(() => {
        this.M_FmFleetMstr.fm_fleet_type_id = data.id
        this.M_FmFleetMstr.vehicle_typeLabel = data.label
      });
    },
    Onfm_fleet_carosery_idChange(data) {
      this.$nextTick(() => {
        this.M_FmFleetMstr.fm_fleet_carosery_id = data.id
        this.M_FmFleetMstr.vehicle_caroseryLabel = data.label
      });
    },
		
    M_ClearForm() {

      this.M_FmFleetMstr = {
        fm_fleet_mstr_id : '',
        ss_portfolio_id : '',
        fm_driver_id : '',
        driver_nameLabel : '',
        fm_driver_id2 : '',
        driver_name2Label : '',
        fm_driver_id2 : '',
        bpkb_no : '',
        license_plate_no : '',
        license_plate_expiry_date : '',
        fm_fleet_brand_id : '',
        vehicle_brandLabel : '',
        fm_fleet_type_id : '',
        vehicle_typeLabel : '',
        fm_fleet_carosery_id : '',
        vehicle_caroseryLabel : '',
        stnk_no : '',
        stnk_expiry_date : '',
        kir : '',
        kir_expiry_date : '',
        capacity_kgs : '',
        capacity_cbm : '',
        millage : '',
        remarks : '',
        dt_doc_file_name : '',
        dt_doc_path_file : '',
        user_input : '',
        user_edit : '',
        time_input : '',
        time_edit : '',
        row_id : '',
        lastupdatestamp : ''
      }
    },
   
    doSave() {
      this.$validator._base.validateAll("OP_FormFmFleetMstr").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("OP_FormFmFleetMstr");
              if (this.inputStatus == "edit") {
                this.M_Update();
              } else {
                this.M_Save();
              }
            }
          }
        );
      });
    },
    M_Save() {
      var paramH = {
        _Method_: "SAVE",
        _LineNo_: 0,
        ss_portfolio_id:this.getDataUser().portfolio_id,
        bpkb_no:this.M_FmFleetMstr.bpkb_no,
        license_plate_no:this.M_FmFleetMstr.license_plate_no,
        license_plate_expiry_date:this.M_FmFleetMstr.license_plate_expiry_date,
        fm_fleet_brand_id:this.M_FmFleetMstr.fm_fleet_brand_id,
        fm_fleet_type_id:this.M_FmFleetMstr.fm_fleet_type_id,
        fm_fleet_carosery_id:this.M_FmFleetMstr.fm_fleet_carosery_id,
        stnk_no:this.M_FmFleetMstr.stnk_no,
        stnk_expiry_date:this.M_FmFleetMstr.stnk_expiry_date,
        kir:this.M_FmFleetMstr.kir,
        kir_expiry_date:this.M_FmFleetMstr.kir_expiry_date,
        fm_driver_id:this.M_FmFleetMstr.fm_driver_id,
        fm_driver_id2:this.M_FmFleetMstr.fm_driver_id2,
        capacity_kgs:this.M_FmFleetMstr.capacity_kgs,
        capacity_cbm:this.M_FmFleetMstr.capacity_cbm,
        millage:this.M_FmFleetMstr.millage,
        remarks:this.M_FmFleetMstr.remarks,
        user_input:this.getDataUser().user_id
      }, paramD = [];

      this.M_Picture.forEach((pict, index) => {
        paramD.push({
          _Method_: "SAVE",
          _LineNo_: 1,
          fm_fleet_mstr_id: "A_Insert.row_id_output",
          doc_type: "NULL",
          doc_no: "NULL",
          doc_file_name: pict.file_logo_name,
          doc_path_file: pict.file_logo_path,
          expiry_date: "NULL",
          user_input: this.getDataUser().user_id
        });
      });

      var param = {
        option_url: "/OP/OP_FleetMaster",
        line_no: 0,
        Data: [
          {
            A_Insert: paramH,
            B_Looping: paramD
          }
        ]
      };

      this.postJSONMulti(this.getUrlProsesDataPostMulti(), param).then(
        response => {
          // console.log(response)
          if (response == null) return;
          this.alertSuccess("Save Data Has Been Successfully").then(() => {
            this.doBack();
          });
        }
      );
 
    },
	 M_Update() {
      var param = {
        option_url : "/OP/OP_FleetMaster",
        line_no :0, 
        fm_fleet_mstr_id:this.M_FmFleetMstr.fm_fleet_mstr_id,
        ss_portfolio_id:this.getDataUser().portfolio_id,
        bpkb_no:this.M_FmFleetMstr.bpkb_no,
        license_plate_no:this.M_FmFleetMstr.license_plate_no,
        license_plate_expiry_date:this.M_FmFleetMstr.license_plate_expiry_date,
        fm_fleet_brand_id:this.M_FmFleetMstr.fm_fleet_brand_id,
        fm_fleet_type_id:this.M_FmFleetMstr.fm_fleet_type_id,
        fm_fleet_carosery_id:this.M_FmFleetMstr.fm_fleet_carosery_id,
        stnk_no:this.M_FmFleetMstr.stnk_no,
        stnk_expiry_date:this.M_FmFleetMstr.stnk_expiry_date,
        kir:this.M_FmFleetMstr.kir,
        kir_expiry_date:this.M_FmFleetMstr.kir_expiry_date,
        fm_driver_id:this.M_FmFleetMstr.fm_driver_id,
        fm_driver_id2:this.M_FmFleetMstr.fm_driver_id2,
        capacity_kgs:this.M_FmFleetMstr.capacity_kgs,
        capacity_cbm:this.M_FmFleetMstr.capacity_cbm,
        millage:this.M_FmFleetMstr.millage,
        remarks:this.M_FmFleetMstr.remarks,
        lastupdatestamp:this.paramFromList.lastupdatestamp,
        user_edit:this.getDataUser().user_id
      }

      this.putJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          if (this.inputStatus == 'new') {
            this.doBack();
          }
          else {
            this.$router.replace({ name: "OP_FleetMaster" });
          }
        });
      });
    },
	M_Delete() {
      var param = {
        option_url: "/OP/OP_FleetMaster",
        line_no: {LineNo},
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };
      this.deleteJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess("Data Has Been Deleted").then(() => {
          this.doBack();
        });
      });
    },
    GetDataBy() {
      var param = {
        option_url: "/OP/OP_FleetMaster",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data;

        for (let i = 0; i < data.length; i++) {
          if (i === 0) {
            this.M_FmFleetMstr  = {
              fm_fleet_mstr_id : data[i].fm_fleet_mstr_id,
              ss_portfolio_id : data[i].ss_portfolio_id,
              fm_driver_id : data[i].fm_driver_id__lo_1,
              driver_nameLabel : data[i].driver_name__lbl__lo_1,
              fm_driver_id2 : data[i].fm_driver_id2,
              driver_name2Label : data[i].driver_name2,
              bpkb_no : data[i].bpkb_no__tb_2,
              license_plate_no : data[i].license_plate_no__tb_3,
              license_plate_expiry_date : data[i].license_plate_expiry_date__tb_4,
              fm_fleet_brand_id : data[i].fm_fleet_brand_id__lo_5,
              vehicle_brandLabel : data[i].vehicle_brand__lbl__lo_5,
              fm_fleet_type_id : data[i].fm_fleet_type_id__lo_6,
              vehicle_typeLabel : data[i].vehicle_type__lbl__lo_6,
              fm_fleet_carosery_id : data[i].fm_fleet_carosery_id__lo_7,
              vehicle_caroseryLabel : data[i].vehicle_carosery__lbl__lo_7,
              stnk_no : data[i].stnk_no__tb_8,
              stnk_expiry_date : data[i].stnk_expiry_date__tb_9,
              kir : data[i].kir__tb_10,
              kir_expiry_date : data[i].kir_expiry_date__tb_11,
              capacity_kgs : data[i].capacity_kgs__tb_12,
              capacity_cbm : data[i].capacity_cbm__tb_13,
              millage : data[i].millage__tb_14,
              remarks : data[i].remarks__tb_15,
              dt_doc_file_name : data[i].dt_doc_file_name,
              dt_doc_path_file : data[i].dt_doc_path_file,
              user_input : data[i].user_input,
              user_edit : data[i].user_edit,
              time_input : data[i].time_input,
              time_edit : data[i].time_edit,
              row_id : data[i].row_id,
              lastupdatestamp : data[i].lastupdatestamp
            };
          }

          this.M_Picture.push({
            file_logo: 'dtfile_' + i,
            file_logo_name: data[i].dt_doc_file_name,
            file_logo_path: data[i].dt_doc_path_file,
            file_show: data[i].dt_doc_path_file && data[i].dt_doc_path_file !== '' ? this.url + data[i].dt_doc_path_file : require("@/assets/default_photo_.png")
          })
        }
      });
    }
   
  },
  mounted() {
    this.M_ClearForm();
    if (this.inputStatus == "edit") {
      this.title = 'Edit'
      this.GetDataBy();
    }else{
      this.title = 'Add'
	}
  }
};
</script>

