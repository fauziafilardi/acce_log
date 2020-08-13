<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Add Ticket</span>
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
                :data-vv-scope="'M_Ticket'"
                :data-vv-value-path="'M_Ticket'"
              >
                <b-row>
                  <b-col md="2">
                    <div>
                      <!-- <img :src="M_NewProspect.path_file" alt width="100%" /> -->
                      <img :src="require('@/assets/paper.png')" alt style="width: 70px;" />
                    </div>
                  </b-col>
                  <b-col md="10" class="row-bordered">
                    <b-col md="6" offset="2">
                      <b-row>
                        <b-col>
                          <span>
                            <label>Ticket Category</label>
                          </span>
                          <ACCDropDown
                            @change="Onticket_categoryChange"
                            :prop="PI_ticket_category"
                            v-model="M_Ticket.ticket_category"
                            :label="M_Ticket.ticket_categoryLabel"
                            :ref="'ref_ticket_category'"
                          />
                        </b-col>
                      </b-row>
                      <b-row>
                        <b-col>
                          <span>
                            <label>Description</label>
                          </span>
                          <ACCTextArea
                            :prop="PI_ticket_descs"
                            v-model="M_Ticket.descs"
                            ref="ref_descs"
                          />
                        </b-col>
                      </b-row>
                      <b-row>
                        <b-col>
                          <img v-if="M_Ticket.file_path && M_Ticket.file_path !== ''"
                            id="ticket_attachment"
                            :src="url + M_Ticket.file_path"
                            alt
                            style="width: 200px;"
                          />
                          <ACCImageUpload
                            :prop="PI_ticket_attachment"
                            @change="Onticket_attachmentChange"
                            v-model="M_Ticket.file_name"
                          />
                        </b-col>
                      </b-row>
                      <b-row style="margin-top: 10px;">
                        <b-col>
                          <ABSButton
                            :text="'Submit Ticket'"
                            classButton="btn btn--default"
                            classIcon="icon-style-default"
                            @click="doSave"
                            styleButton="height: 40px;width: 100%;"
                          />
                        </b-col>
                      </b-row>
                    </b-col>
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
      title: "",

      M_Ticket: {
        ticket_category: "",
        ticket_categoryLabel: "",
        descs: "",
        file_name: "",
        file_path: ""
      },
      PI_ticket_category: {
          dataLookUp: {
              LookUpCd:'GetTicketCategory',
              ColumnDB:'op_ticket_category_id',
              InitialWhere:"ss_portfolio_id='" + this.getDataUser().portfolio_id + "'",
              ParamWhere:'',
              OrderBy:'',
              ParamView:'',
              SourceField:'',
              DisplayLookUp:'ticket_category'
          },
          cValidate: "required",
          cName: "comodity",
          ckey: false,
          cOrder: 1,
          cProtect: false,
          cParentForm: "M_Ticket",
          cStatic: false,
          cOption: [],
          cDisplayColumn: "ticket_category",
          cInputStatus: "new"
      },
      PI_ticket_descs: {
        cValidate: "",
        cName: "ticket_descs",
        cOrder: 2,
        cKey: false,
        cProtect: false,
        cResize: false,
        cReadonly: false,
        cRows: 3,
        cMaxRows: 3,
        cSize: "md",
        cParentForm: "M_Ticket",
        cInputStatus: "new"
      },
      PI_ticket_attachment: {
        cName: 'attachment',
        cAccept: '.jpg, .png, .gif',
        cTitle: 'Attachment',
        cModule: 'OP',
      },
    };
  },
  computed: {
    paramFromList() {
        var param = this.$store.getters.getParamPage;
        param = param.Ticket
        console.log(param)
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
      var param = this.$store.getters.getParamPage;
      if (param.isEdit && param.isEdit === true) {
        return "edit";
      } else {
        return "new";
      }
    },
  },
  methods: {
    doBack() {
      this.$router.go(-1);
    },

    M_ClearForm() {
      this.M_OpOrderCost = {
        ticket_category: "",
        ticket_categoryLabel: "",
        descs: "",
        file_name: "",
        file_path: ""
      };
    },

    doSave() {
      this.$validator._base.validateAll("M_Ticket").then((result) => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          (ress) => {
            if (ress.value) {
              this.$validator.errors.clear("M_Ticket");
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
    Onticket_categoryChange(data) {
      this.M_Ticket.ticket_category = data.id
      this.M_Ticket.ticket_categoryLabel = data.label
    },
    Onticket_attachmentChange(data) {
      this.M_Ticket.file_name = data.name;
      this.M_Ticket.file_path = data.path;
    },
    Save_Ticket() {
      this.$validator._base.validateAll("M_Ticket").then(result => {
        if (!result) return;
        this.alertConfirmation("Are You Sure Want To Save This Data ?").then(
          ress => {
            if (ress.value) {
              this.$validator.errors.clear("M_Ticket");
              var param = {}
              if (this.M_Ticket.op_order_ticket_id && this.M_Ticket.op_order_ticket_id !== '') {
                param = {
                  option_url: "/OP/OP_Order",
                  line_no: 3,
                  op_order_ticket_id: this.M_Ticket.op_order_ticket_id,
                  ss_portfolio_id: this.getDataUser().portfolio_id,
                  op_order_id: this.paramFromList.row_id,
                  ticket_no: this.M_Ticket.ticket_no,
                  ticket_date: this.M_Ticket.ticket_date,
                  op_ticket_category_id: this.M_Ticket.ticket_category,
                  descs: this.M_Ticket.ticket_descs,
                  doc_file_name: this.M_Ticket.file_name,
                  doc_path_file: this.M_Ticket.file_path,
                  ticket_status: this.M_Ticket.ticket_status && this.M_Ticket.ticket_status !== '' ? this.M_Ticket.ticket_status : "NULL",
                  remarks: this.M_Ticket.remarks && this.M_Ticket.remarks !== '' ? this.M_Ticket.remarks : "NULL",
                  wo_status: this.M_Ticket.wo_status && this.M_Ticket.wo_status !== '' ? this.M_Ticket.wo_status : "NULL",
                  claim_status: this.M_Ticket.claim_status && this.M_Ticket.claim_status !== '' ? this.M_Ticket.claim_status : "NULL",
                  change_vehicle_status: this.M_Ticket.change_vehicle_status && this.M_Ticket.change_vehicle_status !== '' ? this.M_Ticket.change_vehicle_status : "NULL",
                  fm_fleet_mstr_id: this.M_Ticket.fm_fleet_mstr_id && this.M_Ticket.fm_fleet_mstr_id !== '' ? this.M_Ticket.fm_fleet_mstr_id : "NULL",
                  license_plate_no: this.M_Ticket.license_plate_no && this.M_Ticket.license_plate_no !== '' ? this.M_Ticket.license_plate_no : "NULL",
                  fm_driver_id: this.M_Ticket.fm_driver_id && this.M_Ticket.fm_driver_id !== '' ? this.M_Ticket.fm_driver_id : "NULL",
                  fm_driver_id2: this.M_Ticket.fm_driver_id2 && this.M_Ticket.fm_driver_id2 !== '' ? this.M_Ticket.fm_driver_id2 : "NULL",
                  lastupdatestamp: this.M_Ticket.lastupdatestamp,
                  user_edit: this.getDataUser().user_id
                };

                this.putJSON(this.getUrlCRUD(), param).then(response => {
                  if (response == null) return;
                  this.alertSuccess(response.Message).then(() => {
                    this.$refs.Modal_Ticket._hide();
                    this.GetDataBy();
                  });
                });
              }
              else {
                param = {
                  option_url: "/OP/OP_Order",
                  line_no: 3,
                  ss_portfolio_id: this.getDataUser().portfolio_id,
                  op_order_id: this.paramFromList.row_id,
                  ticket_date: new Date(),
                  op_ticket_category_id: this.M_Ticket.ticket_category,
                  descs: this.M_Ticket.ticket_descs,
                  doc_file_name: this.M_Ticket.file_name,
                  doc_path_file: this.M_Ticket.file_path,
                  remarks: 'NULL',
                  wo_status: 'NULL',
                  claim_status: 'NULL',
                  change_vehicle_status: 'NULL',
                  fm_fleet_mstr_id: this.M_DataPost.fm_fleet_mstr_id,
                  license_plate_no: this.M_DataPost.license_plate_no,
                  fm_driver_id: this.M_DataPost.fm_driver_id,
                  fm_driver_id2: this.M_DataPost.fm_driver_id2,
                  user_input: this.getDataUser().user_id
                };

                this.postJSON(this.getUrlCRUD(), param).then(response => {
                  if (response == null) return;
                  this.alertSuccess(response.Message).then(() => {
                    this.$refs.Modal_Ticket._hide();
                    this.GetDataBy();
                  });
                });
              }
            }
          }
        );
      });
    },
    M_Save() {
      var param = {
        option_url: "/OP/OP_Order",
        line_no: 3,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        op_order_id: this.paramFromList.row_id,
        ticket_date: new Date(),
        op_ticket_category_id: this.M_Ticket.ticket_category,
        descs: this.M_Ticket.ticket_descs,
        doc_file_name: this.M_Ticket.file_name,
        doc_path_file: this.M_Ticket.file_path,
        remarks: 'NULL',
        wo_status: 'NULL',
        claim_status: 'NULL',
        change_vehicle_status: 'NULL',
        fm_fleet_mstr_id: this.paramFromList.Ticket.fm_fleet_mstr_id && this.paramFromList.Ticket.fm_fleet_mstr_id !== '' ? this.paramFromList.Ticket.fm_fleet_mstr_id : "NULL",
        license_plate_no: this.paramFromList.Ticket.license_plate_no && this.paramFromList.Ticket.license_plate_no !== '' ? this.paramFromList.Ticket.license_plate_no : "NULL",
        fm_driver_id: this.paramFromList.Ticket.fm_driver_id && this.paramFromList.Ticket.fm_driver_id !== '' ? this.paramFromList.Ticket.fm_driver_id : "NULL",
        fm_driver_id2: this.paramFromList.Ticket.fm_driver_id2 && this.paramFromList.Ticket.fm_driver_id2 !== '' ? this.paramFromList.Ticket.fm_driver_id2 : "NULL",
        user_input: this.getDataUser().user_id
      };

      this.postJSON(this.getUrlCRUD(), param).then((response) => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
    },
    M_Update() {
      var param = {
        option_url: "/OP/OP_Order",
        line_no: 3,
        op_order_ticket_id: this.M_Ticket.op_order_ticket_id,
        ss_portfolio_id: this.getDataUser().portfolio_id,
        op_order_id: this.paramFromList.row_id,
        ticket_no: this.M_Ticket.ticket_no,
        ticket_date: this.M_Ticket.ticket_date,
        op_ticket_category_id: this.M_Ticket.ticket_category,
        descs: this.M_Ticket.ticket_descs,
        doc_file_name: this.M_Ticket.file_name,
        doc_path_file: this.M_Ticket.file_path,
        ticket_status: this.M_Ticket.ticket_status && this.M_Ticket.ticket_status !== '' ? this.M_Ticket.ticket_status : "NULL",
        remarks: this.M_Ticket.remarks && this.M_Ticket.remarks !== '' ? this.M_Ticket.remarks : "NULL",
        wo_status: this.M_Ticket.wo_status && this.M_Ticket.wo_status !== '' ? this.M_Ticket.wo_status : "NULL",
        claim_status: this.M_Ticket.claim_status && this.M_Ticket.claim_status !== '' ? this.M_Ticket.claim_status : "NULL",
        change_vehicle_status: this.M_Ticket.change_vehicle_status && this.M_Ticket.change_vehicle_status !== '' ? this.M_Ticket.change_vehicle_status : "NULL",
        fm_fleet_mstr_id: this.M_Ticket.fm_fleet_mstr_id && this.M_Ticket.fm_fleet_mstr_id !== '' ? this.M_Ticket.fm_fleet_mstr_id : "NULL",
        license_plate_no: this.M_Ticket.license_plate_no && this.M_Ticket.license_plate_no !== '' ? this.M_Ticket.license_plate_no : "NULL",
        fm_driver_id: this.M_Ticket.fm_driver_id && this.M_Ticket.fm_driver_id !== '' ? this.M_Ticket.fm_driver_id : "NULL",
        fm_driver_id2: this.M_Ticket.fm_driver_id2 && this.M_Ticket.fm_driver_id2 !== '' ? this.M_Ticket.fm_driver_id2 : "NULL",
        lastupdatestamp: this.M_Ticket.lastupdatestamp,
        user_edit: this.getDataUser().user_id
      };

      this.putJSON(this.getUrlCRUD(), param).then((response) => {
        if (response == null) return;
        this.alertSuccess(response.Message).then(() => {
          this.doBack();
        });
      });
    },
    GetDataBy() {
      var param = {
        option_url: "/OP/OP_Order",
        line_no: 3,
        id: this.paramFromList.Ticket.row_id,
        lastupdatestamp: this.paramFromList.Ticket.lastupdatestamp,
      };

      this.getJSON(this.getUrlCRUD(), param).then((response) => {
        // response from API
        if (response == null) return;

        var data = response.Data[0];
        this.M_Ticket = {
          op_order_ticket_id: data.op_order_ticket_id,
          ticket_no: data.ticket_no,
          ticket_category: data.op_ticket_category_id__lo_1,
          ticket_categoryLabel: data.ticket_category__lbl_lo_1,
          descs: data.descs__tb_2,
          file_name: data.doc_file_name,
          file_path: data.doc_path_file,
          ticket_status: data.ticket_status,
          ticket_date: data.ticket_date,
          remarks: data.remarks,
          wo_status: data.wo_status,
          claim_status: data.claim_status,
          change_vehicle_status: data.change_vehicle_status,
          fm_fleet_mstr_id: data.fm_fleet_mstr_id,
          license_plate_no: data.license_plate_no,
          fm_driver_id: data.fm_driver_id,
          fm_driver_id2: data.fm_driver_id2,
          lastupdatestamp: record.lastupdatestamp
        }
      });
    },
  },
  mounted() {
    this.M_ClearForm();
    if (this.inputStatus == "edit") {
      this.GetDataBy();
    }
  },
};
</script>

