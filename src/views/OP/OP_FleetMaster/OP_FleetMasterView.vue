<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>View FleetMaster</span>
                </b-col>
                <b-col style="text-align: right;">
                  <ABSButton
                    :text="'Back'"
                    classButton="button button--back"
                    classIcon="icon-style-1"
                    @click="doBack"
                  />
                </b-col>
              </b-row>
            </div>
            <div class="card__body">
              <b-form :data-vv-scope="'parent'" :data-vv-value-path="'parent'">
                <b-row>
                  <b-col md="2">
                    <div>
                      <!-- <img :src="M_NewProspect.path_file" alt width="100%" /> -->
					  <img :src="require('@/assets/paper.png')" alt style="width: 70px;" />
                    </div>
                  </b-col>
                  <b-col md="10">                                                       
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Driver Name</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmFleetMstr.driver_nameLabel}}</label>
                        </span>
                      </b-col>
                      <b-col style = "text-align: right;" >
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
                      <b-col>
                        <span>
                          <label>License Plate No</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmFleetMstr.license_plate_no}}</label>
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
                          <label>Fm Fleet Type Id</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmFleetMstr.fm_fleet_type_id}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Fm Fleet Carosery Id</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmFleetMstr.fm_fleet_carosery_id}}</label>
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
                      <b-col>
                        <span>
                          <label>Stnk No</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmFleetMstr.stnk_no}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Stnk Expiry Date</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmFleetMstr.stnk_expiry_date}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Kir</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmFleetMstr.kir}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Kir Expiry Date</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmFleetMstr.kir_expiry_date}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Capacity Kgs</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmFleetMstr.capacity_kgs}}</label>
                        </span>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                      <b-col>
                        <span>
                          <label>Capacity Cbm</label>
                        </span>
                        <br/>
                        <span>
                          <label>{{M_FmFleetMstr.capacity_cbm}}</label>
                        </span>
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
              </b-form>
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
      }
            
    };
  },
  computed: {
    paramFromList() {
      var param = this.$route.params;
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
    doBack() {
      this.$router.go(-1);
    },
    doEdit() {
      var param = this.paramFromList;
      param.isView = false;
      param.isEdit = true;
      this.$store.commit("setParamPage", param);
      this.$router.push({ name: "OP_FleetMasterForm", params: param });
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

        var data = response.Data[0];

      this.M_FmFleetMstr  = {
        fm_fleet_mstr_id : data.fm_fleet_mstr_id,
        ss_portfolio_id : data.ss_portfolio_id,
        fm_driver_id : data.fm_driver_id__lo_1,
        driver_nameLabel : data.driver_name__lbl__lo_1,
        fm_driver_id2 : data.fm_driver_id2,
        bpkb_no : data.bpkb_no__tb_2,
        license_plate_no : data.license_plate_no__tb_3,
        license_plate_expiry_date : data.license_plate_expiry_date__tb_4,
        fm_fleet_brand_id : data.fm_fleet_brand_id__lo_5,
        vehicle_brandLabel : data.vehicle_brand__lbl__lo_5,
        fm_fleet_type_id : data.fm_fleet_type_id__lo_6,
        vehicle_typeLabel : data.vehicle_type__lbl__lo_6,
        fm_fleet_carosery_id : data.fm_fleet_carosery_id__lo_7,
        vehicle_caroseryLabel : data.vehicle_carosery__lbl__lo_7,
        stnk_no : data.stnk_no__tb_8,
        stnk_expiry_date : data.stnk_expiry_date__tb_9,
        kir : data.kir__tb_10,
        kir_expiry_date : data.kir_expiry_date__tb_11,
        capacity_kgs : data.capacity_kgs__tb_12,
        capacity_cbm : data.capacity_cbm__tb_13,
        millage : data.millage__tb_14,
        remarks : data.remarks__tb_15,
        dt_doc_file_name : data.dt_doc_file_name,
        dt_doc_path_file : data.dt_doc_path_file,
        user_input : data.user_input,
        user_edit : data.user_edit,
        time_input : data.time_input,
        time_edit : data.time_edit,
        row_id : data.row_id,
        lastupdatestamp : data.lastupdatestamp
      };
                   
       
      });
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
