<template>
  <div class="dashboard-page-chart">
    <div class="dashboard-page-chart__body">
      <b-row class="dashboardBody">
        <b-col md="12">
          <div class="card" style="font-size: 12px !important;">
            <div class="card__title">
              <b-row>
                <b-col style="max-width:fit-content !important;">
                  <span>Quotation</span>
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
                :data-vv-scope="'MK_AddQuotation'"
                :data-vv-value-path="'MK_AddQuotation'"
              >
                <b-row>
                  <b-col md="2" style="text-align: center;">
                    <img :src="require('@/assets/date.png')" alt style="width: 100px;" />
                  </b-col>
                  <b-col md="10">
                    <b-row>
                        <b-col>
                            <b-row>
                                <b-col>
                                    <span>{{ M_Quotation.customer }}</span>
                                    <br />
                                    <span>
                                        <font-awesome-icon
                                            class="icon-style-default"
                                            icon="map-marker-alt"
                                            size="sm"
                                        />
                                        &nbsp;
                                        {{ M_Quotation.fulladdress }}
                                    </span>
                                    <span class="pull-right">
                                        <ABSButton
                                            :text="'Edit'"
                                            classButton="btn btn--default"
                                            classIcon="icon-style-1"
                                            @click="doEdit"
                                        />
                                    </span>
                                    <br />
                                    <span>
                                        <font-awesome-icon
                                            class="icon-style-default"
                                            icon="phone-square-alt"
                                            size="sm"
                                        />
                                        {{ M_Quotation.phone_no }}
                                    </span> &nbsp;
                                    <span>
                                        <font-awesome-icon class="icon-style-default" icon="envelope" size="sm" />
                                        {{ M_Quotation.email }}
                                    </span> &nbsp;
                                    <span>
                                        <font-awesome-icon
                                            class="icon-style-default"
                                            icon="globe-americas"
                                            size="sm"
                                        />
                                        {{ M_Quotation.website }}
                                    </span>
                                    <br />
                                    <span>
                                        <font-awesome-icon class="icon-style-default" icon="user" size="sm" />
                                        {{ M_Quotation.pic }}
                                    </span> &nbsp;
                                    <span>
                                        <font-awesome-icon
                                            class="icon-style-default"
                                            icon="phone-square-alt"
                                            size="sm"
                                        />
                                        {{ M_Quotation.pic_phone_no }}
                                    </span>
                                </b-col>
                            </b-row>
                        </b-col>
                    </b-row>
                    <hr>
                    <b-row>
                        <b-col md="2">
                            <span>
                                <label>
                                    Date
                                </label>
                            </span> <br>
                            <span>
                                {{ M_Quotation.date }}
                            </span>
                        </b-col>
                        <b-col md="2">
                            <span>
                                <label>
                                    Type
                                </label>
                            </span> <br>
                            <span>
                                {{ M_Quotation.type }}
                            </span>
                        </b-col>
                        <b-col md="2">
                            <span>
                                <label>
                                    Quotation Number
                                </label>
                            </span> <br>
                            <span>
                                {{ M_Quotation.quotation_no }}
                            </span>
                        </b-col>
                    </b-row>
                    <b-row>
                        <b-col>
                            <span>
                                {{ M_Quotation.project_name }}
                            </span>
                        </b-col>
                    </b-row>
                    <b-row>
                        <b-col>
                            <span>
                                {{ M_Quotation.descs }}
                            </span>
                        </b-col>
                    </b-row>
                    <b-row>
                        <b-col md="2">
                            <span>
                                <font-awesome-icon
                                    style="color: #333399;margin-right: 20px;"
                                    icon="coins"
                                    size="sm"
                                /> &nbsp;
                                <label>
                                    Project Value
                                </label>
                            </span>
                        </b-col>
                        <b-col md="2">
                            <span>
                                : Rp {{ M_Quotation.project_value }}
                            </span>
                        </b-col>
                    </b-row>
                    <b-row>
                        <b-col md="2">
                            <span>
                                <font-awesome-icon
                                    style="color: #333399;margin-right: 20px;"
                                    icon="coins"
                                    size="sm"
                                /> &nbsp;
                                <label>
                                    Valid Until
                                </label>
                            </span>
                        </b-col>
                        <b-col md="2">
                            <span>
                                : Rp {{ M_Quotation.valid_until }}
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
            M_Quotation: {
                customer: "",
                fulladdress: "",
                address: "",
                phone_no: "",
                email: "",
                website: "",
                pic: "",
                pic_phone_no: "",
                date: "",
                type: "",
                quotation_no: "",
                project_name: "",
                descs: "",
                project_value: "",
                valid_until: ""
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
            param.isEdit = true;
            this.$router.push({ name: "MK_AddQuotation", params: param });
        },
        M_ClearForm() {
            this.M_Quotation = {
                customer: "",
                fulladdress: "",
                address: "",
                phone_no: "",
                email: "",
                website: "",
                pic: "",
                pic_phone_no: ""
            };
        },
        GetDataBy() {
            var param = {
                option_url: "/MK/MK_Quotation",
                line_no: 0,
                id: this.paramFromList.row_id,
                lastupdatestamp: this.paramFromList.lastupdatestamp
            };

            this.getJSON(this.getUrlCRUD(), param).then(response => {
                // response from API
                console.log(response)
                if (response == null) return;

                var data = response.Data[0];

                this.M_Quotation = {
                    customer: data.name,
                    fulladdress: data.address + ", " + data.district + ", " + data.city + ", " + data.province + " - " + data.country,
                    address: data.address,
                    phone_no: (data.phone_no && data.phone_no !== '' ? data.phone_no : '-'),
                    email: (data.email && data.email !== '' ? data.email : '-'),
                    website: (data.website && data.website !== '' ? data.website : '-'),
                    pic: (data.contact_person && data.contact_person !== '' ? data.contact_person : '-'),
                    pic_phone_no: (data.contact_phone_no && data.contact_phone_no !== '' ? data.contact_phone_no : '-'),
                    date: (data.quotation_date && data.quotation_date !== '' ? this.momentDateFormatting(new Date(data.quotation_date),"DD-MM-YYYY HH.mm") : '-'),
                    type: (data.type && data.type !== '' ? data.type : '-'),
                    quotation_no: (data.quotation_no && data.quotation_no !== '' ? data.quotation_no : '-'),
                    project_name: (data.project_name && data.project_name !== '' ? data.project_name : '-'),
                    descs: (data.descs && data.descs !== '' ? data.descs : '-'),
                    project_value: (data.project_value && data.project_value !== '' ? this.isCurrency(data.project_value, this.decimal) : '-'),
                    valid_until: (data.expired_date && data.expired_date !== '' ? this.momentDateFormatting(new Date(data.expired_date),"DD-MM-YYYY") : '-'),
                }
            });
        }
    },
    mounted() {
        this.M_ClearForm();
        this.GetDataBy();
    }
};
</script>

<style>
</style>