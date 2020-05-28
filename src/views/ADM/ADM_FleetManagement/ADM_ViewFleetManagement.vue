<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Fleet Master</span>
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
              <b-form
                :data-vv-scope="'ADM_AddFleetManagement'"
                :data-vv-value-path="'ADM_AddFleetManagement'"
              >
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
                      <b-col md="12">
                            <b-row>
                                <b-col>
                                    <span>
                                        <label style="font-size: 15px; color: blue;">{{M_FleetManagement.plate_no}}</label>
                                    </span>
                                </b-col>
                                <b-col style="text-align: right;">
                                    <span>
                                        <ABSButton
                                            :text="'Edit'"
                                            classButton="btn btn--default"
                                            classIcon="icon-style-1"
                                            @click="doEdit"
                                        />
                                    </span>
                                </b-col>
                            </b-row>
                      </b-col>
                    </b-row>
                    <b-row class="row-view">
                        <b-col md="6">
                            <span>
                                <font-awesome-icon
                                    class="icon-style-default"
                                    icon="user-circle"
                                    size="sm"
                                /> &nbsp; &nbsp;
                                {{ M_FleetManagement.driver1Label }}
                            </span>
                        </b-col>
                    </b-row>

                    <b-row>
                        <b-col md="1">
                            <span>
                                <font-awesome-icon
                                    class="icon-style-default"
                                    icon="user"
                                    size="sm"
                                /> &nbsp; &nbsp;
                                User
                            </span>
                        </b-col>
                        <b-col>
                            <span>
                                : &nbsp; &nbsp;
                                {{ M_FleetManagement.user_name }}
                            </span>
                        </b-col>
                    </b-row>
                    <b-row>
                        <b-col md="1">
                            <span>
                                <font-awesome-icon
                                    class="icon-style-default"
                                    icon="calendar-alt"
                                    size="sm"
                                /> &nbsp; &nbsp;
                                Date Added
                            </span>
                        </b-col>
                        <b-col>
                            <span>
                                : &nbsp; &nbsp;
                                {{ M_FleetManagement.date_add }}
                            </span>
                        </b-col>
                    </b-row>
                    <template v-for="(doc, index) in M_BPKB">
                        <b-row v-bind:key="index">
                            <b-col md="1">
                                <span>
                                    <font-awesome-icon
                                        class="icon-style-default"
                                        icon="clipboard"
                                        size="sm"
                                    /> &nbsp; &nbsp;
                                    BPKB No.
                                </span>
                            </b-col>
                            <b-col>
                                <span>
                                    : &nbsp; &nbsp;
                                    {{ doc.no }}
                                </span>
                            </b-col>
                        </b-row>
                        <b-row v-bind:key="index">
                            <b-col md="1">
                                <span>
                                    <font-awesome-icon
                                        class="icon-style-default"
                                        icon="calendar-alt"
                                        size="sm"
                                    /> &nbsp; &nbsp;
                                    BPKB Expire
                                </span>
                            </b-col>
                            <b-col>
                                <span>
                                    : &nbsp; &nbsp;
                                    {{ momentDate(new Date(doc.exp)) }}
                                </span>
                            </b-col>
                        </b-row>
                        <b-row v-bind:key="index" v-show="doc.file_logo_name && doc.file_logo_name !== ''">
                            <b-col md="1">
                                <span>
                                    <font-awesome-icon
                                        class="icon-style-default"
                                        icon="paperclip"
                                        size="sm"
                                    /> &nbsp; &nbsp;
                                    BPKB
                                </span>
                            </b-col>
                            <b-col>
                                <span>
                                    : &nbsp; &nbsp;
                                    <span>
                                        <label style="color: blue; cursor: pointer;" @click="onPictClick(doc)"> {{doc.file_logo_name}} </label>
                                    </span>
                                </span>
                            </b-col>
                        </b-row>
                    </template>
                    <template v-for="(doc, index) in M_STNK">
                        <b-row v-bind:key="index">
                            <b-col md="1">
                                <span>
                                    <font-awesome-icon
                                        class="icon-style-default"
                                        icon="clipboard"
                                        size="sm"
                                    /> &nbsp; &nbsp;
                                    STNK No.
                                </span>
                            </b-col>
                            <b-col>
                                <span>
                                    : &nbsp; &nbsp;
                                    {{ doc.no }}
                                </span>
                            </b-col>
                        </b-row>
                        <b-row v-bind:key="index">
                            <b-col md="1">
                                <span>
                                    <font-awesome-icon
                                        class="icon-style-default"
                                        icon="calendar-alt"
                                        size="sm"
                                    /> &nbsp; &nbsp;
                                    STNK Expire
                                </span>
                            </b-col>
                            <b-col>
                                <span>
                                    : &nbsp; &nbsp;
                                    {{ momentDate(new Date(doc.exp)) }}
                                </span>
                            </b-col>
                        </b-row>
                        <b-row v-bind:key="index" v-show="doc.file_logo_name && doc.file_logo_name !== ''">
                            <b-col md="1">
                                <span>
                                    <font-awesome-icon
                                        class="icon-style-default"
                                        icon="paperclip"
                                        size="sm"
                                    /> &nbsp; &nbsp;
                                    STNK
                                </span>
                            </b-col>
                            <b-col>
                                <span>
                                    : &nbsp; &nbsp;
                                    <span>
                                        <label style="color: blue; cursor: pointer;" @click="onPictClick(doc)"> {{doc.file_logo_name}} </label>
                                    </span>
                                </span>
                            </b-col>
                        </b-row>
                    </template>
                    <template v-for="(doc, index) in M_Doc">
                        <b-row v-bind:key="index">
                            <b-col md="1">
                                <span>
                                    <font-awesome-icon
                                        class="icon-style-default"
                                        icon="clipboard"
                                        size="sm"
                                    /> &nbsp; &nbsp;
                                    Other Document No.
                                </span>
                            </b-col>
                            <b-col>
                                <span>
                                    : &nbsp; &nbsp;
                                    {{ doc.no }}
                                </span>
                            </b-col>
                        </b-row>
                        <b-row v-bind:key="index">
                            <b-col md="1">
                                <span>
                                    <font-awesome-icon
                                        class="icon-style-default"
                                        icon="calendar-alt"
                                        size="sm"
                                    /> &nbsp; &nbsp;
                                    Other Document Expire
                                </span>
                            </b-col>
                            <b-col>
                                <span>
                                    : &nbsp; &nbsp;
                                    {{ momentDate(new Date(doc.exp)) }}
                                </span>
                            </b-col>
                        </b-row>
                        <b-row v-bind:key="index" v-show="doc.file_logo_name && doc.file_logo_name !== ''">
                            <b-col md="1">
                                <span>
                                    <font-awesome-icon
                                        class="icon-style-default"
                                        icon="paperclip"
                                        size="sm"
                                    /> &nbsp; &nbsp;
                                    Other Document
                                </span>
                            </b-col>
                            <b-col>
                                <span>
                                    : &nbsp; &nbsp;
                                    <span>
                                        <label style="color: blue; cursor: pointer;" @click="onPictClick(doc)"> {{doc.file_logo_name}} </label>
                                    </span>
                                </span>
                            </b-col>
                        </b-row>
                    </template>
                    <b-row>
                        <b-col md="1">
                            <span>
                                <font-awesome-icon
                                    class="icon-style-default"
                                    icon="sticky-note"
                                    size="sm"
                                /> &nbsp; &nbsp;
                                Notes
                            </span>
                        </b-col>
                    </b-row>
                    <b-row>
                        <b-col>
                            <span>
                                {{ M_FleetManagement.notes }}
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
      M_FleetManagement: {
        user_name: this.getDataUser().user_name,
        plate_no: "",
        fleet_type: "",
        fleet_typeLabel: "",
        descs: "",
        driver1: "",
        driver1Label: "",
        driver2: "",
        driver2Label: "",
        notes: "",
        lastupdatestamp: ""
      },
        M_BPKB: [],
        M_STNK: [],
        M_Doc: [],
        default_pic: require('@/assets/default_photo_.png'),
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
    },
    inputStatus() {
      var param = this.$route.params;
      if (param.isEdit && param.isEdit === true) {
        return "edit";
      } else {
        return "new";
      }
    }
  },
  methods: {
    doBack() {
      this.$router.go(-1);
    },
    doEdit() {
        var param = this.paramFromList;
        param.isEdit = true;
        this.$router.push({ name: "ADM_AddFleetManagement", params: param });
    },
    onPictClick(data) {
        // console.log(data)
        window.open(data.file_show);
    },
    GetDataBy() {
      var param = {
          option_url: "/ADM/ADM_FleetManagement",
          line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(this.paramFromList.row_id), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];

        this.M_FleetManagement = {
          user_name: this.getDataUser().user_name,
          plate_no: data.license_plate_no,
          fleet_type: data.fm_fleet_type_id,
          fleet_typeLabel: data.fleet_type_descs,
          driver1: data.fm_driver_id,
          driver1Label: data.driver1,
          driver2: data.fm_driver_id2,
          driver2Label: data.driver2,
          notes: data.descs,
          date_add: this.momentDate(new Date(data.time_input))
        };

        this.M_BPKB = []
        this.M_STNK = []
        this.M_Doc = []

        // this.$nextTick(() => {
            response.Data.forEach((dtl, index) => {
                console.log(dtl)
                if (dtl.dt_doc_type == "B") {
                    this.M_BPKB.push({
                        no: dtl.dt_doc_no,
                        exp: dtl.dt_expiry_date,
                        file_logo: dtl.dt_doc_file_name,
                        file_logo_name: dtl.dt_doc_file_name,
                        file_logo_path: dtl.dt_doc_path_file,
                        file_show: this.url + dtl.dt_doc_path_file,
                        type: dtl.dt_doc_type,
                        status: "E"
                    })
                }
                else if (dtl.dt_doc_type == "S") {
                    this.M_STNK.push({
                        no: dtl.dt_doc_no,
                        exp: dtl.dt_expiry_date,
                        file_logo: dtl.dt_doc_file_name,
                        file_logo_name: dtl.dt_doc_file_name,
                        file_logo_path: dtl.dt_doc_path_file,
                        file_show: this.url + dtl.dt_doc_path_file,
                        type: dtl.dt_doc_type,
                        status: "E"
                    })
                }
                else if (dtl.dt_doc_type == "O") {
                    this.M_Doc.push({
                        no: dtl.dt_doc_no,
                        exp: dtl.dt_expiry_date,
                        file_logo: dtl.dt_doc_file_name,
                        file_logo_name: dtl.dt_doc_file_name,
                        file_logo_path: dtl.dt_doc_path_file,
                        file_show: this.url + dtl.dt_doc_path_file,
                        type: dtl.dt_doc_type,
                        status: "E"
                    })
                }
            });
        // })

        // this.$forceUpdate();

        // console.log(this.M_BPKB)
        // console.log(this.M_STNK)
        // console.log(this.M_Doc)
      });
    },
  },
  mounted() {
    // this.M_ClearForm();
    // if (this.inputStatus == "edit") {
      this.GetDataBy();
    // }
  }
};
</script>

<style>
</style>