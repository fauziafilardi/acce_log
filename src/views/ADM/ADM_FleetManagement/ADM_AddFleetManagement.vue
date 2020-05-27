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
                    <div>
                      <img id="logo" :src="require('@/assets/boxKecil.png')" alt width="100%" />
                    </div>
                  </b-col>
                  <b-col md="10">
                    <!-- <b-row>
                    <b-col md="12">-->
                    <b-row class="row-view">
                      <b-col md="2">
                        <font-awesome-icon class="icon-style-default" icon="user" />
                        User
                      </b-col>
                      <b-col md="2">
                        : {{ M_FleetManagement.user_name }}
                      </b-col>
                    </b-row>
                    <b-row>
                        <b-col md="6">
                            <span>
                                <label>License Plate No.</label>
                            </span>
                            <ACCTextBox
                                :prop="PI_plate_no"
                                v-model="M_FleetManagement.plate_no"
                                ref="ref_plate_no"
                            />
                        </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Fleet Type</label>
                        </span>
                        <ACCLookUp
                          @change="Onfleet_typeChange"
                          :prop="PI_fleet_type"
                          v-model="M_FleetManagement.fleet_type"
                          :label="M_FleetManagement.fleet_typeLabel"
                          ref="ref_fleet_type"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Driver 1</label>
                        </span>
                        <ACCLookUp
                          @change="Ondriver1Change"
                          :prop="PI_driver1"
                          v-model="M_FleetManagement.driver1"
                          :label="M_FleetManagement.driver1Label"
                          ref="ref_driver1"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Driver 2</label>
                        </span>
                        <ACCLookUp
                          @change="Ondriver2Change"
                          :prop="PI_driver2"
                          v-model="M_FleetManagement.driver2"
                          :label="M_FleetManagement.driver2Label"
                          ref="ref_driver2"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                        <b-col md="6">
                            <span>
                                <label>Description</label>
                            </span>
                            <ACCTextBox
                                :prop="PI_descs"
                                v-model="M_FleetManagement.descs"
                                ref="ref_descs"
                            />
                        </b-col>
                    </b-row>
                    <b-row>
                        <b-col md="2">
                            <div style="cursor: pointer;" @click="OpenModal('B')" >
                                <font-awesome-icon class="icon-style-default" icon="plus-circle" />
                                Add BPKB Document
                            </div>
                        </b-col>
                    </b-row>
                    <template v-for="(data, index) in M_BPKB">
                        <b-row v-bind:key="index">
                            <b-col md="3">
                                <span>
                                    <label> BPKB No. </label>
                                </span>
                                &nbsp;
                                <font-awesome-icon class="icon-style-default" style="cursor: pointer;" icon="edit" @click="Edit('B', data, index)" />
                                &nbsp;
                                <font-awesome-icon class="icon-style-default" style="color: red !important; cursor: pointer;" icon="times-circle" @click="Delete('B', data, index)" />
                            </b-col>
                        </b-row>
                        <b-row v-bind:key="index">
                            <b-col md="3">
                                <b-form-input
                                    class="text-field-form"
                                    readonly="true"
                                    v-model="data.no"
                                />
                            </b-col>
                        </b-row>
                    </template>
                    <b-row>
                        <b-col md="2">
                            <div style="cursor: pointer;" @click="OpenModal('S')" >
                                <font-awesome-icon class="icon-style-default" icon="plus-circle" />
                                Add STNK Document
                            </div>
                        </b-col>
                    </b-row>
                    <template v-for="(data, index) in M_STNK">
                        <b-row v-bind:key="index">
                            <b-col md="3">
                                <span>
                                    <label> STNK No. </label>
                                </span>
                                &nbsp;
                                <font-awesome-icon class="icon-style-default" style="cursor: pointer;" icon="edit" @click="Edit('S', data, index)" />
                                &nbsp;
                                <font-awesome-icon class="icon-style-default" style="color: red !important; cursor: pointer;" icon="times-circle" @click="Delete('S', data, index)" />
                            </b-col>
                        </b-row>
                        <b-row v-bind:key="index">
                            <b-col md="3">
                                <b-form-input
                                    class="text-field-form"
                                    readonly="true"
                                    v-model="data.no"
                                />
                            </b-col>
                        </b-row>
                        <b-row v-bind:key="index">
                            <b-col md="3">
                                <span>
                                    <label> STNK Expire </label>
                                </span> <br>
                                <b-form-input
                                    class="text-field-form"
                                    readonly="true"
                                    :value="momentDate(data.exp)"
                                />
                            </b-col>
                        </b-row>
                    </template>
                    <b-row>
                        <b-col md="2">
                            <div style="cursor: pointer;" @click="OpenModal('O')" >
                                <font-awesome-icon class="icon-style-default" icon="plus-circle" />
                                Add Other Document
                            </div>
                        </b-col>
                    </b-row>
                    <template v-for="(data, index) in M_Doc">
                        <b-row v-bind:key="index">
                            <b-col md="3">
                                <span>
                                    <label> Other Document No. </label>
                                </span>
                                &nbsp;
                                <font-awesome-icon class="icon-style-default" style="cursor: pointer;" icon="edit" @click="Edit('O', data, index)" />
                                &nbsp;
                                <font-awesome-icon class="icon-style-default" style="color: red !important; cursor: pointer;" icon="times-circle" @click="Delete('O', data, index)" />
                            </b-col>
                        </b-row>
                        <b-row v-bind:key="index">
                            <b-col md="3">
                                <b-form-input
                                    class="text-field-form"
                                    readonly="true"
                                    v-model="data.no"
                                />
                            </b-col>
                        </b-row>
                        <b-row v-bind:key="index">
                            <b-col md="3">
                                <span>
                                    <label> Other Document Expire </label>
                                </span> <br>
                                <b-form-input
                                    class="text-field-form"
                                    readonly="true"
                                    :value="momentDate(data.exp)"
                                />
                            </b-col>
                        </b-row>
                    </template>
                    <b-row>
                      <b-col md="9">
                        <span>
                          <label>Notes</label>
                        </span>
                        <ACCTextArea
                          :prop="PI_notes"
                          v-model="M_FleetManagement.notes"
                          ref="ref_notes"
                        />
                      </b-col>
                    </b-row>
                    <b-row style="margin-top: 10px;">
                      <b-col md="6">
                        <ABSButton
                          :text="'Save Customer'"
                          classButton="btn btn--default"
                          classIcon="icon-style-default"
                          @click="doSave"
                          styleButton="height: 40px;width: 100%;"
                        />
                      </b-col>
                    </b-row>
                    <!-- </b-col>
                    </b-row>-->
                  </b-col>
                </b-row>
              </b-form>

                <ABSModal id="Modal_BPKB" ref="Modal_BPKB" size="sm">
                    <template slot="headerTitle">BPKB Document</template>
                    <template slot="content">
                        <b-row>
                        <b-col md="12">
                            <b-form
                            :data-vv-scope="'Parent_BPKB'"
                            :data-vv-value-path="'Parent_BPKB'"
                            >
                            <b-row>
                                <b-col md="12">
                                <b-row>
                                    <b-col md="12">
                                    <span>
                                        <label>BPKB No.</label>
                                    </span>
                                    <ACCTextBox
                                        :prop="PI_bpkb_no"
                                        v-model="M_ModalDoc.no"
                                        ref="ref_bpkb_no"
                                    />
                                    </b-col>
                                </b-row>
                                <!-- <b-row>
                                    <b-col md="12">
                                    <span>
                                        <label>BPKB Expire</label>
                                    </span>
                                    <ACCDateTime
                                        :prop="PI_bpkb_exp"
                                        @input="OnexpChange"
                                        v-model="M_ModalDoc.exp"
                                        ref="ref_bpkb_exp"
                                    />
                                    </b-col>
                                </b-row> -->
                                <b-row>
                                    <b-col md="6">
                                        <img id="logo" :src="M_ModalDoc.file_show" alt style="width: 50px;" />
                                    </b-col>
                                    <b-col md="6">
                                        <ACCImageUpload
                                            :prop="PI_bpkb_logo"
                                            @change="onlogoChange"
                                            v-model="M_ModalDoc.file_logo"
                                        />
                                    </b-col>
                                </b-row>
                                <b-row style="margin-top: 10px;">
                                    <b-col md="6">
                                    <ABSButton
                                        :text="'Add'"
                                        classButton="btn btn--default"
                                        classIcon="icon-style-1"
                                        @click="SaveModal('B')"
                                        styleButton="height: 40px;width: 100%;"
                                    />
                                    </b-col>
                                    <b-col md="6">
                                    <ABSButton
                                        :text="'Cancel'"
                                        classButton="btn btn--back"
                                        classIcon="icon-style-1"
                                        @click="CancelModal('B')"
                                        styleButton="height: 40px;width: 100%;"
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

                <ABSModal id="Modal_STNK" ref="Modal_STNK" size="sm">
                    <template slot="headerTitle">STNK Document</template>
                    <template slot="content">
                        <b-row>
                        <b-col md="12">
                            <b-form
                            :data-vv-scope="'Parent_STNK'"
                            :data-vv-value-path="'Parent_STNK'"
                            >
                            <b-row>
                                <b-col md="12">
                                <b-row>
                                    <b-col md="12">
                                    <span>
                                        <label>STNK No.</label>
                                    </span>
                                    <ACCTextBox
                                        :prop="PI_stnk_no"
                                        v-model="M_ModalDoc.no"
                                        ref="ref_stnk_no"
                                    />
                                    </b-col>
                                </b-row>
                                <b-row>
                                    <b-col md="12">
                                    <span>
                                        <label>STNK Expire</label>
                                    </span>
                                    <ACCDateTime
                                        :prop="PI_stnk_exp"
                                        @input="OnexpChange"
                                        v-model="M_ModalDoc.exp"
                                        ref="ref_stnk_exp"
                                    />
                                    </b-col>
                                </b-row>
                                <b-row>
                                    <b-col md="6">
                                        <img id="logo" :src="M_ModalDoc.file_show" alt style="width: 50px;" />
                                    </b-col>
                                    <b-col md="6">
                                        <ACCImageUpload
                                            :prop="PI_stnk_logo"
                                            @change="onlogoChange"
                                            v-model="M_ModalDoc.file_logo"
                                        />
                                    </b-col>
                                </b-row>
                                <b-row style="margin-top: 10px;">
                                    <b-col md="6">
                                    <ABSButton
                                        :text="'Add'"
                                        classButton="btn btn--default"
                                        classIcon="icon-style-1"
                                        @click="SaveModal('S')"
                                        styleButton="height: 40px;width: 100%;"
                                    />
                                    </b-col>
                                    <b-col md="6">
                                    <ABSButton
                                        :text="'Cancel'"
                                        classButton="btn btn--back"
                                        classIcon="icon-style-1"
                                        @click="CancelModal('S')"
                                        styleButton="height: 40px;width: 100%;"
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

                <ABSModal id="Modal_DOC" ref="Modal_DOC" size="sm">
                    <template slot="headerTitle">Other Document</template>
                    <template slot="content">
                        <b-row>
                        <b-col md="12">
                            <b-form
                            :data-vv-scope="'Parent_DOC'"
                            :data-vv-value-path="'Parent_DOC'"
                            >
                            <b-row>
                                <b-col md="12">
                                <b-row>
                                    <b-col md="12">
                                    <span>
                                        <label>DOC No.</label>
                                    </span>
                                    <ACCTextBox
                                        :prop="PI_doc_no"
                                        v-model="M_ModalDoc.no"
                                        ref="ref_doc_no"
                                    />
                                    </b-col>
                                </b-row>
                                <b-row>
                                    <b-col md="12">
                                    <span>
                                        <label>DOC Expire</label>
                                    </span>
                                    <ACCDateTime
                                        :prop="PI_doc_exp"
                                        @input="OnexpChange"
                                        v-model="M_ModalDoc.exp"
                                        ref="ref_doc_exp"
                                    />
                                    </b-col>
                                </b-row>
                                <b-row>
                                    <b-col md="6">
                                        <img id="logo" :src="M_ModalDoc.file_show" alt style="width: 50px;" />
                                    </b-col>
                                    <b-col md="6">
                                        <ACCImageUpload
                                            :prop="PI_doc_logo"
                                            @change="onlogoChange"
                                            v-model="M_ModalDoc.file_logo"
                                        />
                                    </b-col>
                                </b-row>
                                <b-row style="margin-top: 10px;">
                                    <b-col md="6">
                                    <ABSButton
                                        :text="'Add'"
                                        classButton="btn btn--default"
                                        classIcon="icon-style-1"
                                        @click="SaveModal('O')"
                                        styleButton="height: 40px;width: 100%;"
                                    />
                                    </b-col>
                                    <b-col md="6">
                                    <ABSButton
                                        :text="'Cancel'"
                                        classButton="btn btn--back"
                                        classIcon="icon-style-1"
                                        @click="CancelModal('O')"
                                        styleButton="height: 40px;width: 100%;"
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
        PI_plate_no: {
            cValidate: "",
            cName: "plate_no",
            cOrder: 1,
            cKey: false,
            cType: "text",
            cProtect: false,
            cParentForm: "ADM_AddFleetManagement",
            cDecimal: 2,
            cInputStatus: this.inputStatus
        },
        PI_fleet_type: {
            dataLookUp: {
                LookUpCd: "GetFleetType",
                ColumnDB: "fleet_type_id",
                InitialWhere: "",
                ParamWhere: "",
                OrderBy: "",
                ParamView: "",
                SourceField: "",
                DisplayLookUp: "descs,time_edit"
            },
            cValidate: "",
            cName: "role",
            ckey: false,
            cOrder: 2,
            cProtect: false,
            cParentForm: "ADM_AddFleetManagement",
            cStatic: false,
            cOption: [],
            cDisplayColumn: "descs,time_edit",
            cInputStatus: this.inputStatus
        },
        PI_descs: {
            cValidate: "",
            cName: "descs",
            cOrder: 3,
            cKey: false,
            cType: "text",
            cProtect: false,
            cParentForm: "ADM_AddFleetManagement",
            cDecimal: 2,
            cInputStatus: this.inputStatus
        },
        PI_driver1: {
            dataLookUp: {
                LookUpCd: "GetDriver",
                ColumnDB: "driver_id",
                InitialWhere: "",
                ParamWhere: "",
                OrderBy: "",
                ParamView: "",
                SourceField: "",
                DisplayLookUp: "driver_name,handphone"
            },
            cValidate: "",
            cName: "role",
            ckey: false,
            cOrder: 4,
            cProtect: false,
            cParentForm: "ADM_AddFleetManagement",
            cStatic: false,
            cOption: [],
            cDisplayColumn: "driver_name,handphone",
            cInputStatus: this.inputStatus
        },
        PI_driver2: {
            dataLookUp: {
                LookUpCd: "GetDriver",
                ColumnDB: "driver_id",
                InitialWhere: "",
                ParamWhere: "",
                OrderBy: "",
                ParamView: "",
                SourceField: "",
                DisplayLookUp: "driver_name,handphone"
            },
            cValidate: "",
            cName: "role",
            ckey: false,
            cOrder: 5,
            cProtect: false,
            cParentForm: "ADM_AddFleetManagement",
            cStatic: false,
            cOption: [],
            cDisplayColumn: "driver_name,handphone",
            cInputStatus: this.inputStatus
        },
      PI_notes: {
        cValidate: "",
        cName: "notes",
        cOrder: 6,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 1,
        cMaxRows: 3,
        cSize: "md",
        cParentForm: "ADM_AddFleetManagement",
        cInputStatus: this.inputStatus
      },
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
        PI_bpkb_no: {
            cValidate: "",
            cName: "bpkb_no",
            cOrder: 1,
            cKey: false,
            cType: "text",
            cProtect: false,
            cParentForm: "Parent_BPKB",
            cDecimal: 2,
            cInputStatus: this.inputStatus
        },
        PI_bpkb_logo: {
            cName: "BPKB",
            cAccept: ".jpg, .png, .gif",
            cTitle: "Add Document",
            cModule: "ADM"
        },
        M_STNK: [],
        PI_stnk_no: {
            cValidate: "",
            cName: "stnk_no",
            cOrder: 1,
            cKey: false,
            cType: "text",
            cProtect: false,
            cParentForm: "Parent_STNK",
            cDecimal: 2,
            cInputStatus: this.inputStatus
        },
        PI_stnk_exp: {
            cValidate: "",
            cName: "stnk_exp",
            cOrder: 2,
            cKey: false,
            cProtect: false,
            cWithTime: false,
            cFormat: "dd/MM/yyyy",
            cParentForm: "Parent_STNK"
        },
        PI_stnk_logo: {
            cName: "STNK",
            cAccept: ".jpg, .png, .gif",
            cTitle: "Add Document",
            cModule: "ADM"
        },
        M_Doc: [],
        PI_doc_no: {
            cValidate: "",
            cName: "doc_no",
            cOrder: 1,
            cKey: false,
            cType: "text",
            cProtect: false,
            cParentForm: "Parent_DOC",
            cDecimal: 2,
            cInputStatus: this.inputStatus
        },
        PI_doc_exp: {
            cValidate: "",
            cName: "doc_exp",
            cOrder: 2,
            cKey: false,
            cProtect: false,
            cWithTime: false,
            cFormat: "dd/MM/yyyy",
            cParentForm: "Parent_DOC"
        },
        PI_doc_logo: {
            cName: "DOC",
            cAccept: ".jpg, .png, .gif",
            cTitle: "Add Document",
            cModule: "ADM"
        },
        default_pic: require('@/assets/default_photo_.png'),
        M_ModalDoc: {
            no: "",
            exp: "",
            file_logo: "",
            file_logo_name: "",
            file_logo_path: "",
            file_show: require('@/assets/default_photo_.png')
        }
    };
  },
  computed: {
    paramFromList() {
      var param = this.$route.params;
      // if (param == null || param == undefined) {
      //   this.doBack();
      // } else {
      //   if (Object.keys(param).length < 1) {
      //     this.doBack();
      //   } else {
      return param;
      //   }
      // }
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
    OpenModal(from) {
        this.M_ClearModal();
        if (from == "B") {
            this.$refs.Modal_BPKB._show();
        }
        else if (from == "S") {
            this.$refs.Modal_STNK._show();
        }
        else if (from == "O") {
            this.$refs.Modal_DOC._show();
        }
    },
    CancelModal(from) {
        if (from == "B") {
            this.$refs.Modal_BPKB._hide();
        }
        else if (from == "S") {
            this.$refs.Modal_STNK._hide();
        }
        else if (from == "O") {
            this.$refs.Modal_DOC._hide();
        }
    },
    SaveModal(from) {
        if (from == "B") {
            this.M_BPKB.push({
                no: this.M_ModalDoc.no,
                exp: "",
                file_logo: this.M_ModalDoc.file_logo,
                file_logo_name: this.M_ModalDoc.file_logo_name,
                file_logo_path: this.M_ModalDoc.file_logo_path,
                file_show: this.M_ModalDoc.file_show,
                status: "N"
            })
        }
        else if (from == "S") {
            this.M_STNK.push({
                no: this.M_ModalDoc.no,
                exp: this.M_ModalDoc.exp,
                file_logo: this.M_ModalDoc.file_logo,
                file_logo_name: this.M_ModalDoc.file_logo_name,
                file_logo_path: this.M_ModalDoc.file_logo_path,
                file_show: this.M_ModalDoc.file_show,
                status: "N"
            })
        }
        else if (from == "O") {
            this.M_Doc.push({
                no: this.M_ModalDoc.no,
                exp: this.M_ModalDoc.exp,
                file_logo: this.M_ModalDoc.file_logo,
                file_logo_name: this.M_ModalDoc.file_logo_name,
                file_logo_path: this.M_ModalDoc.file_logo_path,
                file_show: this.M_ModalDoc.file_show,
                status: "N"
            })
        }

        this.CancelModal(from)
    },
    Delete(from, data, index) {
        if (from == "B") {
            this.M_BPKB.splice(index, 1)
        }
        else if (from == "S") {
            this.M_STNK.splice(index, 1)
        }
        else if (from == "O") {
            this.M_Doc.splice(index, 1)
        }
    },
    Edit(from, data, index) {
        this.OpenModal(from)
        if (from == "B") {
            var dt = this.M_BPKB[index]
            this.M_ModalDoc = {
                no: dt.no,
                exp: "",
                file_logo: dt.file_logo,
                file_logo_name: dt.file_logo_name,
                file_logo_path: dt.file_logo_path,
                file_show: dt.file_show
            }
        }
        else if (from == "S") {
            var dt = this.M_STNK[index]
            this.M_ModalDoc = {
                no: dt.no,
                exp: dt.exp,
                file_logo: dt.file_logo,
                file_logo_name: dt.file_logo_name,
                file_logo_path: dt.file_logo_path,
                file_show: dt.file_show
            }
        }
        else if (from == "O") {
            var dt = this.M_Doc[index]
            this.M_ModalDoc = {
                no: dt.no,
                exp: dt.exp,
                file_logo: dt.file_logo,
                file_logo_name: dt.file_logo_name,
                file_logo_path: dt.file_logo_path,
                file_show: dt.file_show
            }
        }
    },
    M_ClearForm() {
      this.M_FleetManagement = {
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
      };
    },
    M_ClearModal() {
        this.M_ModalDoc = {
            no: "",
            exp: "",
            file_logo: "",
            file_logo_name: "",
            file_logo_path: "",
            file_show: require('@/assets/default_photo_.png')
        }
    },
    Onfleet_typeChange(data) {
      this.$nextTick(() => {
        this.M_FleetManagement.fleet_type = data.fm_fleet_type_id;
        this.M_FleetManagement.fleet_typeLabel = data.descs;
      });
    },
    Ondriver1Change(data) {
      this.$nextTick(() => {
        this.M_FleetManagement.driver1 = data.fm_driver_id;
        this.M_FleetManagement.driver1Label = data.driver_name;
      });
    },
    Ondriver2Change(data) {
      this.$nextTick(() => {
        this.M_FleetManagement.driver2 = data.fm_driver_id;
        this.M_FleetManagement.driver2Label = data.driver_name;
      });
    },
    OnexpChange(data) {
        // this.M_ModalDoc.exp = data
    },
    onlogoChange(data) {
      this.M_ModalDoc.file_logo_name = data.name;
      this.M_ModalDoc.file_logo_path = data.path;
      this.M_ModalDoc.file_show = this.url + data.path;
    },
    doSave() {
      this.$validator._base.validateAll("ADM_AddFleetManagement").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("ADM_AddFleetManagement");
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
        var paramD = [];
        var paramH = {
            _Method_: "SAVE",
            _LineNo_: 0,
            license_plate_no: this.M_FleetManagement.plate_no,
            fm_fleet_type_id: this.M_FleetManagement.fleet_type,
            fm_driver_id: this.M_FleetManagement.driver1,
            fm_driver_id2: this.M_FleetManagement.driver2,
            descs: this.M_FleetManagement.descs,
            bpkb_no: "NULL",
            stnk_no: "NULL",
            stnk_expiry_date: "NULL",
            // notes: this.M_FleetManagement.notes,
            user_input: this.getDataUser().user_id
        }

        this.M_BPKB.forEach((doc, index) => {
            paramD.push({
                _Method_: "SAVE",
                _LineNo_: 1,
                fm_fleet_mstr_id: "A_Insert.row_id_output",
                doc_type: "B",
                doc_no: doc.no,
                doc_file_name: doc.file_logo_name,
                doc_path_file: doc.file_logo_path,
                expiry_date: doc.exp && doc.exp !== "" ? doc.exp : "NULL",
                user_input: this.getDataUser().user_id
            })
        })

        this.M_STNK.forEach((doc, index) => {
            paramD.push({
                _Method_: "SAVE",
                _LineNo_: 1,
                fm_fleet_mstr_id: "A_Insert.row_id_output",
                doc_type: "S",
                doc_no: doc.no,
                doc_file_name: doc.file_logo_name,
                doc_path_file: doc.file_logo_path,
                expiry_date: doc.exp && doc.exp !== "" ? doc.exp : "NULL",
                user_input: this.getDataUser().user_id
            })
        })

        this.M_Doc.forEach((doc, index) => {
            paramD.push({
                _Method_: "SAVE",
                _LineNo_: 1,
                fm_fleet_mstr_id: "A_Insert.row_id_output",
                doc_type: "O",
                doc_no: doc.no,
                doc_file_name: doc.file_logo_name,
                doc_path_file: doc.file_logo_path,
                expiry_date: doc.exp && doc.exp !== "" ? doc.exp : "NULL",
                user_input: this.getDataUser().user_id
            })
        })

        var param = {
            option_url: "/ADM/ADM_FleetManagement",
            line_no: 0,
            Data: [{
                A_Insert: paramH,
                B_Looping: paramD
            }]
        };

        this.postJSONMulti(this.getUrlProsesDataPostMulti(), params).then(response => {
            // console.log(response)
            if (response == null) return;
                this.alertSuccess("Save Data Has Been Successfully").then(() => {
                this.doBack();
            });
        });
    },
    GetDataBy() {
      var param = {
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlAPIUser(this.paramFromList.row_id), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data;

        this.PI_user_id.cProtect = true

        this.M_FleetManagement = {
          user_name: this.getDataUser().user_name,
          ss_user_id: data.ss_user_id,
          user_id: data.user_id,
          customer_name: data.user_name,
          phone_no: data.hand_phone,
          address: data.address,
          email: data.email,
          password: "",
          confirm_password: "",
          role: data.ss_group_id,
          roleLabel: data.group_descs,
          notes: data.notes,
          user_level: data.user_level,
          file_logo: data.file_name,
          file_show: data.path_file && data.path_file !== '' ? (this.url + data.path_file) : this.default_pic,
          file_logo_name: data.file_name,
          file_logo_path: data.path_file
        };
      });
    },
    M_Update() {
      var param = {
        ss_portfolio_id: this.getDataUser().portfolio_id,
        ss_subportfolio_id: this.getDataUser().subportfolio_id,
        ss_user_id: this.M_FleetManagement.ss_user_id,
        user_id: this.M_FleetManagement.user_id,
        ss_group_id: this.M_FleetManagement.role,
        user_name: this.M_FleetManagement.customer_name,
        address: this.M_FleetManagement.address,
        password: this.M_FleetManagement.password,
        email: this.M_FleetManagement.email,
        user_level: this.M_FleetManagement.user_level,
        hand_phone: this.M_FleetManagement.phone_no,
        file_name: this.M_FleetManagement.file_logo_name,
        path_file: this.M_FleetManagement.file_logo_path,
        notes: this.M_FleetManagement.notes,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
        user_edit: this.getDataUser().user_id
      };

      this.putJSON(this.getUrlAPIUser(), param).then(response => {
        // console.log(response)
        if (response == null) return;
        this.alertSuccess("Update Data Has Been Successfully").then(() => {
          this.doBack();
        });
      });
    }
  },
  mounted() {
    this.M_ClearForm();
    if (this.inputStatus == "edit") {
      this.GetDataBy();
    }
  }
};
</script>

<style>
</style>