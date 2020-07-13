<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>View Fleet Master</span>
                </b-col>
                <b-col style="text-align: right;">
                  <span>
                    <ABSButton
                      :text="'Add Maintenance Type'"
                      classButton="button button--back"
                      classIcon="icon-style-1"
                      @click="doMaintain"
                    />
                  </span>
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
              <b-form :data-vv-scope="'parent'" :data-vv-value-path="'parent'">
                <b-row>
                  <b-col md="2">
                    <div style="text-align: center;">
                      <font-awesome-icon
                        class="icon-style-default"
                        icon="truck"
                        size="10x"
                      />
                    </div>
                  </b-col>
                  <b-col md="10">
                    <b-row>
                      <b-col>
                        <b-row>
                          <b-col style="max-width: fit-content !important; margin: auto;">
                            <label style="font-size: 15px; color: #333399; font-weight: bold;"> General Information </label>
                            <br>
                            <span>
                              <font-awesome-icon
                                class="icon-style-default"
                                icon="user"
                                size="lg"
                              /> &nbsp; &nbsp;
                              <label>Driver Name : {{M_FmFleetMstr.driver_nameLabel}}</label>
                            </span>
                          </b-col>
                          <b-col style = "text-align: right;" >
                            <span>
                              <ABSButton
                                :text = "'Delete'"
                                classButton = "btn btn--default"
                                classIcon = "icon-style-1"
                                @click = "doDelete"
                              />
                            </span>

                            <span>
                              <ABSButton
                                :text = "'Edit'"
                                classButton = "btn btn--default"
                                classIcon = "icon-style-1"
                                @click = "doEdit"
                              />
                            </span>
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>

                    <b-row>
                      <b-col md="6">
                        <b-row class="row-bordered">
                          <b-col md="12">
                            <b-row class="row-view">
                              <b-col>
                                <span style="font-size: 15px; color: #333399; font-weight: bold;"> General Information </span>
                              </b-col>
                            </b-row>
                            <b-row class="row-view">
                              <b-col>
                                <span>
                                  <label>Bpkb No</label>
                                </span>
                                <br/>
                                <span>
                                  <label>{{M_FmFleetMstr.bpkb_no}}</label>
                                </span>
                              </b-col>
                            </b-row>
                            <b-row class="row-view">
                              <b-col md="6">
                                <span>
                                  <label>License Plate No</label>
                                </span>
                                <br/>
                                <span>
                                  <label>{{M_FmFleetMstr.license_plate_no}}</label>
                                </span>
                              </b-col>
                              <b-col md="6">
                                <span>
                                  <label>Valid Until</label>
                                </span>
                                <br/>
                                <span>
                                  <label>{{M_FmFleetMstr.license_plate_expiry_date}}</label>
                                </span>
                              </b-col>
                            </b-row>
                            <b-row class="row-view">
                              <b-col>
                                <span>
                                  <label>Vehicle Brand</label>
                                </span>
                                <br/>
                                <span>
                                  <label>{{M_FmFleetMstr.vehicle_brandLabel}}</label>
                                </span>
                              </b-col>
                            </b-row>
                            <b-row class="row-view">
                              <b-col>
                                <span>
                                  <label>Vehicle Type</label>
                                </span>
                                <br/>
                                <span>
                                  <label>{{M_FmFleetMstr.vehicle_typeLabel}}</label>
                                </span>
                              </b-col>
                            </b-row>
                            <b-row class="row-view">
                              <b-col>
                                <span>
                                  <label>Vehicle Carosery</label>
                                </span>
                                <br/>
                                <span>
                                  <label>{{M_FmFleetMstr.vehicle_caroseryLabel}}</label>
                                </span>
                              </b-col>
                            </b-row>
                            <b-row class="row-view">
                              <b-col md="6">
                                <span>
                                  <label>STNK</label>
                                </span>
                                <br/>
                                <span>
                                  <label>{{M_FmFleetMstr.stnk_no}}</label>
                                </span>
                              </b-col>
                              <b-col md="6">
                                <span>
                                  <label>Valid Until</label>
                                </span>
                                <br/>
                                <span>
                                  <label>{{M_FmFleetMstr.stnk_expiry_date}}</label>
                                </span>
                              </b-col>
                            </b-row>
                            <b-row class="row-view">
                              <b-col md="6">
                                <span>
                                  <label>KIR</label>
                                </span>
                                <br/>
                                <span>
                                  <label>{{M_FmFleetMstr.kir}}</label>
                                </span>
                              </b-col>
                              <b-col md="6">
                                <span>
                                  <label>Valid Until</label>
                                </span>
                                <br/>
                                <span>
                                  <label>{{M_FmFleetMstr.kir_expiry_date}}</label>
                                </span>
                              </b-col>
                            </b-row>
                            <b-row class="row-view">
                              <b-col md="6">
                                <span>
                                  <label>Capacity KGS</label>
                                </span>
                                <br/>
                                <span>
                                  <label>{{M_FmFleetMstr.capacity_kgs}}</label>
                                </span>
                              </b-col>
                              <b-col md="6">
                                <span>
                                  <label>Capacity CBM</label>
                                </span>
                                <br/>
                                <span>
                                  <label>{{M_FmFleetMstr.capacity_cbm}}</label>
                                </span>
                              </b-col>
                            </b-row>
                          </b-col>
                        </b-row>
                      </b-col>
                      <b-col md="6">
                        <b-row class="row-bordered" style="background-color: #ced4da;">
                          <b-col md="12">
                            <b-row>
                              <template v-for="(pict, index) in M_Picture">
                                <b-col style="max-width: fit-content !important;" v-bind:key="index">
                                  <img :id="'pict_'+index" :src="pict.file_show" alt style="width: 150px; cursor: pointer; " @click="showPict(pict)" />
                                </b-col>
                              </template>
                            </b-row>
                          </b-col>
                        </b-row>
                        <b-row class="row-bordered">
                          <b-col md="12">
                            <b-row class="row-view">
                              <b-col>
                                <label style="font-size: 15px; color: #333399; font-weight: bold;"> Specification </label>
                              </b-col>
                            </b-row>
                            <b-row class="row-view">
                              <b-col>
                                <span>
                                  <label>Millage</label>
                                </span>
                                <br/>
                                <span>
                                  <label>{{M_FmFleetMstr.millage}}</label>
                                </span>
                              </b-col>
                            </b-row>
                            <b-row class="row-view">
                              <b-col>
                                <span>
                                  <label>Remarks</label>
                                </span>
                                <br/>
                                <span>
                                  <label>{{M_FmFleetMstr.remarks}}</label>
                                </span>
                              </b-col>
                            </b-row>
                          </b-col>
                        </b-row>
                        <b-row class="row-bordered">
                          <b-col md="12">
                            <b-row class="row-view">
                              <b-col>
                                <label style="font-size: 15px; color: #333399; font-weight: bold;"> Maintenance </label>
                              </b-col>
                            </b-row>
                            <template v-for="(m, index) in M_Maintenance">
                              <b-row class="row-view" v-bind:key="index" style="cursor: pointer;">
                                <b-col @click="doMaintenanceView(m)">
                                  <span>
                                    <label>{{m.maintenance_type_descs}}</label>
                                  </span>
                                </b-col>
                                <b-col style="max-width: fit-content !important;">
                                  <span>
                                    <font-awesome-icon
                                      class="icon-style-default"
                                      icon="trash"
                                      size="lg"
                                      style="cursor: pointer;"
                                      @click="Delete_Maintenance(m)"
                                    />
                                  </span>
                                </b-col>
                              </b-row>
                            </template>
                          </b-col>
                        </b-row>
                      </b-col>
                    </b-row>
                  </b-col>
                </b-row>
              </b-form>
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
      M_FmFleetMstr :{
        fm_fleet_mstr_id : 0,
        ss_portfolio_id : 0,
        fm_driver_id : 0,
        driver_nameLabel : '',
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
      },
      M_Picture: [],
      M_ModalPict: {
        file_logo: "",
        file_logo_name: "",
        file_logo_path: "",
        file_show: require("@/assets/default_photo_.png")
      },
      M_Maintenance: []
    };
  },
  computed: {
    paramFromList() {
      var param = this.$store.getters.getParamPage;
      if (param == null || param == undefined) {
        this.doBack();
      } else {
        if (Object.keys(param).length < 1) {
          this.doBack();
        } else {
          return param;
        }
      }
    }
  },
  methods: {
    doMaintain() {
      var param = this.paramFromList
      param.isEdit = false;
      param.ForMaintenance = {
        fm_fleet_mstr_id: param.row_id,
      }
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_MaintenanceTypeForm" });
    },
    Delete_Maintenance(m) {
      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        ress => {
          if (ress.value) {
            this.M_DeleteM(m);
          }
        }
      );
    },
    doMaintenanceView(m) {
      var param = this.paramFromList
      m.fm_fleet_mstr_id = param.row_id
      param.ForMaintenance = m
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_MaintenanceTypeView" });
    },
    doBack() {
      this.$router.go(-1);
    },
    showPict(pict) {
      this.M_ModalPict = pict
      this.$refs.Show_Picture._show();
    },
    doEdit() {
      var param = this.paramFromList;
      param.isView = false;
      param.isEdit = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_FleetMasterForm" });
    },
    doDelete() {
      this.alertConfirmation("Are You Sure Want To Delete This Data ?").then(
        ress => {
          if (ress.value) {
            this.M_Delete();
          }
        }
      );
    },
	 M_DeleteM(m) {
      var param = {
        option_url: "/OP/OP_FleetMaster",
        line_no: 2,
        id: m.row_id,
        lastupdatestamp: m.lastupdatestamp
      };
      this.deleteJSON(this.getUrlCRUD(), param).then(response => {
        if (response == null) return;
        this.alertSuccess("Data Has Been Deleted").then(() => {
          this.getMaintenance();
        });
      });
    },
    M_Delete() {
      var param = {
        option_url: "/OP/OP_FleetMaster",
        line_no: 0,
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
            }
          }

          this.M_Picture.push({
            file_logo: 'dtfile_' + i,
            file_logo_name: data[i].dt_doc_file_name,
            file_logo_path: data[i].dt_doc_path_file,
            file_show: data[i].dt_doc_path_file && data[i].dt_doc_path_file !== '' ? this.url + data[i].dt_doc_path_file : require("@/assets/default_photo_.png")
          })
        }

        this.getMaintenance()
      });
    },
    getMaintenance() {
      var param = {
          option_function_cd: "GetListFMFleetMaintenanceType",
          module_cd: "OP",
          ss_portfolio_id: this.getDataUser().portfolio_id ,
          row_id: this.paramFromList.row_id
      };

      this.CallFunction(param).then(response => {
          if (response == null) return
          this.M_Maintenance = response.Data;
      })
    }
  },
  mounted() {
    this.GetDataBy();
  },
  beforeMount() {}
};
</script>

<style>
</style>
