<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Driver Management</span>
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
                :data-vv-scope="'ADM_AddDriverManagement'"
                :data-vv-value-path="'ADM_AddDriverManagement'"
              >
                <b-row>
                  <b-col md="2">
                    <div>
                      <img id="logo" :src="require('@/assets/avatar.png')" alt width="100%" />
                    </div>
                  </b-col>
                  <b-col md="10">
                    <!-- <b-row>
                    <b-col md="12">-->
                    <b-row class="row-view">
                      <b-col md="2">
                        <font-awesome-icon class="icon-style-default" icon="user" />User
                      </b-col>
                      <b-col md="2">: {{ M_DriverManagement.user_name }}</b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Name</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_name"
                          v-model="M_DriverManagement.name"
                          ref="ref_name"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Phone</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_phone"
                          v-model="M_DriverManagement.hand_phone"
                          ref="ref_phone"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="6">
                        <span>
                          <label>Address</label>
                        </span>
                        <ACCTextBox
                          :prop="PI_address"
                          v-model="M_DriverManagement.address"
                          ref="ref_address"
                        />
                      </b-col>
                    </b-row>
                    <b-row>
                      <b-col md="2">
                        <div style="cursor: pointer;" @click="OpenModal('S')">
                          <font-awesome-icon class="icon-style-default" icon="plus-circle" />Add SIM Document tes
                        </div>
                      </b-col>
                    </b-row>
                    <template v-for="(data, index) in M_SIM">
                      <b-row v-bind:key="index">
                        <b-col md="3">
                          <span>
                            <label>SIM No.</label>
                          </span>
                          &nbsp;
                          <font-awesome-icon
                            class="icon-style-default"
                            style="cursor: pointer;"
                            icon="edit"
                            @click="Edit('S', data, index)"
                          />&nbsp;
                          <font-awesome-icon
                            class="icon-style-default"
                            style="color: red !important; cursor: pointer;"
                            icon="times-circle"
                            @click="Delete('S', data, index)"
                          />
                        </b-col>
                      </b-row>
                      <b-row v-bind:key="index">
                        <b-col md="3">
                          <b-form-input class="text-field-form" readonly="true" v-model="data.no" />
                        </b-col>
                      </b-row>
                      <b-row v-bind:key="index">
                        <b-col md="3">
                          <span>
                            <label>SIM Expire</label>
                          </span>
                          <br />
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
                        <div style="cursor: pointer;" @click="OpenModal('K')">
                          <font-awesome-icon class="icon-style-default" icon="plus-circle" />Add KTP Document
                        </div>
                      </b-col>
                    </b-row>
                    <template v-for="(data, index) in M_KTP">
                      <b-row v-bind:key="index">
                        <b-col md="3">
                          <span>
                            <label>KTP No.</label>
                          </span>
                          &nbsp;
                          <font-awesome-icon
                            class="icon-style-default"
                            style="cursor: pointer;"
                            icon="edit"
                            @click="Edit('K', data, index)"
                          />&nbsp;
                          <font-awesome-icon
                            class="icon-style-default"
                            style="color: red !important; cursor: pointer;"
                            icon="times-circle"
                            @click="Delete('K', data, index)"
                          />
                        </b-col>
                      </b-row>
                      <b-row v-bind:key="index">
                        <b-col md="3">
                          <b-form-input class="text-field-form" readonly="true" v-model="data.no" />
                        </b-col>
                      </b-row>
                      <b-row v-bind:key="index">
                        <b-col md="3">
                          <span>
                            <label>KTP Expire</label>
                          </span>
                          <br />
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
                        <div style="cursor: pointer;" @click="OpenModal('O')">
                          <font-awesome-icon class="icon-style-default" icon="plus-circle" />Add Other Document
                        </div>
                      </b-col>
                    </b-row>
                    <template v-for="(data, index) in M_Doc">
                      <b-row v-bind:key="index">
                        <b-col md="3">
                          <span>
                            <label>Other Document No.</label>
                          </span>
                          &nbsp;
                          <font-awesome-icon
                            class="icon-style-default"
                            style="cursor: pointer;"
                            icon="edit"
                            @click="Edit('O', data, index)"
                          />&nbsp;
                          <font-awesome-icon
                            class="icon-style-default"
                            style="color: red !important; cursor: pointer;"
                            icon="times-circle"
                            @click="Delete('O', data, index)"
                          />
                        </b-col>
                      </b-row>
                      <b-row v-bind:key="index">
                        <b-col md="3">
                          <b-form-input class="text-field-form" readonly="true" v-model="data.no" />
                        </b-col>
                      </b-row>
                      <b-row v-bind:key="index">
                        <b-col md="3">
                          <span>
                            <label>Other Document Expire</label>
                          </span>
                          <br />
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
                          v-model="M_DriverManagement.notes"
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

              <ABSModal id="Modal_SIM" ref="Modal_SIM" size="sm">
                <template slot="headerTitle">SIM Document</template>
                <template slot="content">
                  <b-row>
                    <b-col md="12">
                      <b-form :data-vv-scope="'Parent_SIM'" :data-vv-value-path="'Parent_SIM'">
                        <b-row>
                          <b-col md="12">
                            <b-row>
                              <b-col md="12">
                                <span>
                                  <label>SIM No.</label>
                                </span>
                                <ACCTextBox
                                  :prop="PI_sim_no"
                                  v-model="M_ModalDoc.no"
                                  ref="ref_sim_no"
                                />
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col md="12">
                                <span>
                                  <label>SIM Expire</label>
                                </span>
                                <ACCDateTime
                                  :prop="PI_sim_exp"
                                  @input="OnexpChange"
                                  v-model="M_ModalDoc.exp"
                                  ref="ref_sim_exp"
                                />
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col md="6">
                                <img id="logo" :src="M_ModalDoc.file_show" alt style="width: 50px;" />
                              </b-col>
                              <b-col md="6">
                                <ACCImageUpload
                                  :prop="PI_sim_logo"
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

              <ABSModal id="Modal_KTP" ref="Modal_KTP" size="sm">
                <template slot="headerTitle">KTP Document</template>
                <template slot="content">
                  <b-row>
                    <b-col md="12">
                      <b-form :data-vv-scope="'Parent_KTP'" :data-vv-value-path="'Parent_KTP'">
                        <b-row>
                          <b-col md="12">
                            <b-row>
                              <b-col md="12">
                                <span>
                                  <label>KTP No.</label>
                                </span>
                                <ACCTextBox
                                  :prop="PI_ktp_no"
                                  v-model="M_ModalDoc.no"
                                  ref="ref_ktp_no"
                                />
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col md="12">
                                <span>
                                  <label>KTP Expire</label>
                                </span>
                                <ACCDateTime
                                  :prop="PI_ktp_exp"
                                  @input="OnexpChange"
                                  v-model="M_ModalDoc.exp"
                                  ref="ref_ktp_exp"
                                />
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col md="6">
                                <img id="logo" :src="M_ModalDoc.file_show" alt style="width: 50px;" />
                              </b-col>
                              <b-col md="6">
                                <ACCImageUpload
                                  :prop="PI_ktp_logo"
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
                                  @click="SaveModal('K')"
                                  styleButton="height: 40px;width: 100%;"
                                />
                              </b-col>
                              <b-col md="6">
                                <ABSButton
                                  :text="'Cancel'"
                                  classButton="btn btn--back"
                                  classIcon="icon-style-1"
                                  @click="CancelModal('K')"
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
                      <b-form :data-vv-scope="'Parent_DOC'" :data-vv-value-path="'Parent_DOC'">
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
      PI_name: {
        cValidate: "",
        cName: "name",
        cOrder: 1,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "ADM_AddDriverManagement",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_phone: {
        cValidate: "",
        cName: "phone",
        cOrder: 2,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "ADM_AddDriverManagement",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_address: {
        cValidate: "",
        cName: "address",
        cOrder: 3,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "ADM_AddDriverManagement",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_notes: {
        cValidate: "",
        cName: "notes",
        cOrder: 4,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 1,
        cMaxRows: 3,
        cSize: "md",
        cParentForm: "ADM_AddDriverManagement",
        cInputStatus: this.inputStatus
      },
      M_DriverManagement: {
        user_name: this.getDataUser().user_name,
        name: "",
        phone: "",
        address: "",
        driver_status: "N",
        notes: "",
        lastupdatestamp: ""
      },
      M_SIM: [],
      PI_sim_no: {
        cValidate: "",
        cName: "sim_no",
        cOrder: 1,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "Parent_SIM",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_sim_exp: {
        cValidate: "",
        cName: "sim_exp",
        cOrder: 2,
        cKey: false,
        cProtect: false,
        cWithTime: true,
        cFormat: "dd/MM/yyyy",
        cParentForm: "Parent_SIM"
      },
      PI_sim_logo: {
        cName: "SIM",
        cAccept: ".jpg, .png, .gif",
        cTitle: "Add Document",
        cModule: "ADM"
      },
      M_KTP: [],
      PI_ktp_no: {
        cValidate: "",
        cName: "ktp_no",
        cOrder: 1,
        cKey: false,
        cType: "text",
        cProtect: false,
        cParentForm: "Parent_KTP",
        cDecimal: 2,
        cInputStatus: this.inputStatus
      },
      PI_ktp_exp: {
        cValidate: "",
        cName: "ktp_exp",
        cOrder: 2,
        cKey: false,
        cProtect: false,
        cWithTime: true,
        cFormat: "dd/MM/yyyy",
        cParentForm: "Parent_KTP"
      },
      PI_ktp_logo: {
        cName: "KTP",
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
        cWithTime: true,
        cFormat: "dd/MM/yyyy",
        cParentForm: "Parent_DOC"
      },
      PI_doc_logo: {
        cName: "DOC",
        cAccept: ".jpg, .png, .gif",
        cTitle: "Add Document",
        cModule: "ADM"
      },
      default_pic: require("@/assets/default_photo_.png"),
      M_ModalDoc: {
        no: "",
        exp: "",
        file_logo: "",
        file_logo_name: "",
        file_logo_path: "",
        file_show: require("@/assets/default_photo_.png")
      },
      ModalIndex: null
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
      if (from == "S") {
        this.$refs.Modal_SIM._show();
      } else if (from == "K") {
        this.$refs.Modal_KTP._show();
      } else if (from == "O") {
        this.$refs.Modal_DOC._show();
      }
    },
    CancelModal(from) {
      if (from == "S") {
        this.$refs.Modal_SIM._hide();
      } else if (from == "K") {
        this.$refs.Modal_KTP._hide();
      } else if (from == "O") {
        this.$refs.Modal_DOC._hide();
      }
      this.ModalIndex = null;
    },
    SaveModal(from) {
      if (this.ModalIndex !== null) {
        if (from == "S") {
          // this.M_BPKB[this.ModalIndex] = {
          this.M_SIM[this.ModalIndex].no = this.M_ModalDoc.no;
          this.M_SIM[this.ModalIndex].exp = this.M_ModalDoc.exp;
          this.M_SIM[this.ModalIndex].file_logo = this.M_ModalDoc.file_logo;
          this.M_SIM[
            this.ModalIndex
          ].file_logo_name = this.M_ModalDoc.file_logo_name;
          this.M_SIM[
            this.ModalIndex
          ].file_logo_path = this.M_ModalDoc.file_logo_path;
          this.M_SIM[this.ModalIndex].file_show = this.M_ModalDoc.file_show;
          // type: "B",
          // status: "N"
          // }
        } else if (from == "K") {
          // this.M_STNK[this.ModalIndex] = {
          this.M_KTP[this.ModalIndex].no = this.M_ModalDoc.no;
          this.M_KTP[this.ModalIndex].exp = this.M_ModalDoc.exp;
          this.M_KTP[this.ModalIndex].file_logo = this.M_ModalDoc.file_logo;
          this.M_KTP[
            this.ModalIndex
          ].file_logo_name = this.M_ModalDoc.file_logo_name;
          this.M_KTP[
            this.ModalIndex
          ].file_logo_path = this.M_ModalDoc.file_logo_path;
          this.M_KTP[this.ModalIndex].file_show = this.M_ModalDoc.file_show;
          // type: "S",
          // status: "N"
          // }
        } else if (from == "O") {
          // this.M_Doc[this.ModalIndex] = {
          this.M_Doc[this.ModalIndex].no = this.M_ModalDoc.no;
          this.M_Doc[this.ModalIndex].exp = this.M_ModalDoc.exp;
          this.M_Doc[this.ModalIndex].file_logo = this.M_ModalDoc.file_logo;
          this.M_Doc[
            this.ModalIndex
          ].file_logo_name = this.M_ModalDoc.file_logo_name;
          this.M_Doc[
            this.ModalIndex
          ].file_logo_path = this.M_ModalDoc.file_logo_path;
          this.M_Doc[this.ModalIndex].file_show = this.M_ModalDoc.file_show;
          // type: "O",
          // status: "N"
          // }
        }
      } else {
        if (from == "S") {
          this.M_SIM.push({
            no: this.M_ModalDoc.no,
            exp: this.M_ModalDoc.exp,
            file_logo: this.M_ModalDoc.file_logo,
            file_logo_name: this.M_ModalDoc.file_logo_name,
            file_logo_path: this.M_ModalDoc.file_logo_path,
            file_show: this.M_ModalDoc.file_show,
            type: "S",
            driver_status: "N"
          });
        } else if (from == "K") {
          this.M_KTP.push({
            no: this.M_ModalDoc.no,
            exp: this.M_ModalDoc.exp,
            file_logo: this.M_ModalDoc.file_logo,
            file_logo_name: this.M_ModalDoc.file_logo_name,
            file_logo_path: this.M_ModalDoc.file_logo_path,
            file_show: this.M_ModalDoc.file_show,
            type: "K",
            driver_status: "N"
          });
        } else if (from == "O") {
          this.M_Doc.push({
            no: this.M_ModalDoc.no,
            exp: this.M_ModalDoc.exp,
            file_logo: this.M_ModalDoc.file_logo,
            file_logo_name: this.M_ModalDoc.file_logo_name,
            file_logo_path: this.M_ModalDoc.file_logo_path,
            file_show: this.M_ModalDoc.file_show,
            type: "O",
            driver_status: "N"
          });
        }
      }

      this.CancelModal(from);
    },
    Delete(from, data, index) {
      if (from == "S") {
        this.M_SIM.splice(index, 1);
      } else if (from == "K") {
        this.M_KTP.splice(index, 1);
      } else if (from == "O") {
        this.M_Doc.splice(index, 1);
      }
    },
    Edit(from, data, index) {
      this.ModalIndex = index;
      this.OpenModal(from);
      if (from == "S") {
        var dt = this.M_SIM[index];
        this.M_ModalDoc = {
          no: dt.no,
          exp: dt.exp,
          file_logo: dt.file_logo,
          file_logo_name: dt.file_logo_name,
          file_logo_path: dt.file_logo_path,
          file_show: dt.file_show
        };
      } else if (from == "K") {
        var dt = this.M_KTP[index];
        this.M_ModalDoc = {
          no: dt.no,
          exp: dt.exp,
          file_logo: dt.file_logo,
          file_logo_name: dt.file_logo_name,
          file_logo_path: dt.file_logo_path,
          file_show: dt.file_show
        };
      } else if (from == "O") {
        var dt = this.M_Doc[index];
        this.M_ModalDoc = {
          no: dt.no,
          exp: dt.exp,
          file_logo: dt.file_logo,
          file_logo_name: dt.file_logo_name,
          file_logo_path: dt.file_logo_path,
          file_show: dt.file_show
        };
      }
    },
    M_ClearForm() {
      this.M_DriverManagement = {
        user_name: this.getDataUser().user_name,
        name: "",
        phone: "",
        address: "",
        driver_status: "N",
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
        file_show: require("@/assets/default_photo_.png")
      };
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
      this.$validator._base
        .validateAll("ADM_AddDriverManagement")
        .then(result => {
          if (!result) return;
          this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
            ress => {
              if (ress.value) {
                this.$validator.errors.clear("ADM_AddDriverManagement");
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
        driver_name: this.M_DriverManagement.name,
        handphone: this.M_DriverManagement.hand_phone,
        address: this.M_DriverManagement.address,
        remarks: this.M_DriverManagement.notes,
        user_input: this.getDataUser().user_id
      };

      var paramD = [];
      this.M_SIM.forEach((doc, index) => {
        paramD.push({
          _Method_: "SAVE",
          _LineNo_: 1,
          fm_driver_id: "A_Insert.row_id_output",
          doc_type: "S",
          doc_no: doc.no,
          doc_file_name: doc.file_logo_name,
          doc_path_file: doc.file_logo_path,
          expiry_date: doc.exp && doc.exp !== "" ? doc.exp : "NULL",
          user_input: this.getDataUser().user_id,
          driver_status: "A"
        });
      });

      this.M_KTP.forEach((doc, index) => {
        paramD.push({
          _Method_: "SAVE",
          _LineNo_: 1,
          fm_driver_id: "A_Insert.row_id_output",
          doc_type: "K",
          doc_no: doc.no,
          doc_file_name: doc.file_logo_name,
          doc_path_file: doc.file_logo_path,
          expiry_date: doc.exp && doc.exp !== "" ? doc.exp : "NULL",
          user_input: this.getDataUser().user_id,
          driver_status: "A"
        });
      });

      this.M_Doc.forEach((doc, index) => {
        paramD.push({
          _Method_: "SAVE",
          _LineNo_: 1,
          fm_driver_id: "A_Insert.row_id_output",
          doc_type: "O",
          doc_no: doc.no,
          doc_file_name: doc.file_logo_name,
          doc_path_file: doc.file_logo_path,
          expiry_date: doc.exp && doc.exp !== "" ? doc.exp : "NULL",
          user_input: this.getDataUser().user_id,
          driver_status: "A"
        });
      });

      var param = {
        option_url: "/ADM/ADM_DriverManagement",
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
    GetDataBy() {
      var param = {
        option_url: "/ADM/ADM_DriverManagement",
        line_no: 0,
        id: this.paramFromList.row_id,
        lastupdatestamp: this.paramFromList.lastupdatestamp
      };

      this.getJSON(this.getUrlCRUD(), param).then(response => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];
        this.M_DriverManagement = {
          user_name: this.getDataUser().user_name,
          name: data.driver_name,
          hand_phone: data.handphone,
          address: data.address,
          notes: data.remarks
        };
        this.M_KTP = [];
        this.M_SIM = [];
        this.M_Doc = [];

        // this.$nextTick(() => {
        response.Data.forEach((dtl, index) => {
          if (dtl.dt_doc_type == "K") {
            this.M_KTP.push({
              no: dtl.dt_doc_no,
              exp: dtl.dt_expiry_date,
              file_logo: dtl.dt_doc_file_name,
              file_logo_name: dtl.dt_doc_file_name,
              file_logo_path: dtl.dt_doc_path_file,
              file_show: this.url + dtl.dt_doc_path_file,
              type: dtl.dt_doc_type,
              driver_status: "E"
            });
          } else if (dtl.dt_doc_type == "S") {
            this.M_SIM.push({
              no: dtl.dt_doc_no,
              exp: dtl.dt_expiry_date,
              file_logo: dtl.dt_doc_file_name,
              file_logo_name: dtl.dt_doc_file_name,
              file_logo_path: dtl.dt_doc_path_file,
              file_show: this.url + dtl.dt_doc_path_file,
              type: dtl.dt_doc_type,
              driver_status: "E"
            });
          } else if (dtl.dt_doc_type == "O") {
            this.M_Doc.push({
              no: dtl.dt_doc_no,
              exp: dtl.dt_expiry_date,
              file_logo: dtl.dt_doc_file_name,
              file_logo_name: dtl.dt_doc_file_name,
              file_logo_path: dtl.dt_doc_path_file,
              file_show: this.url + dtl.dt_doc_path_file,
              type: dtl.dt_doc_type,
              driver_status: "E"
            });
          }
        });
        var doc = this.M_SIM.concat(this.M_KTP.concat(this.M_Doc));
        console.log(JSON.stringify(doc, null, 2));
      });
    },
    M_Update() {
      var paramH = {
        _Method_: "UPDATE",
        _LineNo_: 0,
        fm_driver_id: this.paramFromList.row_id,
        driver_name: this.M_DriverManagement.name,
        handphone: this.M_DriverManagement.hand_phone,
        address: this.M_DriverManagement.address,
        driver_status: "E",
        remarks: this.M_DriverManagement.notes,
        lastupdatestamp: this.paramFromList.lastupdatestamp,
        user_edit: this.getDataUser().user_id
      };

      var paramDeleteDtl = {
        _Method_: "DELETE",
        _LineNo_: 2,
        fm_driver_id: this.paramFromList.row_id
      };

      var paramD = [];
      var doc = this.M_SIM.concat(this.M_KTP.concat(this.M_Doc));

      doc.forEach((doc, index) => {
        paramD.push({
          _Method_: "SAVE",
          _LineNo_: 1,
          fm_driver_id: this.paramFromList.row_id,
          doc_type: doc.type,
          doc_no: doc.no,
          doc_file_name: doc.file_logo_name,
          doc_path_file: doc.file_logo_path,
          expiry_date: doc.exp && doc.exp !== "" ? doc.exp : "NULL",
          user_input: this.getDataUser().user_id,
          driver_status: "E"
        });
      });
      console.log(JSON.stringify(paramH, null, 2));
      console.log(JSON.stringify(paramD, null, 2));
      // this.M_KTP.forEach((doc, index) => {
      //   paramD.push({
      //     _Method_: "SAVE",
      //     _LineNo_: 1,
      //     fm_driver_id: "A_Insert.row_id_output",
      //     doc_type: "K",
      //     doc_no: doc.no,
      //     doc_file_name: doc.file_logo_name,
      //     doc_path_file: doc.file_logo_path,
      //     expiry_date: doc.exp && doc.exp !== "" ? doc.exp : "NULL",
      //     user_input: this.getDataUser().user_id,
      //     driver_status: "A"
      //   });
      // });

      // this.M_Doc.forEach((doc, index) => {
      //   paramD.push({
      //     _Method_: "SAVE",
      //     _LineNo_: 1,
      //     fm_driver_id: "A_Insert.row_id_output",
      //     doc_type: "O",
      //     doc_no: doc.no,
      //     doc_file_name: doc.file_logo_name,
      //     doc_path_file: doc.file_logo_path,
      //     expiry_date: doc.exp && doc.exp !== "" ? doc.exp : "NULL",
      //     user_input: this.getDataUser().user_id,
      //     driver_status: "A"
      //   });
      // });

      var param = {
        option_url: "/ADM/ADM_DriverManagement",
        line_no: 0,
        Data: [
          {
            A_Update: paramH,
            B_Delete: paramDeleteDtl,
            C_Looping: paramD
          }
        ]
      };

      // return;
      this.postJSONMulti(this.getUrlProsesDataPostMulti(), param).then(
        response => {
          // console.log(response)
          if (response == null) return;
          this.alertSuccess("Update Data Has Been Successfully").then(() => {
            this.doBack();
          });
        }
      );
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